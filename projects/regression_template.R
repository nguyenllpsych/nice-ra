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

#### REGRESSION ####

# create the linear model
# if there are multiple hypotheses, create a separate model for each
simple_regression <- lm(outcome_variable ~ predictor, data)

# see model results
summary(simple_regression)

#### MODERATOR ####

# add an interaction term
int_regression <- lm(outcome_variable ~ predictor*moderator, data)

# see model results
summary(int_regression)

#### PLOT ####

# plot the pair of variable
# this tells R what to plot:
ggplot(data, aes(predictor, outcome_variable)) +
  
  # add a scatterplot:
  geom_point() +
  
  # add a regression line:
  geom_smooth(method = "lm")

# plot the interaction effects
plot_model(int_regression, type = "int",
           axis.title = c("x-axis", "y-axis"),
           title = "my plot title")
