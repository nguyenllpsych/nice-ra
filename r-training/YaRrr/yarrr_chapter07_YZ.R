install.packages("yarrr")
library("yarrr")
#Chapter 7 Indexing vectors, only a portion of the dataset

# Boat sale. Creating the data vectors
boat.names <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
boat.colors <- c("black", "green", "pink", "blue", "blue", 
                 "green", "green", "yellow", "black", "black")
boat.ages <- c(143, 53, 356, 23, 647, 24, 532, 43, 66, 86)
boat.prices <- c(53, 87, 54, 66, 264, 32, 532, 58, 99, 132)
boat.costs <- c(52, 80, 20, 100, 189, 12, 520, 68, 80, 100)

# What was the price of the first boat?
boat.prices[1]
## [1] 53

# What were the ages of the first 5 boats?
boat.ages[1:5]
## [1] 143  53 356  23 647

# What were the names of the black boats?
boat.names[boat.colors == "black"]
## [1] "a" "i" "j"

# What were the prices of either green or yellow boats?
boat.prices[boat.colors == "green" | boat.colors == "yellow"]
## [1]  87  32 532  58

# Change the price of boat "s" to 100
boat.prices[boat.names == "s"] <- 100

# What was the median price of black boats less than 100 years old?
median(boat.prices[boat.colors == "black" & boat.ages < 100])
## [1] 116

# How many pink boats were there?
sum(boat.colors == "pink")
## [1] 1

# What percent of boats were older than 100 years old?
mean(boat.ages < 100)
## [1] 0.6

#------------------------------------------------

# Numerical Indexing Remember R starts with 1, no 0

boat.name[1] #first data 
boat.name[1:5] #first 5 name
boat.ages[seq(1,5, by=2)] #first 5 names but every other
boat.age[c(1,1,1)] #give me the first age var three times
# you can simplify the index, just define it into a object:
my.index <- 3:5
boat.names[my.index]


#Logical index, just by using c(), creating a vector
a<-c(1,2,3,4,5)
a[c(TRUE, FALSE, TRUE, FALSE, TRUE)]
#Note only true var will print out
#| or; ! not; %in% in the set; & and

boat.age > 100 #printout everyting with true or false
boat.prices > boat.cost #compare two vectors
boat.prices[boat.ages > 100] #show me the boat prices of all the 100 years old or older boats  

#using %in% to combine multiple criteria
x %in% c("a","b","c","d")# show me true is a or b or c or d. false elsewise

#Since true is 1 false is 0, we can do more:

x<- c(1,2,3,-5,-5,-5,-5,-5)
x>0
sum(x>0)
mean(x>0) #that'll give the percentage of x positive (True%)

#is.na(x) return True is the var is NA
#is.finite(x)
#duplicated(x) find out from index 1 to total, only TRUE if detecting same var.
#which(x) return value that are TRUE
#which(sex=="m") //return index that's m

#------------------

#Changing value of a vector
a<- rep(1,10)
a[1:5] <- 9
#result: 9999911111

a[x>1]<-5
#result 5555511111

#Example: happy scale from 1 to 5, but the data has other value than 1 to 5. we want to clear the invalid:
invalid <- (happy %in% 1:5) ==FALSE #all good value set to FALSE

happy [invalid]<- NA # so that the TRUE value will be changed to NA
mean(happy, na.rm = TRUE)#remove all the NA and calculate the mean


#----------------------------------
#R Might!
 # Value sets: 
movie <-c("Whatever Works", "It Follows","Love and Mercy", "The Goonies", "Jiro Dreams of SUshi", "There Will be Blood", "Moon", "Spice WOrld","Serenity","Finding Vivian Maier")
year<-c(2009,2015,2015,1985,2012,2007,2009,1988,2005,2014) 
boxoffice<-c(35.0, 15.0,15.0,62.0, 3.0,10.0,321.0,79.0,39.0,1.5)
gen<-c("Comedy", "Horror","Drama", "Adventure", "Documentary", "Drama","Science Fiction","Comedy", "Science Fiction", "Documentary")
time<-c(92,97,120,90,81,158,97,-84,119,84)
RA<-c("PG-13","R", "R","PG","G","R","R","PG-13","PG-13","Unrated")

#1
movie[10]

#2
gen[1:4]

#3
movie [8]<-"The Naked Gun"

#4
movie[year<1990]

#5: 
Drama <- (gen != "Drama") == FALSE
sum(Drama >0)
sum(Drama>0)/10
#6: 
invalid <- (time>0) == FALSE
time[invalid]<- NA
mean(time, na.rm = TRUE)

#7: 
movie [gen == "Comedy"]
sum(boxoffice[gen=="Comedy"])

#8
movie [(boxoffice < 50) & (gen == "Comedy")]

#9 
median(boxoffice[RA == "G" | RA == "PG"])

#10
mean(RA == "R" | gen == "Comedy")
