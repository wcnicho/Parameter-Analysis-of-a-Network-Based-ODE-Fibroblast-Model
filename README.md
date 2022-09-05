# Parameter-Analysis-of-a-Network-Based-ODE-Fibroblast-Model
- This project was created to find the optimal values for EC50, n, tension, and dose through a parameter sweep based on code created by [Jesse Rogers et al.](https://doi.org/10.7554/eLife.62856)
- A n updated model created by Kelsey Watts et al. was used
- Information about each file can be found in their sub directories under thier respective 'README.md'

# Files
- masterTable_paramsweep.mat
  - list of all parmaters and their associated accuracies for each respective ODE and its total weighted accuracy
- ValidationAnalysis_acc.m
  - code to combine all data from each ODE into 'masterTable_paramsweep.mat'
