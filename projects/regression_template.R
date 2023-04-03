#### META ####

# load packages
library(rio)      # for importing data files
library(dplyr)    # for general wrangling
library(ggplot2)  # for plots
library(sjPlot)   # for interaction plot
library(lmerTest) # for paired linear model

# working directory -> where R is right now
# navigate to your project folder if needed
getwd()

# import the data
data <- rio::import(file = "your_data.sav")
View(data)

# import the dictionary
dict <- rio::import(file = "your_dict.csv")

#### CLEANING ####
# create scale scores etc. as needed #
# refer to data_cleaning_template.R  #

#### TWO-SAMPLE T-TEST ####

# e.g., Are men taller than women?
# IV: gender -> grouping variable
# DV: height

# create sample data
women <- data.frame(id = c(1:10),
                    women = rnorm(n = 10, mean = 160, sd = 10))
men   <- data.frame(id = c(1:10),
                    men = rnorm(n = 10, mean = 180, sd = 10))
merged_data <- merge(women, men)

# create an independent-sample t-test
t_test_inde    <- t.test(
  # first group
  x = women,
  
  # second group
  y = men,
  
  # specify data frame
  data = merged_data,
  
  # specify that the data are not paired
  paired = FALSE)

# create a paired-sample t-test
t_test_paired    <- t.test(
  # first group
  x = women,
  
  # second group
  y = men,
  
  # specify data frame
  data = merged_data,
  
  # specify that the data are paired
  paired = TRUE)

# long data structure
long_data = data.frame(id     = rep(1:50, times = 2),
                       gender = rep(c("women","men"), each = 50),
                       height = c(rnorm(n = 50, mean = 165, sd = 10),
                                  rnorm(n = 50, mean = 170, sd = 10)))

# create the linear model: independent test
t_test_lm   <- lm(height ~ gender, data = long_data)
t_test_inde <- t.test(height ~ gender, data = long_data,
                      # specify independent structure
                      paired = FALSE)
# notice the similar t statistic and p-value
summary(t_test_lm)
t_test_inde

# create the linear model: paired test
t_test_lmer   <- lmerTest::lmer(height ~ gender + (1|id), data = long_data)
t_test_paired <- t.test(height ~ gender, data = long_data, 
                        # specify paired structure
                        paired = TRUE)
# notice the similar t statistic and p-value
summary(t_test_lmer)
t_test_paired

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
