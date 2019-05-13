%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Please refer to Chang, Monaghan and Welbourne (2019) paper for the model architecture and training/testing procedures. The simulations are run using the Mikenet simulator
(http://www.cnbc.cmu.edu/~mharm/research/tools/mikenet/).

Created by Ya-Ning Chang, 10 May 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Simulation 2 folder contains the files for training and testing the Random AoA model. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Model:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Executable files (for running in linux or mac terminal)
random_aoa_reading: training the Random AoA reading model
random_aoa_pretraining: pertaining the Random AoA reading model (Oral language training)
random_aoa_reading_evaluator: evaluating the Random model’s reading performance
random_aoa_pretraining_evaluator: evaluating the Random model’s oral language performance after pertaining

Training example files (*.pat):
The same as those in Simulation 1.

Matlab files:
The same as those in Simulation 1.

Other files required for training or testing:
probabilities_random.txt: Random AoA 1-14 stages of training probabilities
All other files are the same as those in Simulation 1.

%%%%%%%%%%%%%%%%%
Weight files:
%%%%%%%%%%%%%%%%%

Oral: Weight files of the ten versions of the Random AoA model at the end of the oral language training, including the weights for the speaking task (SP), for the hearing task (PS) and the combination of both (Oral).

Reading: Weight files of the ten versions of the Random AoA model at the end of the reading training. These are the weights used in the Chang, Monaghan and Welbourne paper.

%%%%%%%%%%%%%%%%%
Data:
%%%%%%%%%%%%%%%%%

R script and datasets for the regression analyses on Random AoA model performance.

