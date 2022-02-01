# Chapter 7: Indexing Vectors with []

# Boat sale: creating the data vectors 
boat.names <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
boat.colors <- c("black", "green", "pink", "blue", "blue", 
                 "green", "green", "yellow", "black", "black")
boat.ages <- c(143, 53, 356, 23, 647, 24, 532, 43, 66, 86)
boat.prices <- c(53, 87, 54, 66, 264, 32, 532, 58, 99, 132)
boat.costs <- c(52, 80, 20, 100, 189, 12, 520, 68, 80, 100)

# What is the price of the first boat?
boat.prices[1]

#what were the ages of the first 5 boats 
boat.ages[1:5]

# what were the names of the black boats?
boat.names[boat.colors == "black"]

# what were the prices of the grean or yellow boats?
boat.prices[boat.colors == "green" | boat.colors == "yellow"]

#change the price of boat "s" to 100
boat.prices[boat.names == "s"] <- 100

#what was the median price of black boats less than 100 years old?
median(boat.prices[boat.colors == "black" & boat.ages < 100])

# How many pink boats were there?
sum(boat.colors == "pink")

# what percent of boats were older than 100 years old?
mean(boat.ages < 100)


## 7.1 Numerical Indexing

# what is the first boat name?
boat.names[1]

# What are the first 5 boat colors?
boat.colors[1:5]

# what is every second boat age?
boat.ages[seq(1,5, by = 2)]

# What is the first boat age (3 times)
boat.ages[c(1, 1, 1)]

#make code clearer
my.index <- 3:5
boat.names[my.index]


## 7.2 Logical Indexing
#logical vectors only contain T and F values

a <- c(1, 2, 3, 4, 5)
a[c(TRUE, FALSE, TRUE, FALSE, TRUE)]

# Which ages are > 100?
boat.ages > 100

# Which ages are equal to 23?
boat.ages == 23

# Which boat names are equal to c?
boat.names == "c"

# Can also compare vectors 
# Which boats had a higher price than cost?
boat.prices > boat.costs

# Which boats had a lower price than cost?
boat.prices < boat.costs

## Can use it to index any vector with the same length
# What were the prices of boats older than 100?
boat.prices[boat.ages > 100]

##How it works step-by-step
# Which boats are older than 100 years?
boat.ages > 100

# Writing the logical index by hand (you'd never do this!)
#  Show me all of the boat prices where the logical vector is TRUE:
boat.prices[c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE)]

# Doing it all in one step! You get the same answer:
boat.prices[boat.ages > 100]

#7.2.1 & (and), | (or), %in%
## | will be true if any of the logical vectors are true and & will be true 
#     only if all the values in the logical vector is true

# Which boats had prices greater than 200 OR less than 100?
boat.prices > 200 | boat.prices < 100

# What were the NAMES of these boats
boat.names[boat.prices > 200 | boat.prices < 100]

# Boat names of boats with a color of black OR with a price > 100
boat.names[boat.colors == "black" | boat.prices > 100]

# Names of blue boats with a price greater than 200
boat.names[boat.colors == "blue" & boat.prices > 200]

# Which boats were black or brown, AND had a price less than 100?
(boat.colors == "black" | boat.colors == "brown") & boat.prices < 100

# What were the names of these boats?
boat.names[(boat.colors == "black" | boat.colors == "brown") & boat.prices < 100]

# %in% helps to creat multiple OR arguments
x <- c("a", "t", "a", "b", "z")
# values of wither a, b, c, or d
x == "a" | x == "b" | x == "c" | x == "d"
# can get the same answer by doing this
x %in% c("a", "b", "c", "d")

##7.2.2 Counts and percentages from logical vectors
x <- c(1, 2, 3, -5, -5, -5, -5, -5)
x > 0
sum(x > 0)
mean(x >0)

#How many of X are Y” or “What percent of X are Y”, you use sum() or mean() function with a logical vector as an argument.

##7.2.3 Additional Logical Functions
#can use them to figure out which values satisfy a criteria

# A vector of sex information
sex <- c("m", "m", "f", "m", "f", "f")

# Which values of sex are m?
which(sex == "m")

# Which values of sex are f?
which(sex == "f")


## 7.3 Changing Values of a Vector
#create a vector with 10 1s
a <- rep(1, 10)

#change the first 5 values to 9s
a[1:5] <- 9
a

# change the last 5 values to 0s
a[6:10] <- 0
a

# x is a vector of numbers that should be from 1 to 10
x <- c(5, -5, 7, 4, 11, 5, -2)

# Assign values less than 1 to 1
x[x < 1] <- 1

# Assign values greater than 10 to 10
x[x > 10] <- 10

# Print the result!
x

#Note: when you assign new values to a vector, you should always reassign
#       a vector of the same length as the number of values you are updating
#Example:
a <- rep(1, 10)
# To update should assign a new vector of 5 9s
a[1:5] <- c(9, 9, 9, 9, 9)
a

#7.3.1
happy <- c(1, 4, 2, 999, 2, 3, -2, 3, 2, 999)
# Which values of happy are NOT in the set 1:5?
invalid <- (happy %in% 1:5) == FALSE
invalid

# Convert any invalid values in happy to NA
happy[invalid] <- NA
happy

# Convert all values of happy that are NOT integers from 1 to 5 to NA
happy[(happy %in% 1:5) == FALSE] <- NA

# Include na.rm = TRUE to ignore NA values
mean(happy, na.rm = TRUE)

#7.4 Test your might!
# 0 Create new data vectors for each column
movie <- c("Whatever Works", "It Follows", "Love and Mercy", "The Goonies", "Jiro Dreams of Sushi", "There Will be Blood", "Moon", 
           "Spice World", "Serenity", "Finding Vivian Maier")
year <- c(2009, 2015, 2015, 1985, 2012, 2007, 2009,1988, 2005, 2014)
boxoffice <- c(35.0, 15.0, 15.0, 62.0, 3.0, 10.0, 321.0, 79.0, 39.0, 1.5)
genre <- c("Comedy", "Horror", "Drama", "Adventure", "Documentary", "Drama", "Science Fiction", "Comedy", "Science Fiction", "Documentary")
time <- c(92, 97, 120, 90, 81, 158, 97, -84, 119, 84)
rating <- c("PG-13", "R", "R", "PG", "G", "R", "R", "PG-13", "PG-13", "Unrated")

# 1. What is the name of the 10th movie in the list 
movie[10]

# 2. Genres of the firsdt 4 movies
genre[1:4]

# 3. Correct spice world movie
movie[movie == "Spice World"] <- "The Naked Gun"

# 4. Names of movies made before 1990
movie[year < 1990]

# 5. How many movies were dramas? Percent Comedies?
sum(genre == "Drama")
mean(genre == "Comedy")

# 6. One time vector is invalid. Convert invalid to NA. Then calc movie time
time [time < 0] <- NA
mean(time, na.rm = TRUE)

# 7. Names of the comedy movies? boxoffice totals?
movie[genre == "Comedy"]
boxoffice[genre == "Comedy"]

#8. What were the names of the movies that made less than $50 mill and were comedies
movie[boxoffice < 50 & genre == "Comedy"]

#9. What is the mediam boxoffice revenue of G or PG rated movies?
median(boxoffice[rating%in% c("G", "PG")])

#10. What percent of movies were either R or comedies
mean(rating == "R" | genre == "Comedy")
