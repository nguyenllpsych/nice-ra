#### META ####

# load packages
library(rio)      # for importing data files
library(dplyr)    # for data cleaning
library(codebook) # for reverse scoring

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

#### REVERSE SCORE ####

# create a new variable that is the "reverse" of the original item
# e.g., Likert scale 1 to 5
# 1 <-> 5, 2 <-> 4
# formula: new score = upper bound + 1 - old score
# 2 = (5 + 1) - 2 = 4

# THE SLOW WAY
# manually create all reverse items
data <- data %>%
  # create a new variable called bfas083R
  # which is the reverse of the item bfas083
  mutate(bfas083R = 6 - bfas083)

# THE FAST WAY
# pull items for current scale
scale_items <- dict %>%
  dplyr::filter(scale %in% "BFAS Conscientiousness") %>%
  pull(variable)

# pull reversed items
scale_r_items <- dict %>% 
  dplyr::filter(variable %in% scale_items) %>%
  dplyr::filter(keying == -1) %>%
  pull(variable)

# duplicate data to create reversed scores
temp_r <- data %>% 
  dplyr::select(all_of(scale_items))

# rename reversed items to end with R
# the add_R function comes from the codebook package
temp_r <- temp_r %>%
  dplyr::rename_at(scale_r_items, add_R)

# reverse items in duplicated data frame
temp_r <- temp_r %>%  
  dplyr::mutate_at(vars(matches("\\dR$")),
                   codebook::reverse_labelled_values)

# reverse item names in dictionary
# necessary if you are using the FAST WAY to score your scales
variable <- c(dict$variable) # create a list of variables
y <- data.frame(matrix(ncol = length(variable), nrow = 0)) # empty dataframe
colnames(y) <- variable # name empty dataframe with variable list
y <- y %>% # rename variable list so reversed items end with R
  rename_at(scale_r_items, add_R)
dict$variable <- colnames(y) # merge renamed reverse items to dictionary

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
# REMEMBER: check to see whether or not the dictionary has reverse item names
#           if it doesn't -> cannot use this method
#           if you used the FAST WAY to reverse score 
#           -> your dictionary will have been updated
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

# mean, variability, graphs etc. #
# refer to eda_template.R        #
