## Chapter 10 Advanced Dataframe Manipulation

# Exam data
exam <- data.frame(
  id = 1:5,
  q1 = c(1, 5, 2, 3, 2),
  q2 = c(8, 10, 9, 8, 7),
  q3 = c(3, 7, 4, 6, 4))

# Demographic data
demographics <- data.frame(
  id = 1:5,
  sex = c("f", "m", "f", "f", "m"),
  age = c(25, 22, 24, 19, 23))

# Combine exam and demographics
combined <- merge(x = exam, 
                  y = demographics, 
                  by = "id")

# Mean q1 score for each sex
aggregate(formula = q1 ~ sex, 
          data = combined, 
          FUN = mean)

# Median q3 score for each sex, but only for those
#   older than 20
aggregate(formula = q3 ~ sex, 
          data = combined,
          subset = age > 20,
          FUN = mean)

# Many summary statistics by sex using dplyr!
library(dplyr)
combined %>% group_by(sex) %>%
  summarise(
    q1.mean = mean(q1),
    q2.mean = mean(q2),
    q3.mean = mean(q3),
    age.mean = mean(age),
    N = n())

#10.1 Sorting Data order()
library(yarrr)
# Sort the pirates dataframe by height
pirates <- pirates[order(pirates$height),]

# Look at the first few rows and columns of the result
pirates[1:5, 1:4]

# Sort the pirates dataframe by height in decreasing order
pirates <- pirates[order(pirates$height, decreasing = TRUE),]

# Look at the first few rows and columns of the result
pirates[1:5, 1:4]

# Sort the pirates dataframe by sex and then height
pirates <- pirates[order(pirates$sex, pirates$height),]

# Sort the pirates dataframe by height in decreasing order
pirates <- pirates[order(pirates$height, decreasing = TRUE),]

## 10.2 merge(): Combining data

# Results from a risk survey
risk.survey <- data.frame(
  "participant" = c(1, 2, 3, 4, 5),
  "risk.score" = c(3, 4, 5, 3, 1))

happiness.survey <- data.frame(
  "participant" = c(4, 2, 5, 1, 3),
  "happiness.score" = c(20, 40, 50, 90, 53))

# Combine the risk and happiness surveys by matching participant.id
combined.survey <- merge(x = risk.survey,
                         y = happiness.survey,
                         by = "participant",
                         all = TRUE)
combined.survey

## 10.3 aggregate(): Grouped aggregation
# What is the value of the funciton applied to a dv at each level of iv?
# General structure of aggregate()
aggregate(formula = dv ~ iv, # dv is the data, iv is the group 
          FUN = fun, # The function you want to apply
          data = data.frame) # The dataframe object containing dv and iv

# Calculate the mean weight for each value of Diet
aggregate(formula = weight ~ Diet,  # DV is weight, IV is Diet
          FUN = mean,               # Calculate the mean of each group
          data = ChickWeight)       # dataframe is ChickWeight

# Calculate the mean weight for each value of Diet,
#  But only when chicks are less than 10 weeks old

aggregate(formula = weight ~ Diet,  # DV is weight, IV is Diet
          FUN = mean,               # Calculate the mean of each group
          subset = Time < 10,       # Only when Chicks are less than 10 weeks old
          data = ChickWeight)       # dataframe is ChickWeight

# Calculate the mean weight for each value of Diet and Time,
#  But only when chicks are 0, 2 or 4 weeks old
aggregate(formula = weight ~ Diet + Time,
          FUN = mean,
          subset = Time %in% c(0, 2, 4),
          data = ChickWeight)

##10.4 dplyr
install.packages("dplyr")     # Install dplyr (only necessary once)
library("dplyr")              # Load dplyr

# Template for using dplyr
my.df %>%                  # Specify original dataframe
  filter(iv3 > 30) %>%     # Filter condition
  group_by(iv1, iv2) %>%   # Grouping variable(s)
  summarise(
    a = mean(col.a),       # calculate mean of column col.a in my.df
    b = sd(col.b),         # calculate sd of column col.b in my.df
    c = max(col.c))        # calculate max on column col.c in my.df, ...

pirates.agg <- pirates %>%                   # Start with the pirates dataframe
  filter(headband == "yes") %>% # Only pirates that wear hb
  group_by(sex, college) %>%    # Group by these variables
  summarise( 
    age.mean = mean(age),      # Define first summary...
    tat.med = median(tattoos), # you get the idea...
    n = n()                    # How many are in each group?
  ) # End
pirates.agg

#More complex example
movie <- c("Whatever Works", "It Follows", "Love and Mercy", "The Goonies", "Jiro Dreams of Sushi", "There Will be Blood", "Moon", 
           "Spice World", "Serenity", "Finding Vivian Maier")
year <- c(2009, 2015, 2015, 1985, 2012, 2007, 2009,1988, 2005, 2014)
boxoffice <- c(35.0, 15.0, 15.0, 62.0, 3.0, 10.0, 321.0, 79.0, 39.0, 1.5)
genre <- c("Comedy", "Horror", "Drama", "Adventure", "Documentary", "Drama", "Science Fiction", "Comedy", "Science Fiction", "Documentary")
time <- c(92, 97, 120, 90, 81, 158, 97, -84, 119, 84)
rating <- c("PG-13", "R", "R", "PG", "G", "R", "R", "PG-13", "PG-13", "Unrated")

movie %>% # From the movies dataframe...
  filter(genre = "Horror" & time > 50) %>% # Select only these rows
  group_by(rating, sequel) %>% # Group by rating and sequel
  summarise( #
    frequency = n(), # How many movies in each group?
    budget.mean = mean(budget, na.rm = T),  # Mean budget?
    revenue.mean = mean(revenue.all), # Mean revenue?
    billion.p = mean(revenue.all > 1000))

#additional dplyr help
# Open the dplyr introduction in R
vignette("introduction", package = "dplyr")

##10.5 Additional aggregation functions
# Some exam scores
exam <- data.frame("q1" = c(1, 0, 0, 0, 0),
                   "q2" = c(1, 0, 1, 1, 0),
                   "q3" = c(1, 0, 1, 0, 0),
                   "q4" = c(1, 1, 1, 1, 1),
                   "q5" = c(1, 0, 0, 1, 1))

# What percent did each student get correct?
rowMeans(exam)

# What percent of students got each question correct?
colMeans(exam)
##Only work on numberic columns


library(yarrr)
data(movies)
with(movies, tapply(X = time,        # DV is time
                    INDEX = genre,   # IV is genre
                    FUN = mean,      # function is mean
                    na.rm = TRUE))   # Ignore missing
