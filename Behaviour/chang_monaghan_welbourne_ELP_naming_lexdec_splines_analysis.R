###### data origin is "restricted" ELP dataset, downloaded 3/5/18
###### http://elexicon.wustl.edu/default.asp

library(psych)
library(rms)
library(ggplot2)
library(splines)
library(plyr)
library(Hmisc)

setwd("~/Box Sync/papersonthego/AoA_Paper_for_JML/AoA_paper_-_Pre-_and_post_literacy_section")

aoa <- read.table("/Users/padraic/Box\ Sync/papersonthego/AoA_Paper_for_JML/AoA_paper_-_Pre-_and_post_literacy_section/ldname3.txt", sep=",",header=TRUE)
aoa$BG_Mean <- as.numeric(as.character(aoa$BG_Mean))
aoa$NPhon <- as.numeric(as.character(aoa$NPhon))
aoa$NSyll <- as.numeric(as.character(aoa$NSyll))
aoa$LgSUBTLWF[aoa$LgSUBTLWF=="NULL"] <- NA
aoa$I_LexDec_Mean_RT[aoa$I_LexDec_Mean_RT=="NULL"] <- NA
aoa$LgSUBTLWF <- as.numeric(as.character(aoa$LgSUBTLWF))
aoa$I_LexDec_Mean_RT <- as.numeric(as.character(aoa$I_LexDec_Mean_RT))
aoa$Conc.M[aoa$Conc.M=="NULL"] <- NA
aoa$Conc.M <- as.numeric(as.character(aoa$Conc.M))
aoa$I_NMG_Mean_RTlog <- log(aoa$I_NMG_Mean_RT)
aoa$I_LexDec_Mean_RTlog <- log(aoa$I_LexDec_Mean_RT)
aoa$Consist[aoa$Consist=="NULL"] <- NA
aoa$Consist <- as.numeric(as.character(aoa$Consist))

# select monosyllabic words with all psycholinguistic variables:
aoa <- subset(aoa, AoA>0 & Conc.M>0 & I_LexDec_Mean_RT>0 & Consist>0 & LgSUBTLWF>0 & NSyll==1)

# multiple regression analyses
fit <- lm(I_NMG_Mean_RT ~ AoA + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist, data = aoa)
fit_ld <- lm(I_LexDec_Mean_RT ~ AoA + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist, data = aoa)

# get descriptive statistics:
describe(aoa)

## using splines - this website is useful for reference:
# https://www.r-bloggers.com/splines-opening-the-black-box/

########### NAMING DATA ##############

# find knot(s) that minimises residual error, and print plot of residuals residuals_naming.pdf:
vk=seq(2.2,18.6,by=.1)
SSR=matrix(NA,length(vk))
for(i in 1:(length(vk))){
  k=vk[i]
  # reg=lm(I_NMG_Mean_RT~bs(AoA,knots=c(k),degree=1, Boundary.knots = c(2.2,18.7)) + Length + LgSUBTLWF + Ortho_N + Phono_N + BG_Mean + NPhon + NSyll,data=aoa)
  reg=lm(I_NMG_Mean_RT~bs(AoA,knots=c(k),degree=1) + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist,data=aoa)
  SSR[i]=sum(residuals(reg)^2)
  }
plot(vk,SSR,type="b",col="red", xlab="Age of Acquisition",ylab="Sum of Squared Residuals",xaxt="n")
axis(1,xaxp=c(2,18,8))

#so SSR minimised at knot = 15.9 years
K=c(15.9)
fit_s2 <- lm(I_NMG_Mean_RT ~ bs(AoA, knots=c(K),degree=1) + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist,data=aoa) 
fit_s2l <- lm(I_NMG_Mean_RT ~ AoA + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist,data=aoa) 
anova(fit_s2l,fit_s2)

