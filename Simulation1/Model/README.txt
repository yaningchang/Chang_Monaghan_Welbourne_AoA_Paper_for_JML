#######################################################################################################
# Training the AoA model - Pretraining (oral language training) and Reading training
# Executable files : aoa_pretraining and aoa_reading
# Parameters: 
# -seed : random seed for initial weights (integer)
# -iteration: training times
# -trained_weight: load the trained weight to the model
#######################################################################################################
To train the model, enter the following commands in linux or mac terminal:
Note: We have provided two different sets of executiable files for linux and mac. Please rename the files before running the following commands. e.g., for linux terminal: rename aoa_pretraining_linux to aoa_pretraining


e.g. pretraining the AoA reading model 
./aoa_pretraining -seed 1 -epsilon 0.05 -iteration 600000

e.g. training the AoA reading model and load the pretrained weight
./aoa_reading -seed 1 -epsilon 0.05 -trained_weight ../Weights/Oral/Oral_Weight_v1


#######################################################################################################
# Testing the model's phonological performance and semantic performance
# Executable file : aoa_pretraining_evaluator and aoa_reading_evaluator
# Parameters:
# -key: the information about the training set
# -patterns: testing set (e.g., englishdict_randcon.pat) 
# -semantic: test the model's semantic performance (without this index, the default is to test the model's phonological performance) 
# -weights: trained weight
# >:  output file 
#######################################################################################################
To test the model, enter the following commands in linux or mac terminal:
Note: We have provided two different sets of executiable files for linux and mac. Please rename the files before running the following commands. e.g., for linux terminal: rename aoa_pretraining_evaluator_linux to aoa_pretraining_evaluator

e.g. for listening comprehension (PS)
./aoa_pretraining_evaluator -key 6kdict -patterns ps_randcon.pat -semantic -weights ../Weights/Oral/PS_Weight_v1 > ps_1.txt

e.g. for speaking (SP)
./aoa_pretraining_evaluator -key 6kdict -patterns sp.pat -weights ../Weights/Oral/SP_Weight_v1 > sp_1.txt

e.g. for word comprehension (OS)
./aoa_reading_evaluator -key 6kdict -patterns englishdict_randcon.pat -semantic -weights ../Weights/Reading/Reading_Weight_v1 > os_1.txt

e.g. for word naming (OP)
./aoa_reading_evaluator -key 6kdict -patterns englishdict_randcon.pat -weights ../Weights/Reading/Reading_Weight_v1 > op_1.txt

e.g. for nonword naming (OP)
./aoa_reading_evaluator -key glushkoGPR_hscoding.txt -patterns glushkoGPR_hscoding.pat -weights ../Weights/Reading/Reading_Weight_v1 > glushkoGPRNW_1.txt
./aoa_reading_evaluator -key beNW_hscoding.txt -patterns beNW_hscoding.pat -weights ../Weights/Reading/Reading_Weight_v1 > beNW_1.txt


The evaluator output format:
For phonology, column names are 'test_name', 'item_id_in_the_training_set', 'word',  'correctness', 'error score'
For semantics, column names are 'test_name', 'item_id_in_the_training_set', 'word', 'unit activation....'

To further compute the accuracy and error scores (euclidean distance) for semantics, a Matlab function is provided    
e.g. In the Matlab terminal, enter:
>> examine_semantic_output_aoa('ps_1.txt')
and this will generate an output file 'nearest_ps_1.txt'
