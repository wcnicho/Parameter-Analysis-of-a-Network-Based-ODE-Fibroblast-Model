function ValidationAnalysis_comb(name)
% Created by Wesley Nichols 27-May-2022
% Edited 02-Jun-2022 WN: expand for LT
% Edited 06-Jun-2022 WN: Add missing file handler
% Edited 24-Jun-2022 WN: Add comments, clean up code

    %% create all combonations tension, dose, n, EC50
    tension_sweep = [0.1,0.4:0.05:0.7];
    dose_sweep = 0.5:0.05:1;
    cs = flipud(combvec(NaN,0.4:0.05:0.8,1.05:0.05:2))';
    empty_sweep = table(cs(:,1),cs(:,2),cs(:,3),'VariableNames',{'n','EC50','accuracy'});

    combTable=table;
    for tension = tension_sweep
        for dose = dose_sweep
            tens_i = replace(string(tension),'.','_');
            dose_i = replace(string(dose),'.','_');
            filedir = append('/scratch1/wcnicho/',name,'/',tens_i,'/',dose_i,'_accuracySweep.mat');
	    correct_sweep = [];

	    %% missing file handler
	    try
                correct_sweep = load(filedir);
		correct_sweep = correct_sweep.correct_sweep;
	    catch ME
		if(strcmp(ME.identifier,'MATLAB:load:couldNotReadFile'))
		    msg = sprintf('%s\n%s',ME.identifier,ME.message);
		    warning(msg);
		else
		    rethrow(ME);
		end
	    end
	    tot_sweep = [correct_sweep;empty_sweep];
	    [~,row] = unique(tot_sweep(:,1:end-1),'rows');
	    correct_sweep = tot_sweep(row,:);

            % create table header
	    val_tens = repmat(tension,size(correct_sweep,1),1);
            val_dose = repmat(dose,size(correct_sweep,1),1);
            header = table(val_tens,val_dose,'VariableNames',{'tension','dose'});

	    % create table
            if isempty(combTable)
                combTable = [header,correct_sweep];
            else
                combTable = [combTable; header,correct_sweep];
            end
        end
    end

    % post-processing and save
    combTable = renamevars(combTable,'accuracy',append(name,' accuracy'));
    combTable = sortrows(combTable,{'tension','dose','n','EC50'});
    save(append(name,'_fullParamSweep.mat'),'combTable');
end
