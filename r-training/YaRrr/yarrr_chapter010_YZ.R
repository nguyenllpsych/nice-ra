#Chapter 10

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
##   sex  q1
## 1   f 2.0
## 2   m 3.5

# Median q3 score for each sex, but only for those
#   older than 20
aggregate(formula = q3 ~ sex, 
          data = combined,
          subset = age > 20,
          FUN = mean)
##   sex  q3
## 1   f 3.5
## 2   m 5.5

# Many summary statistics by sex using dplyr!
library(dplyr)
combined %>% group_by(sex) %>%
  summarise(
    q1.mean = mean(q1),
    q2.mean = mean(q2),
    q3.mean = mean(q3),
    age.mean = mean(age),
    N = n())
## # A tibble: 2 x 6
##      sex q1.mean q2.mean q3.mean age.mean     N
##   <fctr>   <dbl>   <dbl>   <dbl>    <dbl> <int>
## 1      f     2.0     8.3     4.3       23     3
## 2      m     3.5     8.5     5.5       22     2

#-----------------------------
#order() sorting data
pirates <- pirates[order(pirates$height, decreasing = TRUE),]
pirates[1:5,1:4]

#multiple ordering request
pirates <- pirates[order(pirates$sex, pirates$height),]

#combining data 
risk.survey <- data.frame(
  "participant" = c(1, 2, 3, 4, 5),
  "risk.score" = c(3, 4, 5, 3, 1))

happiness.survey <- data.frame(
  "participant" = c(4, 2, 5, 1, 3),
  "happiness.score" = c(20, 40, 50, 90, 53))


combined.survey <- merge(x = risk.survey,
                         y = happiness.survey,
                         by = "participant",
                         all = TRUE)
View(combined.survey)

#---------------------
#Aggregate
# Calculate the mean weight for each value of Diet
aggregate(formula = weight ~ Diet,  # DV is weight, IV is Diet
          FUN = mean,               # Calculate the mean of each group
          data = ChickWeight)       # dataframe is ChickWeight
##   Diet weight
## 1    1    103
## 2    2    123
## 3    3    143
## 4    4    135

# Calculate the mean weight for each value of Diet,
#  But only when chicks are less than 10 weeks old

aggregate(formula = weight ~ Diet,  # DV is weight, IV is Diet
          FUN = mean,               # Calculate the mean of each group
          subset = Time < 10,       # Only when Chicks are less than 10 weeks old
          data = ChickWeight)       # dataframe is ChickWeight
##   Diet weight
## 1    1     58
## 2    2     63
## 3    3     66
## 4    4     69

# Calculate the mean weight for each value of Diet and Time,
#  But only when chicks are 0, 2 or 4 weeks okd

aggregate(formula = weight ~ Diet + Time,  # DV is weight, IVs are Diet and Time
          FUN = mean,                      # Calculate the mean of each group
          subset = Time %in% c(0, 2, 4),   # Only when Chicks are 0, 2, and 4 weeks old
          data = ChickWeight)              # dataframe is ChickWeight
##    Diet Time weight
## 1     1    0     41
## 2     2    0     41
## 3     3    0     41
## 4     4    0     41
## 5     1    2     47
## 6     2    2     49
## 7     3    2     50
## 8     4    2     52
## 9     1    4     56
## 10    2    4     60
## 11    3    4     62
## 12    4    4     64

#---------------------------------------
install.packages("dplyr")
library("dplyr")

# Template for using dplyr
my.df %>%                  # Specify original dataframe
  filter(iv3 > 30) %>%     # Filter condition
  group_by(iv1, iv2) %>%   # Grouping variable(s)
  summarise(
    a = mean(col.a),       # calculate mean of column col.a in my.df
    b = sd(col.b),         # calculate sd of column col.b in my.df
    c = max(col.c))        # calculate max on column col.c in my.df, ...


#-------------------------------
pirates.agg <- pirates %>%                   # Start with the pirates dataframe
  filter(headband == "yes") %>% # Only pirates that wear hb
  group_by(sex, college) %>%    # Group by these variables
  summarise( 
    age.mean = mean(age),      # Define first summary...
    tat.med = median(tattoos), # you get the idea...
    n = n()                    # How many are in each group?
  ) # End
pirates.agg

#--------------------------------------------
movies %>% # From the movies dataframe...
  filter(genre != "Horror" & time > 50) %>% # Select only these rows
  group_by(rating, sequel) %>% # Group by rating and sequel
  summarise( #
    frequency = n(), # How many movies in each group?
    budget.mean = mean(budget, na.rm = T),  # Mean budget?
    revenue.mean = mean(revenue.all), # Mean revenue?
    billion.p = mean(revenue.all > 1000)) # Percent of movies with revenue > 1000?
#--------------------------
#Additional aggregation functiona
exam <- data.frame("q1" = c(1, 0, 0, 0, 0),
                   "q2" = c(1, 0, 1, 1, 0),
                   "q3" = c(1, 0, 1, 0, 0),
                   "q4" = c(1, 1, 1, 1, 1),
                   "q5" = c(1, 0, 0, 1, 1))
# What percent did each student get correct?
rowMeans(exam)
# What percent of students got each question correct?
colMeans(exam)
#-------------------------------

#Apply family
with(movies, tapply(X = time,        # DV is time
                    INDEX = genre,   # IV is genre
                    FUN = mean,      # function is mean
                    na.rm = TRUE))   # Ignore missing


##---------------------------------
#R might!
#1
caffeine <- read.table(file = 'https://raw.githubusercontent.com/ndphillips/ThePiratesGuideToR/master/data/caffeinestudy.txt ',
                       sep = '\t',
                       header =TRUE)
#2
with(caffeine, tapply(X=age,
                      INDEX = gender,
                      FUN = mean,
                      na.rm = TRUE))

#3
with (caffeine, tapply(X = age,
                      INDEX = drink,
                      FUN = mean,
                      na.rm =TRUE))
#4
caffeine %>%                  # Specify original dataframe
  group_by(gender, drink) %>%   # Grouping variable(s)
  summarise(
    a = mean(age))       # calculate mean of column col.a in my.df
    #ate in my.df ...
#5
caffeine %>%
  group_by(age) %>%
  summarise(
    median_score = median(score))
  

#6
caffeine %>%
  filter(gender == "male")%>%
  group_by(age)%>%
  summarise(
    max_score = max(score))
  

#7
caffeine %>%
  group_by(drink)%>%
  summarise(
    mean = mean(score),
    median = median(score),
    max = max(score),
    sd = sd(score),
  )
  
