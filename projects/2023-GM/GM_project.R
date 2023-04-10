#### META ####

# INSTALATION (Wip)
install.packages("dplyr")
install.packages("rio")
install.packages("codebook")

# load packages
library(rio)      # for importing data files
library(dplyr)    # for data cleaning
library(codebook) # for reverse scoring

# working directory -> where R is right now
getwd()
# C:/Users/mormi/OneDrive/Documents/nice-ra/projects/2023-GM
  #this was a pain#

# import the data
data_peer <-rio::import(file = "data_peer.sav")
data_self <-rio::import(file = "data_self.sav")

View(data_peer)
View(data_self)

# dictionary
dict_peer <-rio::import(file = "dict_peer.csv")
dict_self <-rio::import(file = "dict_self.csv")

View(dict_peer)
View(dict_self)

#### Recoding Variables ####

# Scale Score for Peer Courage
courage_peer_I <- dict_peer %>%
  dplyr::filter(scale == "VIA Courage") %>%
  pull(variable)
data_peer$courage_peer <-data %>%
  dplyr::select(all_of(courage_peer_I)) %>% 
  rowMeans(na.rm = TRUE)
  
# Averaged scores with multiple informants
peer_avg <- data_peer %>% group_by(ID) %>%
  summarize(courage_peer =mean(data_peer$courage_peer, na.rm=TRUE))

