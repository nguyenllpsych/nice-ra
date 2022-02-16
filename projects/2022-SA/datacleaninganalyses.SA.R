##DATA CLEANING
setwd("~/Desktop/NICE_RA")
data <- rio::import(file = "NICE_data_SA.sav")
dict <- rio::import(file = "dictionary_SA.xlsx")
library(rio)
library(dplyr)
persis_items <- dict %>%
  filter(scale == "VIA Courage") %>%
  pull(variable)
data$persis <- data %>%
  select(all_of(persis_items)) %>%
  rowMeans(na.rm = TRUE)

ssfa_items <- dict %>%
  filter(subscale == "SS Social Support from Family") %>%
  pull(variable)
data$ssfa <- data %>%
  select(all_of(ssfa_items)) %>%
  rowMeans(na.rm = TRUE)

ssfr_items <- dict %>%
  filter(subscale == "SS Social Support from Friends") %>%
  pull(variable)
data$ssfr <- data %>%
  select(all_of(ssfr_items)) %>%
  rowMeans(na.rm = TRUE)

##ANALYSES
ssfa_persis <- lm(data$persis ~ data$ssfa, data)
ssfr_persis <- lm(data$persis ~ data$ssfr, data)
summary(ssfa_persis)
summary(ssfr_persis)


#Plot regression results
install.packages("ggplot2")
library(ggplot2)

ggplot(data, aes(ssfa, persis)) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(data, aes(ssfr, persis)) +
  geom_point() +
  geom_smooth(method = "lm")
