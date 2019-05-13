%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Please refer to Chang, Monaghan and Welbourne (2019) paper for the model architecture and training/testing procedures. The simulations are developed using the Mikenet simulator
(http://www.cnbc.cmu.edu/~mharm/research/tools/mikenet/).

Created by Ya-Ning Chang, 10 May 2019
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Simulation 1 folder contains all of the files needed to train and test the simulations.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Model (incl. examples):
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

README: Examples are provided, including commands and parameters for training and testing the AoA model


Executable files (for running in linux or mac terminal):
aoa_reading: training the AoA reading model
aoa_pretraining: pertaining the AoA reading model (Oral language training)
aoa_reading_evaluator: evaluating the model’s reading performance
aoa_pretraining_evaluator: evaluating the model’s oral language performance after pertaining


Training example files (*.pat):
englishdict_randcon.pat: training examples of the reading task (6229 monosyllabic words)
sp.pat: training examples of the speaking task
ps_randcon.pat: training examples of the listening comprehension task
phono.pat: training examples of the phonological attractor task
sem.pat: training examples of the semantic attractor task
glushkoGPR_hscoding.pat and glushkoGPE_hscoding: nonword stimuli from Glushko’s (1979) study
beNW_hscoding.pat: nonword stimuli from McCann and Besner’s (1987) study


Matlab files:
6ksem.mat: semantic vectors
examine_semantic_output_aoa: compute semantic accuracy and error scores generated from the evaluator output


Other files required for training or testing:
6kdict: the information (frequency, orthography, and phonology) about the training set
mapping: phonemic features for each letter
aoa_training_intermix.txt: training ratios
probabilities.txt: AoA 1-14 stages of training probabilities
glushkoGPR_hscoding.txt, glushkoGPE_hscoding.txt, and beNW_hscoding.txt: the information about the nonword testing sets

%%%%%%%%%%%%%%%%%
Weight files:
%%%%%%%%%%%%%%%%%

Oral: Weight files of the ten versions of the AoA model at the end of the oral language training, including the weights for the speaking task (SP), for the hearing task (PS) and the combination of both (Oral).

Reading: Weight files of the ten versions of the AoA model at the end of the reading training. These are the weights used in the Chang, Monaghan and Welbourne paper.

%%%%%%%%%%%%%%%%%
Data:
%%%%%%%%%%%%%%%%%

R script and datasets for the regression analyses on model performance.

