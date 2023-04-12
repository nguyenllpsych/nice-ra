#### META ####

# INSTALATION (Wip)
install.packages("dplyr")
install.packages("rio")
install.packages("codebook")
install.packages("ggplot2") 
install.packages("sjPlot")
install.packages("apaTables")
install.packages("cowplot") 
install.packages("psych") 

# load packages
library(rio)      # for importing data files
library(dplyr)    # for data cleaning
library(codebook) # for reverse scoring
library(ggplot2)  # customizable graphs
library(sjPlot)   # to make ggplot2 more complicated
library(apaTables)# APA stuff
library(cowplot)
library(psych)



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

# Self Courage Score Variable
Courage_Items_self <- dict_self %>%
  filter(scale == "VIA Courage") %>%
  pull(variable)
data_self$courage_self <- data_self %>%
  select(all_of(Courage_Items_self)) %>%
  rowMeans(na.rm = TRUE)


# Scale Score for Peer Courage
courage_peer_I <- dict_peer %>%
  dplyr::filter(scale == "VIA Courage") %>%
  pull(variable)
data_peer$courage_peer <-data_peer %>%
  dplyr::select(all_of(courage_peer_I)) %>% 
  rowMeans(na.rm = TRUE)
  
# Averaged scores with multiple informants
peer_avg <- data_peer %>% group_by(ID) %>%
  summarize(courage_peer =mean(courage_peer, na.rm=TRUE),
            .groups ='drop')

# Combined Dataframes
PeerSelfdata <- merge(data_self, peer_avg, by = 'ID')

# Finding Difference between self and peer courage 
PeerSelfdata <- PeerSelfdata %>% 
  dplyr::mutate(courage_difference = (courage_self - courage_peer))
#YES LETS GO

# Viz and desc

scourage_dat_desc <- data.frame(describe(PeerSelfdata$courage_self),
                              row.names = "selfcourage_viz")