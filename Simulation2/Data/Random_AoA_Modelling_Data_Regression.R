library(lme4)       # for lmer()
library(splines)

rm(list=ls())      # clear all variables in memory

data_phon <- readRDS("random_aoa_data_phon.rds")
data_sem <- readRDS("random_aoa_data_sem.rds")

#Random AoA Regression
f_naming <- lm(scale(log_op) ~ scale(cenLogFreq)+scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenNumF)+scale(cenSemN), data=data_phon)
print(summary(f_naming))

f_naming_aoa <- lm(scale(log_op) ~ scale(cenLogFreq)+scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenNumF)+scale(cenSemN)+scale(cenAoA), data=data_phon)
print(summary(f_naming_aoa))

f_LD<- lm(scale(log_os) ~ scale(cenLogFreq)+scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenNumF)+scale(cenSemN), data=data_sem)
print(summary(f_LD))

f_LD_aoa <- lm(scale(log_os) ~ scale(cenLogFreq)+scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenNumF)+scale(cenSemN)+scale(cenAoA), data=data_sem)
print(summary(f_LD_aoa))
