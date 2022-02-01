# Chapter 17: Loops

# SLOW way to convert any values that aren't equal to "Y", or "N" to NA
survey.df$q.1[(survey.data$q1 %in% c("Y", "N")) == FALSE] <- NA
survey.df$q.2[(survey.data$q2 %in% c("Y", "N")) == FALSE] <- NA
# . ... Wait...I have to type this 98 more times?!
# .
# . ... My god this is boring...
# .
survey.df$q.100[(survey.data$q100 %in% c("Y", "N")) == FALSE] <- NA



# FAST way to convert values that aren't "Y", or "N" to NA

for(i in 1:100) { # Loop over all 100 columns
  
  temp <- survey.df[, i]  # Get data for ith column and save in a new temporary object temp
  
  temp[(temp %in% c("Y", "N")) == FALSE] <- NA # Convert invalid values in temp to NA
  
  survey.df[, i] <- temp # Assign temp back to survey.df!
  
} # Close loop!

library(yarrr)
survey.df



#17.1 What are Loops?
# General structure of a loop
for(loop.object in loop.vector) {
  
  LOOP.CODE
  
}

# Print the integers from 1 to 10
for(i in 1:10) {
  
  print(i)
  
}


# Loop to add integers from 1 to 100

current.sum <- 0 # The starting value of current.sum

for(i in 1:100) {
  
  current.sum <- current.sum + i # Add i to current.sum
  
}

current.sum # Print the result!

# Add the integers from 1 to 100 without a loop
sum(1:100)


# Calculate the sum of integers from 1 to 100 using Gauss' method
n <- 100
n * (n + 1) / 2


#17.2 Creating Multiple Plots with a loop

# First few rows of the examscores data
head(examscores)



#17.3 Container object with a loop
# Create a container object of 4 NA values
failure.percent <- rep(NA, 4)

for(i in 1:4) { # Loop over columns 1 through 4
  
  # Get the scores for the ith column
  x <- examscores[,i] 
  
  # Calculate the percent of failures
  failures.i <- mean(x < 50)  
  
  # Assign result to the ith value of failure.percent
  failure.percent[i] <- failures.i 
  
}
failure.percent
# Calculate failure percent without a loop
failure.percent <- rep(NA, 4)
failure.percent[1] <- mean(examscores[,1] < 50)
failure.percent[2] <- mean(examscores[,2] < 50)
failure.percent[3] <- mean(examscores[,3] < 50)
failure.percent[4] <- mean(examscores[,4] < 50)
failure.percent

# 17.4 Loops with a design matrix
design.matrix <- expand.grid("college" = c("JSSFP", "CCCC"), # college factor
                             "sex" = c("male", "female"), # sex factor
                             "median.age" = NA, # NA columns for our future calculations
                             "mean.age" = NA, #...
                             "sd.age" = NA, #...
                             stringsAsFactors = FALSE)
design.matrix

for(row.i in 1:nrow(design.matrix)) {
  
  # Get factor values for current row
  college.i <- design.matrix$college[row.i]
  sex.i <- design.matrix$sex[row.i]
  
  # Subset pirates with current factor values
  data.temp <- subset(pirates, 
                      college == college.i & sex == sex.i)
  
  # Calculate statistics
  median.i <- median(data.temp$age)
  mean.i <- mean(data.temp$age)
  sd.i <- sd(data.temp$age)
  
  # Assign statistics to row.i of design.matrix
  design.matrix$median.age[row.i] <- median.i
  design.matrix$mean.age[row.i] <- mean.i
  design.matrix$sd.age[row.i] <- sd.i
  
}
design.matrix


#17.5 The list object
# Create a list with vectors of different lengths
number.list <- list(
  "a" = rnorm(n = 10),
  "b" = rnorm(n = 5),
  "c" = rnorm(n = 15))

number.list
# Give me the first element in number.list
number.list[[1]]
# Give me the element named b
number.list$b
# Create an empty list with 5 elements
samples.ls <- vector("list", 5)
for(i in 1:5) {
  samples.ls[[i]] <- rnorm(n = i, mean = 0, sd = 1)
}
samples.ls


survey <- data.frame("q1" = c(5, 3, 2, 7, 11, 5),
                     "q2" = c(4, 2, 2, 5, 5, 2),
                     "q3" = c(2, 1, 4, 2, 9, 10),
                     "q4" = c(2, 5, 2, 5, 4, 2),
                     "q5" = c(1, 4, -20, 2, 4, 2))
# The cleaned survey data
survey.clean
