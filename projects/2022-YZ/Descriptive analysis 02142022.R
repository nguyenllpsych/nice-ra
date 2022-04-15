install.packages("rio")
install.packages("dplyr")
library(rio)
install_formats()
library(dplyr)

####
data<- rio::import(file = "NICE_data_YZ.sav")
summary(data)
names(data)
#          View(data)

#### finding conscientiousness score
dict <- rio::import(file = "Dictionary_YZ.xlsx")
View(dict)

consci_items <- dict %>%
  filter(scale == "BFAS Conscientiousness") %>%
  pull(variable)

data$conscientiousness <- data %>%
  select(all_of(consci_items))%>%
  
  rowMeans(na.rm = TRUE)
View(data)



##U-MICS educational commitment score? (find the mean score?)
umics_commitment <- dict %>%
  filter(scale == "UMICS Commitment") %>%
  pull(variable)

data$UMICS_COMMIT <- data%>%
  select(all_of(umics_commitment))%>%
  rowMeans(na.rm = TRUE)
View(data)

## (1): find out if there is a significant difference between the edu_commitment of students who were born in US or not) 
na.omit(data$usborn)
na.omit(data$UMICS_COMMIT)
t.test(formula = umics_commitment ~ usborn,
       data = data,
       na.rm = TRUE,
       
       alternative = 'two.sided')

#### Regression analysis for conscientiouness and UMICs
test_result <- lm(formula = data$UMICS_COMMIT ~ data$conscientiousness,
                    data = data)

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
