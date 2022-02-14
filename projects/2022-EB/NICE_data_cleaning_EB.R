library(rio)
library(dplyr)

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

# regression analysis of ss and risk
ss_risk <- lm(data$risk ~ data$ss, data)
summary(ss_risk)

