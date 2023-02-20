#### META ####

# load packages
library(rio)   # for importing data files
library(dplyr) # for data cleaning

# working directory -> where R is right now
getwd()

# import the data
data <- rio::import(file = "datafile.sav")
View(data)

# import the dictionary
dict <- rio::import(file = "dictionary.xlsx")

#### RECODE VARIABLES ####
# recode yes/no and binary questions
# e.g., gender: 1 -> 0 and 2 -> 1
# 0 = male, 1 = female
data <- data %>% 
  mutate(gender_f = as.numeric(gender == 2))
# more sensitively, we can use dplyr::case_when()
data <- data %>%
  mutate(gender_f = case_when(
    gender == 1 ~ 0,
    gender == 2 ~ 1,
    gender == 3 ~ NA_real_ # NA for real numbers
  ))

#### CREATE SCALE SCORES ####

# create a new variable that is the mean of all your items
# remember to reverse score items!

# THE SLOW WAY
# will have to list out all variables for the scale
data <- data %>% 
  mutate(consci = mean(# concatenate list of variables
                       c(bfas003, bfas083R, bfas098), 
                       
                       # remove missing values
                       na.rm = TRUE))

# THE FAST WAY
# use a dictionary

# create a list of items that belong to your scale
consci_items <- dict %>% 
  
  # filter only rows that belong to BFAS Conscientiousness scale
  filter(scale == "BFAS Conscientiousness") %>% 
  
  # pull only the variable column
  pull(variable)
  
# create a variable that is the mean of all items in your scale
data$consci <- data %>% 
  
  # select all columns that belong to BFAS Conscientiousness scale
  select(all_of(consci_items)) %>% 
  
  # compute the mean row-wise after removing NA
  rowMeans(na.rm = TRUE)


#### DATA EXPLORATION ####

# mean, variability, graphs etc.

