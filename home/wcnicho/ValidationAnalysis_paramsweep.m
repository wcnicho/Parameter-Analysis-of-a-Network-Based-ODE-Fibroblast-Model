function ValidationAnalysis_paramsweep(tension,dose,name)
% Created 14-Apr-2020 JR
% Edited 26-May-2022 WN: remove input/output differentiation
% Edited 01-Jun-2022 WN: update validation sheet
% Edited 26-Jun-2022 WN: narrow search results

tension = replace(string(tension),'.','_');
dose = replace(string(dose),'.','_');

fprintf('%s\n',pwd);
addpath(pwd);

cd('/scratch1/wcnicho');
fprintf('%s\n',pwd);


%% import data
fprintf("Loading Data...\n")
filedir = append(name,'/',tension,'/',dose,'_paramsweep_speciesNames.mat');
load(filedir)
filedir = append(name,'/',tension,'/',dose,'_paramsweep_predictions.mat');
load(filedir)
filedir = append(name,'/',tension,'/',dose,'_paramsweep_inputs.mat');
load(filedir)

%% Import/process experimental validation (expt)
filedir = "snm_1_1_validation_rev4.xlsx";
expt = readtable(filedir, 'Sheet', name);
%opts = detectImportOptions(filedir);
%expt = readtable(filedir,opts);

% convert 'Measurement' strings to match prediction table (ie. integers)
expt.Measurement(strcmp(expt.Measurement,'Increase')) = {1};
expt.Measurement(strcmp(expt.Measurement,'Decrease')) = {-1};
expt.Measurement(strcmp(expt.Measurement,'No Change')) = {0};
expt.Measurement = cell2mat(expt.Measurement);
% convert 'Prediction' strings to match prediction table
expt.Prediction(strcmp(expt.Prediction,'Increase')) = {1};
expt.Prediction(strcmp(expt.Prediction,'Decrease')) = {-1};
expt.Prediction(strcmp(expt.Prediction,'No Change')) = {0};
expt.Prediction(strcmp(expt.Prediction,'NA')) = {0};
expt.Prediction = cell2mat(expt.Prediction);
expt.Properties.VariableNames(5) = {'SNM_1_0_1pct'};

% subset into in-out/in-med
% expt_med = expt(strcmp(expt.in_out,"in-med"),:);
% expt(strcmp(expt.in_out,"in-med"),:) = [];

modelpath = 'FibroblastSNM_20220505.xlsx';
sheetname = "reactions";
opts = detectImportOptions(modelpath,"Sheet",sheetname,"VariableNamesRange",'A2');
snm = readtable(modelpath, opts);
idx_rxns = find(strcmpi(snm.module,"output"));
snm_rxns = split(snm.Rule(idx_rxns)," => ");
snm_outputs = unique(snm_rxns(:,end));
outputs_idx = zeros(length(snm_outputs),1);

%% Process simulation predictions (pred)
% 05.11.2020 JR: loop for parameter sweep values
n_sweep = 1.05:0.05:2;
EC50_sweep = 0.4:0.05:0.8;
correct_sweep = [];
inputNames = cell2table(inputNames.','VariableNames',{'input'});

for n_i = 1:size(predictions,3)
    for EC50_i = 1:size(predictions,4)
        % create prediction tables
        pred_full = array2table(predictions(:,:,n_i,EC50_i),'VariableNames',speciesNames.');
        pred_full = [inputNames pred_full];

        outputs_pred = pred_full.Properties.VariableNames;
        pred = pred_full(:,2:end);

        %% Combine expt/pred tables (in-out):
        % Convert pred table to long-form
        pred.Input = pred_full.input;
        pred_long = stack(pred,1:width(pred)-1);    % stack all vars except input
        pred_long.Properties.VariableNames = {'Input','Output','SNM_1_1'};
        pred_long.ID_pred = (1:height(pred_long)).';
        pred_long.Output = cellstr(string(pred_long.Output));    % match class with expt
        % join pred with expt based on matching fields: Input, Output
        joined = innerjoin(expt,pred_long,'Keys',{'Input','Output'});
        % Test for equivalence between measurements/predictions
        joined.Correct_1_1 = (joined.Measurement == joined.SNM_1_1);
        % Get percentage of correct predictions
        s = summary(joined);
        pct_1_1 = s.Correct_1_1.True / s.Correct_1_1.Size(1);

        % Save results
        correct_sweep = [correct_sweep;n_sweep(n_i) EC50_sweep(EC50_i) pct_1_1];
    end
end

correct_sweep = array2table(correct_sweep,'VariableNames',["n" "EC50" "accuracy"]);
save(append(name,'/',tension,'/',dose,'_accuracySweep.mat'),'correct_sweep');%'/scratch1/wcnicho/'
