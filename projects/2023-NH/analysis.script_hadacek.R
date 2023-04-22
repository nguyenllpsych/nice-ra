###
# 4/8/23
# Nick Hadacek
# PSY4994V Final Project
###

# LOADING PACKAGES ####

install.packages("reshape2")
install.packages("ggplot2") #for data visualization
install.packages("dplyr") #for data management
install.packages("cowplot") #combining graphs if needed
install.packages("psych") #easier correlation
install.packages("apaTables") #APA-ready tables
install.packages("rio") #for importing data
install.packages("sjPlot") #ggplot2 add-on
install.packages("qwraps2") #descriptive summary stats
install.packages("rempsyc") #convert data frames to apa ready tables

library(reshape2)
library(ggplot2)
library(dplyr)
library(cowplot)
library(psych)
library(apaTables)
library(rio)
library(sjPlot)
library(qwraps2)

sessionInfo()
#R version 4.2.3
#ggplot2_3.4.2
#dplyr_1.1.1
#cowplot_1.1.1
#psych_2.3.3 
#apaTables_2.0.8
#rio_0.5.29
#sjPlot_2.8.14 
#qwraps2_0.5.2

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

#self demographics 
options(qwraps2_markup = "markdown")
jointdataset <- as.data.frame(data_self)
summary_statistics <-
  list(
    "Race" =
      list(
        "White" = ~qwraps2::n_perc(na.omit(race_f) %in% "1"),
        "Black" = ~qwraps2::n_perc(na.omit(race_f) %in% "2"),
        "Asian" = ~qwraps2::n_perc(na.omit(race_f) %in% "3"),
        "Multiple" = ~qwraps2::n_perc(na.omit(race_f) %in% "4"),
        "White non-Europe" = ~qwraps2::n_perc(na.omit(race_f) %in% "5"),
        "Latinx" = ~qwraps2::n_perc(na.omit(race_f) %in% "6"),
        "Other" = ~qwraps2::n_perc(na.omit(race_f) %in% "7"),
      ),
    "Gender" =
      list(
        "Female" = ~qwraps2::n_perc(na.omit(gender) %in% "2"),
      ),
    "Age" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(age, na_rm = TRUE),
        "median (Q1, Q3)" = ~qwraps2::median_iqr(age, na_rm = TRUE),
        "min" = ~min(age, na.rm = TRUE),
        "max" = ~max(age, na.rm = TRUE),
      )
  )
summary_table(data_self, summary_statistics)
descriptive_self <- as.data.frame(summary_table(data_self, summary_statistics))
View(descriptive_self)


#peer descriptive stats
options(qwraps2_markup = "markdown")
jointdataset <- as.data.frame(data_peer)
summary_statistics_peer <-
  list(
    "Gender" =
      list(
        "Female" = ~qwraps2::n_perc(na.omit(gender) %in% "2"),
      ),
    "Age" =
      list(
        "mean (sd)" = ~qwraps2::mean_sd(age, na_rm = TRUE),
        "median (Q1, Q3)" = ~qwraps2::median_iqr(age, na_rm = TRUE),
        "min" = ~min(age, na.rm = TRUE),
        "max" = ~max(age, na.rm = TRUE),
      ),
    "Relation to Participant" =
      list(
        "Family" = ~qwraps2::n_perc(na.omit(relatp) %in% "1"),
        "Friend" = ~qwraps2::n_perc(na.omit(relatp) %in% "2"),
        "Roommate" = ~qwraps2::n_perc(na.omit(relatp) %in% "3"),
        "Teacher/Mentor" = ~qwraps2::n_perc(na.omit(relatp) %in% "4"),
        "Other" = ~qwraps2::n_perc(na.omit(relatp) %in% "5"),
      ),
    "Knowledge of Participant" =
      list(
        "Not well at all" = ~qwraps2::n_perc(na.omit(knowrelatp) %in% "1"),
        "Somewhat well" = ~qwraps2::n_perc(na.omit(knowrelatp) %in% "2"),
        "Well" = ~qwraps2::n_perc(na.omit(knowrelatp) %in% "3"),
        "Quite well" = ~qwraps2::n_perc(na.omit(knowrelatp) %in% "4"),
        "Extremely well" = ~qwraps2::n_perc(na.omit(knowrelatp) %in% "5"),
      ),
    "Feelings toward participant" = 
      list(
        "Strongly dislike" = ~qwraps2::n_perc(na.omit(likerelatp) %in% "1"),
        "Dislike somewhat" = ~qwraps2::n_perc(na.omit(likerelatp) %in% "2"),
        "Neutral" = ~qwraps2::n_perc(na.omit(likerelatp) %in% "3"),
        "Like somewhat" = ~qwraps2::n_perc(na.omit(likerelatp) %in% "4"),
        "Strongly like" = ~qwraps2::n_perc(na.omit(likerelatp) %in% "5"),
      )
  )
