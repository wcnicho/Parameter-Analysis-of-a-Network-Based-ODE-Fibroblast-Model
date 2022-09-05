function generateBatch(ODEfun,loadParam,modelType,x)
% Created by Wesley Nichols 27-May-2022
% Edited 24-Jun-2022 WN: added LT handler, commented code

    cd('/scratch1/wcnicho');

    % set init vars based on LT
    if contains(modelType,'_LT')
        all_comb = flipud(combvec(0.5:0.05:1,0.1));
	inputNames = "{'E2in'}";
    else
        all_comb = flipud(combvec(0.5:0.05:1,0.4:0.05:0.7));
	inputNames = "{'AngIIin','TGFBin','IL6in','IL1in','TNFain','NEin','NEin','PDGFin','ET1in','NPin','E2in'}";
    end

    args = string(all_comb);
    args = append(args(1,:),',',args(2,:));

    all_comb_str = replace(string(all_comb),'.','_');
    all_comb_str = append(all_comb_str(1,:),'-',all_comb_str(2,:));

    %% create .sh file
    for i_name = (1:length(all_comb_str))+x
        name = sprintf('ValSim-%03d.sh',i_name);
        fileID = fopen(name,'w');
        fprintf(fileID,'#!/bin/bash\n#\n');
        fprintf(fileID,'#PBS -N ValSim-%03d\n',i_name);
        fprintf(fileID,'#PBS -l select=1:ncpus=24:mem=16gb:interconnect=fdr\n');
        fprintf(fileID,'#PBS -l walltime=0:15:00\n');
        fprintf(fileID,'#PBS -o output_%03d.txt\n',i_name);
        fprintf(fileID,'#PBS -j oe\n\n');
        fprintf(fileID,'cd $HOME\n');
        fprintf(fileID,'module load matlab/2021b\n');
        fprintf(fileID,'matlab -r "ValidationSimulations_paramsweep(%s,%s,%s,''%s'',%s)"',args(i_name-x),ODEfun,loadParam,modelType,inputNames);
        fclose(fileID);
    end
end

