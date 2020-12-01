### 1 ####
library(psych)
library(summarytools)
library(dplyr)
library(ggplot2)

### 2 ###
MCA_dat<-read.csv(file="~/Desktop/EID_Data_MCAE2016 (3).csv")
View(MCA_dat)

### 3 ###
summarytools :: freq(MCA_dat)
summarytools :: descr(MCA_dat)

### 4 ###
MCA_dat <- MCA_dat %>% 
  dplyr::mutate(swl_mean = (swl01+swl02+swl03+swl04+swl05)/5, 
                meim_exp_mean = (meim01+meim02+meim04+meim08+meim10)/5,
                meim_com_mean = (meim03+meim06+meim05+meim07+meim09+meim11+meim12)/7)

MCA_dat %>% dplyr :: select(swl_mean, meim_exp_mean, meim_com_mean) %>% summarytools::descr()

### 5 ###
MCA_dat %>% dplyr::select (swl_mean, meim_exp_mean, meim_com_mean) %>% psych::corr.test()

MCA_dat.cor = cor(x = MCA_dat$swl_mean, y = MCA_dat$meim_exp_mean)

### 6 ###
model1 <- lm(swl_mean ~ meim_exp_mean + meim_com_mean, data = MCA_dat)
summary(model1)
confint(model1)

### 7 ###
meim_exp_scat <-ggplot2::ggplot(MCA_dat, aes(meim_exp_mean, swl_mean))
meim_exp_scat+
  geom_point()+
  labs(x = "meim_exp", y= "swl" )+
  geom_smooth (method = "lm", color = "#E69F00")

meim_com_scat <-ggplot2::ggplot(MCA_dat, aes(meim_com_mean, swl_mean))
meim_com_scat+
  geom_point()+
  labs(x = "meim_com", y= "swl" )+
  geom_smooth (method = "lm", color = "#E69F00")

### 8 ###
t.test(MCA_dat$meim_exp_mean ~ MCA_dat$firstgen)
t.test(MCA_dat$meim_exp_mean ~ MCA_dat$usborn)
t.test(MCA_dat$swl_mean ~ MCA_dat$firstgen)
t.test(MCA_dat$swl_mean ~ MCA_dat$usborn)
t.test(MCA_dat$meim_com_mean ~ MCA_dat$usborn)
t.test(MCA_dat$meim_com_mean ~ MCA_dat$firstgen)

### 9 ###

US_meim_exp <- ggplot2::ggplot(MCA_dat, aes (usborn, meim_exp_mean, fill=usborn))
US_meim_exp +
  geom_boxplot() +
  labs(x="US born", y="meim_exp")

US_meim_com <- ggplot2::ggplot(MCA_dat, aes (usborn, meim_com_mean, fill=usborn))
US_meim_com +
  geom_boxplot() +
  labs(x="US born", y="meim_com")

US_swl <- ggplot2::ggplot(MCA_dat, aes (usborn, swl_mean, fill=usborn))
US_swl +
  geom_boxplot() +
  labs(x="US born", y="swl")

first_meim_exp <- ggplot2::ggplot(MCA_dat, aes (firstgen, meim_exp_mean, fill=firstgen))
first_meim_exp +
  geom_boxplot() +
  labs(x="First Generation", y="meim_exp")

first_meim_com <- ggplot2::ggplot(MCA_dat, aes (firstgen, meim_com_mean, fill=firstgen))
first_meim_com +
  geom_boxplot() +
  labs(x="First Generation", y="meim_com")

first_swl <- ggplot2::ggplot(MCA_dat, aes (firstgen, swl_mean, fill=firstgen))
first_swl +
  geom_boxplot() +
  labs(x="First Generation", y="swl")

### 10 ###
meim_exp <- aov (meim_exp_mean ~ firstgen + usborn, data=MCA_dat)
summary(meim_exp)

meim_com <- aov (meim_com_mean ~ firstgen + usborn, data=MCA_dat)
summary(meim_com)

swl_anova <- aov (swl_mean ~ firstgen + usborn, data=MCA_dat)
summary(swl_anova)

### 11 ###
exp_boxplot <- ggplot2::ggplot(MCA_dat, aes (firstgen, meim_exp_mean, fill=usborn))
exp_boxplot +
  geom_boxplot() 

com_boxplot <- ggplot2::ggplot(MCA_dat, aes (firstgen, meim_com_mean, fill=usborn))
com_boxplot +
  geom_boxplot() 

swl_boxplot <- ggplot2::ggplot(MCA_dat, aes (firstgen, swl_mean, fill=usborn))
swl_boxplot +
  geom_boxplot() 