# testing with rcs instead of bs, with up to 3 knots for AoA:
# this tests for nonlinearity as improvement in fit over linear with rcs:
fit_s2rcs <- ols(I_NMG_Mean_RT ~ rcs(AoA, 3) + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist,data=aoa) 
anova(fit_s2rcs)
# results indicate non-linear fit is not significant


######## LEXICAL DECISION DATA ##########
# find knot(s) that minimises residual error, and print plot of residuals residuals_lexdec.pdf:
SSR2=matrix(NA,length(vk))
for(i in 1:(length(vk))){
  k=vk[i]
  reg=lm(I_LexDec_Mean_RT~bs(AoA,knots=c(k),degree=1) + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist,data=aoa)
  SSR2[i]=sum(residuals(reg)^2)
  }
plot(vk,SSR2,type="b",col="blue", xlab="Age of Acquisition",ylab="Sum of Squared Residuals",xaxt="n")
axis(1,xaxp=c(2,18,8))

#so SSR2 minimised at knot = 6.8 years
L=c(6.8)
fit_s3 <- lm(I_LexDec_Mean_RT ~ bs(AoA, knots=c(L), degree=1) + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist,data=aoa) 
fit_s3l <- lm(I_LexDec_Mean_RT ~ AoA + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist,data=aoa) 
anova(fit_s3l,fit_s3)

# test for nonlinearity as improvement in fit over linear with rcs:
fit_s3rcs <- ols(I_LexDec_Mean_RT ~ rcs(AoA, 3) + Length + LgSUBTLWF + Ortho_N + Conc.M + Consist,data=aoa) 
anova(fit_s3rcs)



# draw graphs of fits

# make graph naming_splines.pdf
aoa$AoAint <- round(aoa$AoA)
aoa.cat <- ddply(aoa, c("AoAint"), summarise, N = length(I_NMG_Mean_RT), mean = mean(I_NMG_Mean_RT), sd   = sd(I_NMG_Mean_RT), se   = sd / sqrt(N))
fit_s22 <- lm(I_NMG_Mean_RT ~ bs(AoA, knots=c(K), degree=1) ,data=aoa) 
B=data.frame(AoA=vk)
Y=predict(fit_s22,newdata=B)

pdf(file="naming_splines.pdf", width=6, height=6)
errbar(aoa.cat$AoAint,aoa.cat$mean,aoa.cat$mean-aoa.cat$se,aoa.cat$mean+aoa.cat$se,cap=0.015,lty=1,lwd=1,xlab="AoA",ylab="Reaction Time",type="n", ylim=c(450,1000),xaxt="n",yaxt="n")
par(new=T)
lines(vk,Y,lwd=2,col="red",xlab="",ylab="",ylim=c(450,900),xaxt="n",yaxt="n")
axis(1,xaxp=c(2,18,8))
axis(2,xaxp=c(450,900,9))
dev.off()

# make graph lexdec_splines.pdf
aoa.cat2 <- ddply(aoa, c("AoAint"), summarise, N = length(I_LexDec_Mean_RT), mean = mean(I_LexDec_Mean_RT), sd   = sd(I_LexDec_Mean_RT), se   = sd / sqrt(N))
fit_s55 <- lm(I_LexDec_Mean_RT ~ bs(AoA, knots=c(L), degree=1) ,data=aoa) 
B=data.frame(AoA=vk)
Z=predict(fit_s55,newdata=B)

pdf(file="lexdec_splines.pdf", width=6, height=6)
errbar(aoa.cat2$AoAint,aoa.cat2$mean,aoa.cat2$mean-aoa.cat2$se,aoa.cat2$mean+aoa.cat2$se,cap=0.015,lty=1,lwd=1,xlab="AoA",ylab="Reaction Time",type="n", ylim=c(450,1000),xaxt="n",yaxt="n")
par(new=T)
lines(vk,Z,lwd=2,col="blue",xlab="",ylab="",ylim=c(450,900),xaxt="n")
axis(1,xaxp=c(2,18,8))
axis(2,xaxp=c(450,900,9))
dev.off()
