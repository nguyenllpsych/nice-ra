install.packages("rio")
install.packages("dplyr")
install.packages("sjPlot")
install.packages("ggplot2")
library(rio)
library(ggplot2) # for plots
library(sjPlot)  # for interaction plot
install_formats()
library(dplyr)

#### (1) working directory -> where R is right now
getwd()

#### (2) Improt the "Data" file and "dict" 
data<- rio::import(file = "NICE_data_YZ.sav")
summary(data)
names(data)
#          View(data)

dict <- rio::import(file = "Dictionary_YZ.xlsx")
View(dict)

#### (3) data cleaning
#change gender to binary 0/1
# recode yes/no and binary questions
# e.g., gender: 1 -> 0 and 2 -> 1
# 0 = male, 1 = female
data <- data %>% 
  mutate(gender_f = as.numeric(gender == 2))
View(data)

#find consi_items as the mean score
consci_items <- dict %>%
  filter(scale == "BFAS Conscientiousness") %>%
  pull(variable)

data$conscientiousness <- data %>%
  select(all_of(consci_items))%>%
  
  rowMeans(na.rm = TRUE)
View(data)

# Find U-MICS educational commitment mean score
umics_commitment <- dict %>%
  filter(scale == "UMICS Commitment") %>%
  pull(variable)

data$UMICS_COMMIT <- data%>%
  select(all_of(umics_commitment))%>%
  rowMeans(na.rm = TRUE)
View(data)

####(3) Descriptive stats
summary(data$age)
sd(data$age)




####(4) Regression analysis for conscientiouness and UMICs
test_result <- lm(conscientiousness ~ UMICS_COMMIT, data)
summary(test_result)

#### Interpretation of the result in APA format:
# A simple linear regression was calculated to predict Educational Commitment from U-MICs based on Conscientiousness.
#A significant regression equation was found (F(1, 255) = 30.85, p < .000), with an R^2 of .108. There was an increase of number in 
# Educational Commitment for each unit increase of Conscientiousness.

## creating scatter plot to visually exam the correlation (Done before)

plot(x = data$conscientiousness,                    # x-coordinates
     y = data$UMICS_COMMIT,                         # y-coordinates
     type = "p",                       # Just draw points (no lines)
     main = "Conscientiousness predicting High Educational Commitment",
     xlab = "Educational Commitment",
     ylab = "Conscientiousness",
     xlim = c(1, 5),                  # Min and max values for x-axis
     ylim = c(1, 5),                  # Min and max values for y-axis
     col = gray(.0, .1),                     # Color of the points
     pch = 16,                         # Type of symbol (16 means Filled circle)
     cex = 1)                           # Size of the symbols
abline(test_result, col = 'red') 


###______________---
ggplot(data, aes(conscientiousness, UMICS_COMMIT)) +
  
  # add a scatterplot:
  geom_point() +

  # add a regression line:
  geom_smooth(method = "lm") +
  #change title
  labs(title = "Conscientiousness predicting High Educational Commitment") + ylab("Educational Commitment") + xlab("Conscientiousness")

# plot the interaction effects
plot_model(modMomEdu, type = "int",
           axis.title = c("Conscientiousness", "Educational Commitment"),
           title = "Conscientiousness predicting High Educational Commitment")


###---------------------

#### (5): find out if there is a significant difference between the edu_commitment of students who were born in US or not) 
na.omit(data$usborn)
na.omit(data$UMICS_COMMIT)
###gender
modUsBorn <- lm(conscientiousness ~ UMICS_COMMIT*gender, data)
summary(modUsBorn)

