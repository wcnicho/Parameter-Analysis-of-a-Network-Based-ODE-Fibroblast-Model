# Directory Info
- This directory is layed out how it would be found on the Palmetto Cluster
- The home directory is where all code and final results are stored

# Files
- FibroblastSNM_20220505.xlsx
  - Model
- snm_1_1_validation_rev3.xlsx
  - Validation data revison 3
- snm_1_1_validation_rev4.xlsx
  - Validation data revison 4
- runInt.txt
  - Helpful terminal commands

# Programs
- createDir.sh
  - Input arguments
    - None
	- Outputs
	  - mkdir /scratch1/\<user\>/\<name\>/\<tension\>
	
- generateBatch.m
  - Input arguments
	  - ODEfun: ODE function
		- loadParam: paramter loading function
		- modelType: Male, Female, Unreported, etc.
		- x: file number offset
	- Outputs
		- /scratch1/\<user\>/Valsim-%03d.sh
		
- submitBatch.sh
	- Input arguments
		- start_idx: start index for file Valsim-%03d.sh
	- Outputs
		- qsub ValidationSimulations_paramsweep.m
		- qstat
	
- ValidationSimulations_paramsweep.m
	- Input arguments
		- tension: Tension
		- dose: Dose
		- ODEfun: ODE function
		- loadParam: paramter loading function
		- name: Male, Female, Unreported, etc.
		- inputNames: AngIIin, TGFBin, etc. (see generateBatch.m)
	- Outputs
		- \<name\>/\<tension\>/\<dose\>_paramsweep_predictions.mat
		- \<name\>/\<tension\>/\<dose\>_paramsweep_inputs.mat
		- \<name\>/\<tension\>/\<dose\>_paramsweep_speciesNames.mat
	
- combData.m
	- Input arguments
		- modelType: Male, Female, Unreported, etc.
		- x: file number offset
	- Outputs
		- /scratch1/\<user\>/Comb-%03d.sh
		
- submitComb.sh
	- Input arguments
		- start_idx: start index for file Valsim-%03d.sh
	- Outputs
		- qsub ValidationAnalysis_paramsweep.m
		- qstat
		
- ValidationAnalysis_paramsweep.m
	- Input arguments
		- tension: Tension
		- dose: Dose
		- name: Male, Female, Unreported, etc.
	- Outputs
			/scratch1/\<user\>/\<name\>/\<tension\>/\<dose\>_accuracySweep.mat
			
	
- ValidationAnalysis_comb.m
	 -Input arguments:
		- name: Male, Female, Unreported, etc.
	- Outputs:
		- \<name\>_fullParamSweep.mat
	
- ValidationAnalysis_acc.m
	- Input arguments
		- None
	- Outputs
		- masterTable_paramsweep.mat

# Setup
	1. Run createDir.sh
	
# Getting data
	1. Run generateBatch as interactive job for each modelType
	2. Run submitBatch.sh for all Valsim-%03d.sh
	3. Combine all output_%03d.sh files (see runInt.txt)
	4. Delete all output_%03d.sh files (see runInt.txt)
	5. Run combData.m as interactive job for each modelType
	6. Run submitComb.sh for all Valsim-%03d.sh
	7. Combine all output_%03d.sh files (see runInt.txt)
	8. Delete all output_%03d.sh files (see runInt.txt)
	9. Run ValidationAnalysis_comb.m as interactive job
	10. Download <name>_fullParamSweep.mat from cluster
	11. Run ValidationAnalysis_acc.m on PC
