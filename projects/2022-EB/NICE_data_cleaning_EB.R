library(rio)
library(dplyr)
library(ggplot2)

setwd("~/Desktop/nice-ra/projects/2022-EB")

# imports
data <- rio::import(file = "NICE_data_EB.sav")
dict <- rio::import(file = "dictionary_EB.xlsx")
View(data)
View(dict)

### Creation of Scale Scores ###
# List of items that belong to score
ss_items <- dict %>%
  filter(scale == "SS Total Social Support") %>%
  pull(variable)

impulse_items <- dict %>%
  filter(scale == "PID Disinhibition") %>%
  pull(variable)

risk_items <- dict %>%
  filter(scale == "PID Miscellaneous") %>%
  pull(variable)

# Variable that is mean of all items in scale
data$ss <- data%>%
  select(all_of(ss_items)) %>%
  rowMeans(na.rm = TRUE)
View(data$ss)

data$impulse <- data%>%
  select(all_of(impulse_items)) %>%
  rowMeans(na.rm = TRUE)
View(data$impulse)

data$risk <- data%>%
  select(all_of(risk_items)) %>%
  rowMeans(na.rm = TRUE)
View(data$risk)

### Data Exploration ###
# social support
mean(data$ss, na.rm = TRUE)
sd(data$ss, na.rm = TRUE)
hist(data$ss)

# impulsivity
mean(data$impulse, na.rm = TRUE)
sd(data$impulse, na.rm = TRUE)
hist(data$impulse)

# risk-taking behaviors
mean(data$risk, na.rm = TRUE)
sd(data$risk, na.rm = TRUE)
hist(data$risk)
summary(data$risk)

### Analyses ###

# regression analysis of ss and impulse
ss_impulse <- lm(data$impulse ~ data$ss, data) 
summary(ss_impulse)

# scatterplot of ss and impulse
ggplot(data, aes(ss, impulse)) +
  geom_point() +
  geom_smooth(method = "lm")

# regression analysis of ss and risk
ss_risk <- lm(data$risk ~ data$ss, data)
summary(ss_risk)

# scatterplot of ss and risk
ggplot(data, aes(ss, risk)) +
  geom_point() +
  geom_smooth(method = "lm")

### APA format ###

# APA format for ss and impulse
# A simple linear regression was calculated to predicted impulsivity
#   based on social support. A significant regression equation was 
#   found (F(1, 255) = 8.832, p = 0.003242), with an R^2 of 0.03348. 
#   There was a decrease of 0.21403 in impulsivity for each unit
#   increase of social support

# APA format for ss and risk
# A simple linear regression was calculated to predicted risk-taking behavior
#   based on social support. A nonsignificant regression equation was 
#   found (F(1, 255) = 0.2065, p = 0.6499), with an R^2 of 0.0008091. 
#   There was a decrease of 0.02536 in risk-taking behavior for each unit
#   increase of social support

