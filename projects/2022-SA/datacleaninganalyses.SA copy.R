##DATA CLEANING
setwd("~/Desktop/NICE_RA")
data <- rio::import(file = "NICE_data_SA.sav")
dict <- rio::import(file = "dictionary_SA.xlsx")
library(rio)
library(dplyr)
install.packages("ggplot2")
library(ggplot2)
install.packages("sjPlot")
library(sjPlot)

data <- data %>% 
  mutate(gender_f = as.numeric(gender == 2))

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
ggplot(data, aes(ssfa, persis)) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(data, aes(ssfr, persis)) +
  geom_point() +
  geom_smooth(method = "lm")


#Moderator model and plot
int_regressionFa <- lm(persis ~ ssfa*gender_f, data)
int_regressionFr <- lm(persis ~ ssfr*gender_f, data)
int_regressionMomEdu <- lm(persis ~ ssfr*momedu, data)
int_regressionDadEdu <- lm(persis ~ ssfr*dadedu, data)
int_regressionUSBorn <- lm(persis ~ ssfr*usborn, data)
int_regressionmomus <- lm(persis ~ ssfr*momus, data)
int_regressionmomemploy <- lm(persis ~ ssfr*momemploy, data) #lowest p so far

summary(int_regressionFa)
summary(int_regressionFr)
summary(int_regressionMomEdu)
summary(int_regressionDadEdu)
summary(int_regressionUSBorn)
summary(int_regressionmomemploy)
summary(int_regressionmomus)



# plot the interaction effects
plot_model(int_regressionFa, type = "int",
           axis.title = c("Perceived Social Support from Family", "Persistence"),
           title = "Interaction Effect of Gender on Persistence")
plot_model(int_regressionFr, type = "int",
           axis.title = c("Perceived Social Support from Friends", "Persistence"),
           title = "Interaction Effect of Gender on Persistence")

