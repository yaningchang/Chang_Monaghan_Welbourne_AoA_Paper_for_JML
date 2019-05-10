library(lme4)       # for lmer()
library(splines)

rm(list=ls())      # clear all variables in memory

data_phon <- readRDS("data_phon.rds")
data_sem <- readRDS("data_sem.rds")

#AoA Regression
f_naming <- lm(scale(log_op) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenSemN)+scale(cenNumF), data=data_phon)
print(summary(f_naming))

f_naming_aoa <- lm(scale(log_op) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenAoA)+scale(cenSemN)+scale(cenNumF), data=data_phon)
print(summary(f_naming_aoa))

f_LD <- lm(scale(log_os) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenSemN)+scale(cenNumF), data=data_sem)
print(summary(f_LD))

f_LD_aoa <- lm(scale(log_os) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenAoA)+scale(cenSemN)+scale(cenNumF), data=data_sem)
print(summary(f_LD_aoa))

#AoA Regression - interactions
f_naming_inter_freq_cons <- lm(scale(log_op) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenAoA)+scale(cenSemN)+scale(cenNumF)+scale(cenCons):scale(cenCumuFreq), data=data_phon)
print(summary(f_naming_inter_freq_cons))

f_naming_inter_aoa_cons <- lm(scale(log_op) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenAoA)+scale(cenSemN)+scale(cenNumF)+scale(cenCons):scale(cenAoA), data=data_phon)
print(summary(f_naming_inter_aoa_cons))

f_LD_inter_freq_cons <- lm(scale(log_os) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenAoA)+scale(cenSemN)+scale(cenNumF)+scale(cenCons):scale(cenCumuFreq), data=data_sem)
print(summary(f_LD_inter_freq_cons))

f_LD_inter_aoa_cons <- lm(scale(log_os) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenAoA)+scale(cenSemN)+scale(cenNumF)+scale(cenCons):scale(cenAoA), data=data_sem)
print(summary(f_LD_inter_aoa_cons))

#Test the effect of literacy onset
print(summary(f_naming_aoa))
f_naming_literacy_onset <- lm(scale(log_op) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenAoA)+scale(cenSemN)+scale(cenNumF)+Literacy_onset, data=data_phon)
print(summary(f_naming_literacy_onset))

anova(f_naming_literacy_onset, f_naming_aoa)

f_LD_literacy_onset <- lm(scale(log_os) ~ scale(cenCumuFreq)+scale(cenOrthN)+scale(cenCons)+scale(cenLen)+scale(cenConc)+scale(cenAoA)+scale(cenSemN)+scale(cenNumF)+Literacy_onset, data=data_sem)
print(summary(f_LD_literacy_onset))

anova(f_LD_literacy_onset, f_LD_aoa)

#Spline regression
aoa <- unique(data_phon$cenAoA)
M <- aoa[order(aoa)]
f_naming_spline <- lm(scale(log_op) ~ bs(cenAoA,knots=c(M[13]),degree=1) + scale(cenCumuFreq) + scale(cenOrthN) + scale(cenCons) + scale(cenLen) + scale(cenConc)+scale(cenSemN)+scale(cenNumF) ,data=data_phon)
print(summary(f_naming_spline))
anova(f_naming_spline, f_naming_aoa)

f_LD_spline <- lm(scale(log_os) ~ bs(cenAoA,knots=c(M[13]),degree=1) + scale(cenCumuFreq) + scale(cenOrthN) + scale(cenCons) + scale(cenLen) + scale(cenConc)+scale(cenSemN)+scale(cenNumF) ,data=data_sem)
print(summary(f_LD_spline))
anova(f_LD_spline, f_LD_aoa)
