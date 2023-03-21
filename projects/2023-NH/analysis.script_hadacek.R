#######################
# 2/27/23
# Nick Hadacek
# PSY4994V Final Project
#######################

### LOADING PACKAGES ###

install.packages("ggplot2") #for data visualization
install.packages("dplyr") #for data management
install.packages("cowplot") #combining graphs if needed
install.packages("psych") #easier correlation
install.packages("apaTables") #APA-ready tables
install.packages("haven") #i don't remember what this was for
install.packages("readr") #this either
install.packages("rio") #for importing data

library(ggplot2)
library(dplyr)
library(cowplot)
library(psych)
library(apaTables)
library(haven)
library(readr)
library(rio)

sessionInfo()
#R version 4.2.2
#ggplot2_3.4.1
#dplyr_1.1.0
#cowplot_1.1.1
#psych_2.2.9 
#apaTables_2.0.8
#haven_2.5.1
#readr_2.1.4
#rio_0.5.29

getwd()
#C:/Users/nickh/OneDrive/Desktop/Working Directory

### IMPORTING DATA ###

#import data
data_peer <- rio::import(file = "data_peer.sav")
data_self <- rio::import(file = "data_self.sav")

#import dictionary
dict_peer <- rio::import(file = "dict_peer.xlsx")
dict_self <- rio::import(file = "dict_self.xlsx")

### DATA CLEANING AND ORGANIZATION ###

#creating peer conscientiousness variable
consci_items_peer <- dict_peer %>% 
  filter(scale == "BFAS Conscientiousness") %>% 
  pull(variable)
data_peer$consci_peer <- data_peer %>% 
  select(all_of(consci_items_peer)) %>% 
  rowMeans(na.rm = TRUE)

#averaging informants responding about same participant
peer_group <- data_peer %>% group_by(ID) %>% 
  summarise(consci_peer = mean(data_peer$consci_peer,na.rm = TRUE),
            .groups = 'drop')

#creating self conscientiousness variable
consci_items_self <- dict_self %>% 
  filter(scale == "BFAS Conscientiousness") %>% 
  pull(variable)
data_self$consci_self <- data_self %>% 
  select(all_of(consci_items_self)) %>% 
  rowMeans(na.rm = TRUE)

#creating pid rigid perfectionism variable
pid_items <- dict_self %>% 
  filter(scale == "PID Miscellaneous") %>% 
  pull(variable)
data_self$pid <- data_self %>% 
  select(all_of(pid_items)) %>% 
  rowMeans(na.rm = TRUE)

#creating pil variable
pil_items <- dict_self %>% 
  filter(scale == "PIL Purpose in Life") %>% 
  pull(variable)
data_self$pil <- data_self %>% 
  select(all_of(pil_items)) %>% 
  rowMeans(na.rm = TRUE)

#creating neuroticism variable
neuro_items <- dict_self %>% 
  filter(scale == "BFAS Neuroticism") %>% 
  pull(variable)
data_self$neuro <- data_self %>% 
  select(all_of(neuro_items)) %>% 
  rowMeans(na.rm = TRUE)

#creating withdrawal variable
withdraw_items <- dict_self %>% 
  filter(scale == "BFAS Withdrawal") %>% 
  pull(variable)
data_self$withdraw <- data_self %>% 
  select(all_of(withdraw_items)) %>% 
  rowMeans(na.rm = TRUE)

#merging dataframes
jointdataset <- merge(data_self, peer_group, by = 'ID')

#creating conscientiousness difference score
jointdataset <- jointdataset %>% 
  dplyr::mutate(consci_dif = (consci_peer - consci_self))
