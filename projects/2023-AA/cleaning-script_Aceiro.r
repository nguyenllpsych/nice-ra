#### META ####

# load packages
library(rio)   # for importing data files
library(dplyr) # for data cleaning

# working directory -> where R is right now
getwd()

# import the data
data <- rio::import(file = "data.sav")
View(data)

# import the dictionary
dict <- rio::import(file = "dict.xlsx")

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


# THE FAST WAY
# use a dictionary

# create a list of items that belong to your scale
assert_items <- dict %>% 
  
  # filter only rows that belong to BFAS assertiveness scale
  filter(subscale == "BFAS Assertiveness") %>% 
  
  # pull only the variable column
  pull(variable)
  
data$assert <- data %>% 
  select(all_of(assert_items)) %>% 
  rowMeans(na.rm = TRUE)

#create pil variable
pil_items <- dict %>% 
  filter(scale == "PIL Purpose in Life") %>% 
  pull(variable)
data$pil <- data %>% 
  select(all_of(pil_items)) %>% 
  rowMeans(na.rm = TRUE)

