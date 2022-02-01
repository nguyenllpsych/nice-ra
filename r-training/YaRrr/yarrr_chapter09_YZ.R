#Chapter 9 
#can import .txt .RData

#ls()	Display all objects in the current workspace
#rm(a, b, ..)	Removes the objects a, b. from your workspace
#rm(list = ls())	Removes all objects in your workspace
#getwd()	Returns the current working directory
#setwd(file = "dir)	Changes the working directory to a specified file location
#list.files()	Returns the names of all files in the working directory
#write.table(x, file = "mydata.txt", sep)	writes the object x to a text file called mydata.txt. Define how the columns will be separated with sep (e.g.; sep = "," for a comma-separated file, and sep = \t" for a tab-separated file).
#save(a, b, .., file = "myimage.RData)	Saves objects a, b, . to myimage.RData
#save.image(file = "myimage.RData")	Saves all objects in your workspace to myimage.RData
#load(file = "myimage.RData")	Loads objects in the file myimage.RData
#read.table(file = "mydata.txt", sep, header)	Reads a text file called mydata.txt, define how columns are separated with sep (e.g. sep = "," for comma-delimited files, and sep = "\t" for tab-delimited files), and whether there is a header column with header = TRUE

getwd() #printout current file directory
ls() #stuff store in current object
save("yarrr_Chapter02_YZ.R","yarrr_Chapter03_YZ.R" = "myBaby.RData")
#-----------------------------
#the following code will save the pirates dataframe as a tab-delimited text file called pirates.txt in my working directory:
write.table(x = pirates,
            file = "Users/nphillips/Desktop/pirates.txt",  # Save the file as pirates.txt
            sep = "\t")            # Make the columns tab-delimited
#----------------------------------------------------------
# Read a tab-delimited text file called mydata.txt 
#  from the data folder in my working directory into
#  R and store as a new object called mydata

mydata <- read.table(file = 'data/mydata.txt',    # file is in a data folder in my working directory
                     sep = '\t',                  # file is tab--delimited
                     header = TRUE,               # the first row of the data is a header row
                     stringsAsFactors = FALSE)    # do NOT convert strings to factors!!


# Read a text file from the web
fromweb <- read.table(file = 'http://goo.gl/jTNf6P',
                      sep = '\t',
                      header = TRUE)
