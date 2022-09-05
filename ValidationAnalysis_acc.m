%% ValidationAnalysis_acc.m
% Created by Wesley Nichols 08-Jun-2022
% Edited 09-Jun-‎2022 WN: Added parsing for each model type
% Edited 24-Jun-2022 WN: Added comments, Cleaned up code

%% Housekeeping
clear
clc

%% Read Validation Spreadsheet
fileDir = 'snm_1_1_validation_rev4.xlsx';
typeNames = sheetnames(fileDir); %{'Female','Male','Pooled','Unreported'};

%% Parse Model Output and Validation Data
numNodes = zeros(1,length(typeNames));
for type_i = 1:length(typeNames)
    type = typeNames{type_i};
    expt = readtable(fileDir, 'Sheet', type);
    numNodes(type_i) = size(expt,1);
    load(append('Paramsweep\',type,'_fullParamSweep.mat'));
    accDat.(type) = sortrows(combTable,{'tension','dose','n','EC50'});
end

%% Combine Data from all Model Types
fnames = fieldnames(accDat);
masterTbl = accDat.(fnames{1});

for name_i = 2:length(fnames)
    accCol = accDat.(fnames{name_i})(:,end);
    masterTbl = [masterTbl,accCol];
end

%% Change NaN to Zero
for i=1:size(masterTbl,2)
    x = masterTbl{:,i};
    x(isnan(x)) = 0;
    masterTbl{:,i} = x;
end

%% Get Weighted Average
weight = numNodes./sum(numNodes);
totAcc = zeros(size(masterTbl,1),1);
for row_i = 1:size(masterTbl,1)
    totAcc(row_i) = sum(weight.*table2array(masterTbl(row_i,5:end)));
end

masterTbl.('total accuracy') = totAcc;

save('masterTable_paramsweep.mat',"masterTbl")