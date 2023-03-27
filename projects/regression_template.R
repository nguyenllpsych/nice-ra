#### META ####

# load packages
library(rio)     # for importing data files
library(dplyr)   # for general wrangling
library(ggplot2) # for plots
library(sjPlot)  # for interaction plot

# working directory -> where R is right now
getwd()

# import the data
data <- rio::import(file = "NICE_data_YZ.sav")
View(data)

# import the dictionary
dict <- rio::import(file = "dictionary_YZ.xlsx")

#### CLEANING ####
# create scale scores etc. as needed #

#### SIMPLE REGRESSION ####

# create the linear model
# if there are multiple hypotheses, create a separate model for each
simple_regression <- lm(outcome_variable ~ predictor, data)

# see model results
summary(simple_regression)

# visualize model results
ggplot(data = data_name, 
       # first tell R what variables to plot:
       aes(x = predictor, y = outcome_variable)) +
  
  # add a scatterplot:
  geom_point() +
  
  # add a regression line:
  geom_smooth(method = "lm")

#### MULTIPLE REGRESSION ####

# if there are multiple predictors, add them to the formula!
multiple_regression <- lm(outcome_variable ~ pred1 + pred2 + pred.etc,
                          data = data_name)

# see model results
summary(multiple_regression)

#### MODERATION ####

# add an interaction term
int_regression <- lm(outcome_variable ~ predictor * moderator, 
                     data = data_name)

# see model results
summary(int_regression)

# visualize the interaction effects
plot_model(int_regression, type = "int",
           axis.title = c("x-axis", "y-axis"),
           title = "my plot title")
