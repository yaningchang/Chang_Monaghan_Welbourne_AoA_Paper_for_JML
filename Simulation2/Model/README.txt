#######################################################################################################
# Training the Random AoA model - Pretraining (oral language training) and Reading training
# Executable files : random_aoa_pretraining and random_aoa_reading
# Parameters: 
# -seed : random seed for initial weights (integer)
# -iteration: training times
# -trained_weight: load the trained weight to the model
#######################################################################################################
To train the model, enter the following command in linux or mac terminal:
Note: We have provided two different sets of executiable files for linux and mac. Please rename the files before running the following commands. e.g., for linux terminal: rename random_aoa_pretraining_linux to random_aoa_pretraining

e.g. pretraining the Ramdom AoA reading model 
./random_aoa_pretraining -seed 1 -epsilon 0.05 -iteration 600000

e.g. training the Random AoA reading model and load the pretrained weight
./random_aoa_reading -seed 1 -epsilon 0.05 -trained_weight ../Weights/Oral/RandomAoA_Oral_Weight_v1


#######################################################################################################
# Testing the model's phonological performance and semantic performance
# Executable file : random_aoa_pretraining_evaluator and random_aoa_reading_evaluator
# Parameters:
# -key: the information about the training set
# -patterns: testing set (e.g., englishdict_randcon.pat) 
# -semantic: test the model's semantic performance (without this index, the default is to test the model's phonological performance) 
# -weights: trained weight
# >:  output file 
#######################################################################################################
To test the model, enter the following command in linux or mac terminal:
Note: We have provided two different sets of executiable files for linux and mac. Please rename the files before running the following commands. e.g., for linux terminal: rename random_aoa_pretraining_evaluator_linux to random_aoa_pretraining_evaluator

e.g. for hearing (PS)
./random_aoa_pretraining_evaluator -key 6kdict -patterns ps_randcon.pat -semantic -weights ../Weights/Oral/RandomAoA_PS_Weight_v1 > ps_1.txt

e.g. for speaking (SP)
./random_aoa_pretraining_evaluator -key 6kdict -patterns sp.pat -weights ../Weights/Oral/RandomAoA_SP_Weight_v1 > sp_1.txt

e.g. for word comprehension (OS)
./random_aoa_reading_evaluator -key 6kdict -patterns englishdict_randcon.pat -semantic -weights ../Weights/Reading/RandomAoA_Reading_Weight_v1 > os_1.txt

e.g. for word naming (OP)
./random_aoa_reading_evaluator -key 6kdict -patterns englishdict_randcon.pat -weights ../Weights/Reading/RandomAoA_Reading_Weight_v1 > op_1.txt

The evaluator output format:
For phonology, column names are 'test_name', 'item_id_in_the_training_set', 'word',  'correctness', 'error score'
For semantics, column names are 'test_name', 'item_id_in_the_training_set', 'word', 'unit activation....'

To further compute the accuracy and error scores (euclidean distance) for semantics, a Matlab function is provided    
e.g. In the Matlab terminal, enter:
>> examine_semantic_output_aoa('ps_1.txt')
and this will generate an output file 'nearest_ps_1.txt'
