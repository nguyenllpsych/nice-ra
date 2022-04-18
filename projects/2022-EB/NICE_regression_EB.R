#### META ####

library(rio)     
library(dplyr)  
library(ggplot2) 
library(sjPlot) 

setwd("~/Desktop/nice-ra/projects/2022-EB")

data <- rio::import(file = "NICE_data_EB.sav")
View(data)

dict <- rio::import(file = "dictionary_EB.xlsx")


#### CLEANING ####
ss_items <- dict %>%
  filter(scale == "SS Total Social Support") %>%
  pull(variable)

impulse_items <- dict %>%
  filter(scale == "PID Disinhibition") %>%
  pull(variable)

risk_items <- dict %>%
  filter(scale == "PID Miscellaneous") %>%
  pull(variable)

child_PSES_items <- dict %>%
  filter(scale == "PSES Childhood Resource") %>%
  pull(variable)

current_PSES_items <- dict %>%
  filter(scale == "PSES Current Resource") %>%
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

data$child_PSES <- data%>%
  select(all_of(child_PSES_items)) %>%
  rowMeans(na.rm = TRUE)
View(data$child_PSES)

data$current_PSES <- data%>%
  select(all_of(current_PSES_items)) %>%
  rowMeans(na.rm = TRUE)
View(data$current_PSES)

#### RECODE VARIABLES ####
data <- data %>% 
  mutate(gender_f = as.numeric(gender == 2))

#### REGRESSION ####

# regression analysis of ss and impulse
ss_impulse <- lm(impulse ~ ss, data) 
summary(ss_impulse)

# regression analysis of ss and risk
ss_risk <- lm(risk ~ ss, data)
summary(ss_risk)


#### MODERATOR ####

# impulsivity
momedu_impluse_regression <- lm(impulse ~ ss*momedu, data)
summary(momedu_impluse_regression)

dadedu_impulse_regression <- lm(impulse ~ ss*momedu, data)
summary(dadedu_impulse_regression)

childPSES_impulse_regression <- lm(impulse ~ ss*child_PSES, data)
summary(childPSES_impulse_regression)

currentPSES_impulse_regression <- lm(impulse ~ ss*current_PSES, data)
summary(currentPSES_impulse_regression)

gender_impulse_regression <- lm(impulse ~ ss*gender, data)
summary(gender_impulse_regression)

# risk-taking
momedu_risk_regression <- lm(risk ~ ss*momedu, data)
summary(momedu_risk_regression)

dadedu_risk_regression <- lm(risk ~ ss*momedu, data)
summary(dadedu_risk_regression)

childPSES_risk_regression <- lm(risk ~ ss*child_PSES, data)
summary(childPSES_risk_regression)

currentPSES_risk_regression <- lm(risk ~ ss*current_PSES, data)
summary(currentPSES_risk_regression)

gender_risk_regression <- lm(impulse ~ ss*gender, data)
summary(gender_risk_regression)


#### PLOT ####

# impulse
ggplot(data, aes(ss, impulse)) +
  geom_point() +
  geom_smooth(method = "lm")

# risk
ggplot(data, aes(ss, risk)) +
  geom_point() +
  geom_smooth(method = "lm")


# Interaction effects
# impulse interaction
plot_model(momedu_impluse_regression, type = "int",
           axis.title = c("social support", "impulsivity"),
           title = "Interaction of Mother's Education and Impulsivity")

plot_model(dadedu_impulse_regression, type = "int",
           axis.title = c("social support", "impulsivity"),
           title = "Interaction of Father's Education and Impulsivity")

plot_model(childPSES_impulse_regression, type = "int",
           axis.title = c("social support", "impulsivity"),
           title = "Interaction of Childhood SES and Impulsivity")

plot_model(currentPSES_impulse_regression, type = "int",
           axis.title = c("social support", "impulsivity"),
           title = "Interaction of SES and Impulsivity")

plot_model(gender_impulse_regression, type = "int",
           axis.title = c("social support", "impulsivity"),
           title = "Interaction of Gender and Impulsivity")

# risk interaction
plot_model(momedu_risk_regression, type = "int",
           axis.title = c("social support", "risk-taking behaviors"),
           title = "Interaction of Mother's Education and Risk Behavior")

plot_model(dadedu_risk_regression, type = "int",
           axis.title = c("social support", "risk-taking behaviors"),
           title = "Interaction of Father's Education and Risk Behavior")

plot_model(childPSES_risk_regression, type = "int",
           axis.title = c("social support", "risk-taking behaviors"),
           title = "Interaction of Childhood SES and Risk Behavior")

plot_model(currentPSES_risk_regression, type = "int",
           axis.title = c("social support", "risk-taking behaviors"),
           title = "Interaction of SES and Risk Behavior")

plot_model(gender_risk_regression, type = "int",
           axis.title = c("social support", "risk-taking behaviors"),
           title = "Interaction of Gender and Risk Behavior")
