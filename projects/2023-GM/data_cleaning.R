####### META #######
# setting working directory
setwd("C:/Users/mormi/OneDrive/Documents/School 2022-2023/ADHD project")

# load libraries
library(dplyr)
library(labelled)

####### DATA PROCESSING - DO NOT TO DO AGAIN #######
# view all variable names in the full dataset
View(as.data.frame(variable.names(da36147.0003)))

# pull only 
dat <- da36147.0003 %>% 
  select(
    # ID variables
    FPX, FMX, HHX,
    
    # demographic variables
    SEX, RACERPI2, AGE_P, REGION,
    
    # Income and ADHD
    ERNYR_P, LCTIME13)

# create individual ID
dat <- dat %>%
  mutate(ID = paste0(FPX, FMX, HHX))

# create ADHD indicator
dat <- dat %>%
  mutate(ADHD = as.numeric(!is.na(LCTIME13)))
var_label(dat$ADHD) <- "Binary indicator for ADHD status"

# save dataset
saveRDS(object = dat,
        file = "working_data.RData")

####### LOOK AT DATA ####### 
dat <- readRDS(file = "working_data.RData")
