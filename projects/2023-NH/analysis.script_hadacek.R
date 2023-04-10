###
# 4/8/23
# Nick Hadacek
# PSY4994V Final Project
###

# LOADING PACKAGES ####

install.packages("ggplot2") #for data visualization
install.packages("dplyr") #for data management
install.packages("cowplot") #combining graphs if needed
install.packages("psych") #easier correlation
install.packages("apaTables") #APA-ready tables
install.packages("rio") #for importing data
install.packages("sjPlot") #ggplot2 add-on

library(ggplot2)
library(dplyr)
library(cowplot)
library(psych)
library(apaTables)
library(rio)
library(sjPlot)

sessionInfo()
#R version 4.2.3
#ggplot2_3.4.2
#dplyr_1.1.1
#cowplot_1.1.1
#psych_2.3.3 
#apaTables_2.0.8
#rio_0.5.29
#sjPlot_2.8.14 

getwd()
#C:/Users/nickh/OneDrive/Desktop/Working Directory

# IMPORTING DATA ####

# import data 
data_peer <- rio::import(file = "data_peer.sav")
data_self <- rio::import(file = "data_self.sav")

# import dictionary 
dict_peer <- rio::import(file = "dict_peer.xlsx")
dict_self <- rio::import(file = "dict_self.xlsx")

# DATA CLEANING AND ORGANIZATION ####

# creating peer conscientiousness variable 
consci_items_peer <- dict_peer %>% 
  filter(scale == "BFAS Conscientiousness") %>% 
  pull(variable)
data_peer$consci_peer <- data_peer %>% 
  select(all_of(consci_items_peer)) %>% 
  rowMeans(na.rm = TRUE)

# averaging informants responding about same participant 
peer_group <- data_peer %>% group_by(ID) %>% 
  summarise(consci_peer = mean(consci_peer,na.rm = TRUE),
            .groups = 'drop')

# creating self conscientiousness variable 
consci_items_self <- dict_self %>% 
  filter(scale == "BFAS Conscientiousness") %>% 
  pull(variable)
data_self$consci_self <- data_self %>% 
  select(all_of(consci_items_self)) %>% 
  rowMeans(na.rm = TRUE)

# creating pid rigid perfectionism variable 
pid_items <- dict_self %>% 
  filter(scale == "PID Miscellaneous") %>% 
  pull(variable)
data_self$pid <- data_self %>% 
  select(all_of(pid_items)) %>% 
  rowMeans(na.rm = TRUE)

# creating pil variable 
pil_items <- dict_self %>% 
  filter(scale == "PIL Purpose in Life") %>% 
  pull(variable)
data_self$pil <- data_self %>% 
  select(all_of(pil_items)) %>% 
  rowMeans(na.rm = TRUE)

# creating neuroticism variable 
neuro_items <- dict_self %>% 
  filter(scale == "BFAS Neuroticism") %>% 
  pull(variable)
data_self$neuro <- data_self %>% 
  select(all_of(neuro_items)) %>% 
  rowMeans(na.rm = TRUE)

# creating withdrawal variable 
withdraw_items <- dict_self %>% 
  filter(subscale == "BFAS Withdrawal") %>% 
  pull(variable)
data_self$withdraw <- data_self %>% 
  select(all_of(withdraw_items)) %>% 
  rowMeans(na.rm = TRUE)

# merging dataframes 
jointdataset <- merge(data_self, peer_group, by = 'ID')

# creating conscientiousness difference score 
jointdataset <- jointdataset %>% 
  dplyr::mutate(consci_dif = (consci_peer - consci_self))

# DATA VISUALIZATION ####

sconsci_dat_descr <- data.frame(describe(jointdataset$consci_self), 
                                row.names = "sconsci_dat_descr")
pconsci_dat_descr <- data.frame(describe(jointdataset$consci_peer), 
                                row.names = "pconsci_dat_descr")
pid_dat_descr <- data.frame(describe(jointdataset$pid), 
                            row.names = "pid_dat_descr")
pil_dat_descr <- data.frame(describe(jointdataset$pil), 
                            row.names = "pil_data_descr")
neuro_dat_descr <- data.frame(describe(jointdataset$neuro), 
                              row.names = "neuro_data_descr")
withdraw_dat_descr <- data.frame(describe(jointdataset$withdraw), 
                                 row.names = "withdraw_dat_descr")

dat.df <- t(rbind.data.frame(sconsci_dat_descr, pconsci_dat_descr, 
                             pid_dat_descr, pil_dat_descr,neuro_dat_descr, 
                             withdraw_dat_descr))

corr.test(jointdataset$consci_peer, jointdataset$consci_self)

# REGRESSION ANALYSIS ####

## simple regression ####
simple_regression <- lm(consci_dif ~ pid, data = jointdataset)
summary(simple_regression)

#interpret

#consci_dif = -0.08835(pid) + 0.34236, p = .10035
#for every increase of one in pid, consci_dif decreases by -.09. 
#result is insignificant (p>.05)

#visualize
ggplot(jointdataset, aes(pid, consci_dif)) +
  geom_point(color = "#f1c232") +
  geom_smooth(method = "lm", color = "#710c0c") +
  labs(title = "Conscientiousness Difference Score X Rigid Perfectionism", x = "Rigid Perfectionism", 
       y = "Conscientiousness Difference Score")

#correlation test
cor(jointdataset$consci_dif, jointdataset$pid, use = "pairwise")

## multiple regression ####
multiple_regression <- lm(consci_dif ~ pid + pil + neuro + withdraw, 
                          data = jointdataset)
summary(multiple_regression)

#interpret

#consci_dif = -0.14248(pid) - 0.09772(pil) - 0.10898(neuro) + 0.22687(withdraw), 
#p = 0.0104
#for every increase of one in pid, consci_dif decreases by .14 when controlling 
#for pil, neuro, and withdraw
#result is significant (p<.05)

apaTables::apa.reg.table(multiple_regression, 
                         filename = "conscidifXpid_regtable.gdoc")

plot_model(multiple_regression, type = "slope")
