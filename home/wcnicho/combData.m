function combData(modelType,x)
% Created by Wesley Nichols 27-May-2022
% Edited 24-Jun-2022 WN: added LT handler, commented code

    cd('/scratch1/wcnicho');

    % set init var based on LT status
    if contains(modelType,'_LT')
        all_comb = flipud(combvec(0.5:0.05:1,0.1));
    else
        all_comb = flipud(combvec(0.5:0.05:1,0.4:0.05:0.7));
    end

    args = string(all_comb);
    args = append(args(1,:),',',args(2,:));

    all_comb_str = replace(string(all_comb),'.','_');
    all_comb_str = append(all_comb_str(1,:),'-',all_comb_str(2,:));

    %% create .sh file
    for i_name = (1:length(all_comb_str))+x
        name = sprintf('CombSim-%03d.sh',i_name);
        fileID = fopen(name,'w');
        fprintf(fileID,'#!/bin/bash\n#\n');
        fprintf(fileID,'#PBS -N Comb-%03d\n',i_name);
        fprintf(fileID,'#PBS -l select=1:ncpus=6:mem=20gb:interconnect=fdr\n');
        fprintf(fileID,'#PBS -l walltime=0:05:00\n');
        fprintf(fileID,'#PBS -o output_%03d.txt\n',i_name);
        fprintf(fileID,'#PBS -j oe\n\n');
        fprintf(fileID,'cd $HOME\n');
        fprintf(fileID,'module load matlab/2021b\n');
        fprintf(fileID,'matlab -r "ValidationAnalysis_paramsweep(%s,''%s'')"',args(i_name-x),modelType);
        fclose(fileID);
    end
end
