#Chapter 17
library("yarrr")
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


#container obj

#Create a container object of 4 NA values
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
