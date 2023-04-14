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

#### Demo ####
summary(as.factor(data_self$gender))
summary(as.factor(data_peer$gender))

summary(data_self$age)
summary(data_peer$age)


ggplot(data_peer, aes(x=knowrelatp)) + 
  geom_histogram(fill="blue", binwidth = 1) + 
  theme_classic()+
  ylab("") +
  ggtitle("Histogram of acquaintance level")+
  xlab("How well do you know this person?")

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

#family score of courage
family <- data_peer %>%
  filter(relatp == 1) %>%
  select(ID, courage_peer)


#Combinging family scores with self 
family_self <- merge(data_self, family, by = 'ID')

#Friend score of courage
friends <- data_peer %>%
  filter(relatp == 2) %>%
  select(ID, courage_peer)

#combining friend scores with self
friends_self <- merge(data_self, friends, by = 'ID')

# Combined Dataframes
PeerSelfdata <- merge(data_self, peer_avg, by = 'ID')

# Finding Difference between self and peer courage 
PeerSelfdata <- PeerSelfdata %>% 
  dplyr::mutate(courage_difference = (courage_self - courage_peer))

# select only friends
friends <- friends_self %>% select(ID, courage_peer) %>% 
  # rename to generic courage
  rename(courage = courage_peer) %>%
  mutate(type = "friends")

# select only family
family <- family_self %>% select(ID, courage_peer) %>% 
  rename(courage = courage_peer) %>%
  mutate(type = "family")

# select only self
self <- family_self %>% select(ID, courage_self) %>% 
  rename(courage = courage_self) %>%
  mutate(type = "self")

# combine the three separate dataframe into a long dataframe
long <- rbind(self, friends)
long <- rbind(long, family)
View(long)
summary(as.factor(long$type))

# Viz and desc

scourage_dat_desc <- data.frame(describe(PeerSelfdata$courage_self),
                              row.names = "selfcourage_viz")

#### Analysis ####

t_test_paired <- t.test(x = PeerSelfdata$courage_self, 
                        y = PeerSelfdata$courage_peer, 
                        paired = TRUE)

t.test(x = friends_self$courage_self, 
                        y = friends_self$courage_peer, 
                        paired = TRUE)

t.test(x = family_self$courage_self, 
                        y = family_self$courage_peer, 
                        paired = TRUE)


t_test_paired
# T test report
  #in our sample, we saw that self rating of courage was lower than peer rating
  #. 

#### Visualization ####
plot <- long %>%
  group_by(type) %>%
  summarise(
    n=n(), 
    mean=mean(courage, na.rm = T),
    sd=sd(courage, na.rm = T)
  ) %>%
  mutate( se=sd / sqrt(n)) %>%
  mutate( ic=se * qt((1-0.05)/2 + .5, n-1))

#bar plot w CI

ggplot(plot) +
  geom_bar( aes(x=type, y=mean), stat="identity", fill="blue", alpha=0.5) +
  geom_errorbar( aes(x=type, ymin=mean-ic, ymax=mean+ic), width=0.4, colour="maroon", alpha=0.9, size=1.5) +
  ggtitle("Courage across self and other reports")+
  xlab("Informant type") +
  ylab("Courage Score")+
  ylim(0,5) +
  theme_classic()
