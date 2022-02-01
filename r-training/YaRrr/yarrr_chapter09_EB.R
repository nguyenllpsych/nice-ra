## Chapter 9: Importing, saving, and managing data

#9.2 The Working Directory:
#   FIle path that sets default location of any files read into R
# Print my current working directory
getwd()

#Change working directory use setwd()
# Change my working directory to the following path
setwd(dir = "/Users/emilybuss/Dropbox/yarrr")

## The workspace: working environment (all objects and functions from previous session)

#See all objects defines in workspace 
# Print all the objects in my workspace
ls()

## .RData files
# Best way to store is with .RData files
#   can store as many objects with a single file

## To save selected objects into .RData,
#   use save()

# Create some objects that we'll save later
study1.df <- data.frame(id = 1:5, 
                        sex = c("m", "m", "f", "f", "m"), 
                        score = c(51, 20, 67, 52, 42))

score.by.sex <- aggregate(score ~ sex, 
                          FUN = mean, 
                          data = study1.df)

study1.htest <- t.test(score ~ sex, 
                       data = study1.df)

# Save two objects as a new .RData file
#   in the data folder of my current working directory
save(study1.df, score.by.sex, study1.htest,
     file = "study1.RData")


##save.image
# Save my workspace to complete_image.RData in th,e
#  data folder of my working directory
save.image(file = "projectimage.RData")


##load()
# Load objects in study1.RData into my workspace
load(file = "study1.RData")

# Load objects in projectimage.RData into my workspace
load(file = "projectimage.RData")


##rm() (remove)
# Remove huge.df from workspace
rm(huge.df)

# Remove ALL objects from workspace
rm(list = ls())


##9.6 .txt files
# write.table() will save object x as a .txt file

# Write the pirates dataframe object to a tab-delimited
#  text file called pirates.txt in my working directory

write.table(x = pirates,
            file = "pirates.txt",  # Save the file as pirates.txt
            sep = "\t")            # Make the columns tab-delimited

# Write the pirates dataframe object to a tab-delimited
#  text file called pirates.txt to my desktop

write.table(x = pirates,
            file = "Users/nphillips/Desktop/pirates.txt",  # Save the file as pirates.txt to my desktop
            sep = "\t")                                    # Make the columns tab-delimited

# Read a tab-delimited text file called mydata.txt 
#  from the data folder in my working directory into
#  R and store as a new object called mydata

mydata <- read.table(file = 'mydata.txt',    # file is in a data folder in my working directory
                     sep = '\t',                  # file is tab--delimited
                     header = TRUE,               # the first row of the data is a header row
                     stringsAsFactors = FALSE)    # do NOT convert strings to factors!!

# Read a text file from the web
fromweb <- read.table(file = 'http://goo.gl/jTNf6P',
                      sep = '\t',
                      header = TRUE)