summary_table(data_peer, summary_statistics_peer)
descriptive_peer <- as.data.frame(summary_table(data_peer, summary_statistics_peer))
View(descriptive_peer)


#variable descriptive stats
consci_dif_dat_descr <- data.frame(describe(jointdataset$consci_dif),
                                   row.names = "consciousness difference score")
sconsci_dat_descr <- data.frame(describe(jointdataset$consci_self), 
                                row.names = "consciousness self")
pconsci_dat_descr <- data.frame(describe(jointdataset$consci_peer), 
                                row.names = "consciousness peer")
pid_dat_descr <- data.frame(describe(jointdataset$pid), 
                            row.names = "rigid perfectionism")
pil_dat_descr <- data.frame(describe(jointdataset$pil), 
                            row.names = "purpose in life")
neuro_dat_descr <- data.frame(describe(jointdataset$neuro), 
                              row.names = "neuroticisim")
withdraw_dat_descr <- data.frame(describe(jointdataset$withdraw), 
                                 row.names = "withdrawal")

dat.df <- t(rbind.data.frame(consci_dif_dat_descr, sconsci_dat_descr, pconsci_dat_descr, 
                             pid_dat_descr, pil_dat_descr,neuro_dat_descr, 
                             withdraw_dat_descr))

#correlation tests

##peer, self - reported conscientiousness
cor.test(jointdataset$consci_peer, jointdataset$consci_self)

##self-reported conscientiousness, rigid perfectionism
cor.test(jointdataset$consci_self, jointdataset$pid)

##correlation heat map
cormat <- round(x = cor(select(jointdataset, c("consci_self", "consci_peer",
                                             "consci_dif", "pid", "pil", 
                                             "withdraw"))),
                digits = 2)
cormat[lower.tri(cormat)] <- NA
cormat <- melt(cormat, na.rm = TRUE) %>%
  # delete the perfect correlations
  filter(value != 1.00)

ggplot(data = cormat, aes(Var2, Var1, fill = value)) +
  geom_tile(color = "white" ) +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name = "Pearson\nCorrelation") +
  theme_minimal()+ 
  labs(x = NULL, y = NULL) +
  coord_fixed() +
  geom_text(aes(Var2, Var1, label = value), color = "black", size = 4) +
  theme(
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    panel.grid.major = element_blank(),
    panel.border = element_blank(),
    panel.background = element_blank(),
    axis.ticks = element_blank(),
    legend.justification = c(1, 0),
    legend.position = c(0.4, 0.7),
    legend.direction = "horizontal")+
  guides(fill = guide_colorbar(barwidth = 7, barheight = 1,
                               title.position = "top", title.hjust = 0.5))

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
  labs(title = "Simple Regression", x = "Rigid Perfectionism", 
       y = "Conscientiousness Difference Score") +
  theme_classic()

#correlation test
cor.test(jointdataset$consci_dif, jointdataset$pid, use = "pairwise")

## multiple regression ####
multiple_regression <- lm(consci_dif ~ pid + pil + withdraw, 
                          data = jointdataset)
summary(multiple_regression)

#interpret

#consci_dif = -0.14248(pid) - 0.09772(pil) - 0.10898(neuro) + 0.22687(withdraw), 
#p = 0.0104
#for every increase of one in pid, consci_dif decreases by .14 when controlling 
#for pil, neuro, and withdraw
#result is significant (p<.05)

apaTables::apa.reg.table(multiple_regression, 
                         filename = "conscidifXpid_regtable.doc")


