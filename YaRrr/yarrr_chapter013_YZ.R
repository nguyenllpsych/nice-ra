library("yarrr")
# T-test comparing male and female heights
#  stored in a new htest object called height.htest
height.htest <- t.test(formula = height ~ sex,
                       data = pirates,
                       subset = sex %in% c("male", "female"))
height.htest
# Show me all the elements in the height.htest object
names(height.htest)
## [1] "statistic"   "parameter"   "p.value"     "conf.int"    "estimate"   
## [6] "null.value"  "alternative" "method"      "data.name"

# Get the test statistic
height.htest$statistic
##   t 
## -21

# Get the p-value
height.htest$p.value
## [1] 1.4e-78

# Get a confidence interval for the mean
height.htest$conf.int
## [1] -15 -13
## attr(,"conf.level")
## [1] 0.954

#One Sample t-test
tattoo.ttest <- t.test(x = pirates$tattoos,  # Vector of data
                       mu = 5)               # Null: Mean is 5

# Fomulation of a two-sample t-test

# Method 1: Formula
t.test(formula = y ~ x,  # Formula
       data = df) # Dataframe containing the variables
# Method 2: Vector
t.test(x = x,  # First vector
       y = y)  # Second vector

#------print out confidence interval
tat.patch.htest$conf.int
## [1] -0.16  0.71
## attr(,"conf.level")
## [1] 0.95

# Compare the tattoos of pirates aged 29 and 30:
tatage.htest <- t.test(formula = tattoos ~ age,
                       data = pirates,
                       subset = age %in% c(29, 30))  # Compare age of 29 to 30
tatage.htest

#---------------------------------------------------------------------------------
# Is there a correlation between a pirate's age and
#  the number of parrots (s)he's owned?

# Method 1: Formula notation
age.parrots.ctest <- cor.test(formula = ~ age + parrots,
                              data = pirates)
# Print result
age.parrots.ctest

# Method 2: Vector notation
age.parrots.ctest <- cor.test(x = pirates$age,
                              y = pirates$parrots)


# Is there a correlation between age and 
#  number parrots ONLY for female pirates?

cor.test(formula = ~ age + parrots,
         data = pirates,
         subset = sex == "female")
#---------------Chi square test
#A key difference between the chisq.test() and the other hypothesis tests we've covered is that chisq.test() requires a table created using the table() function as its main argument. You'll see how this works when we get to the examples.
#1-sample Chi-square test
#If you conduct a 1-sample chi-square test, you are testing if there is a difference in the number of members of each category in the vector. Or in other words, are all category memberships equally prevalent? Here's the general form of a one-sample chi-square test:
# General form of a one-sample chi-square test
table(pirates$college)
# Are all colleges equally prevelant?
college.cstest <- chisq.test(x = table(pirates$college))

college.cstest

#----------------------2-sample t-test
# Is there a relationship between a pirate's
# college and whether or not they wear an eyepatch?

colpatch.cstest <- chisq.test(x = table(pirates$college,
                                        pirates$eyepatch))

colpatch.cstest
## APA style
test.result <- t.test(age ~ headband,
                      data = pirates)
yarrr::apa(test.result)

#-------------------------R-might
#1:
View(pirates)
beardTest <- t.test(formula = beard.length ~ sex,
                       data = pirates,
                       subset = sex != "other")  

apa(beardTest)
#since p is less than 0.05, reject null.

#2:
View(movies)
#G1: pirate pixar movie is Up that wear eye patch
#G2: pireates favoriate movie is Inside out wear eye patch 

tableFor <- subset(pirates, fav.pixar %in% c("Up", "Inside Out"))
movietest <- table(tableFor$fav.pixar, tableFor$eyepatch)
View(movietest)
finalTest <- chisq.test(movietest)
apa(finalTest)

#3
hehe <- cor.test(formula = ~ time + budget,
         data = movies)
apa(hehe)

#4:
brotha <- t.test (formula = revenue.all ~ rating,
         data = movies,
         subset = rating %in% c("R", "PG-13"))
apa(brotha)         
brotha


#5:
genre.table <- table (movies$genre)
genre.htest <- chisq.test(genre.table)
genre.htest

#6
sequels.table <- table(movies$genre, movies$sequel)
sequls<- chisq.test(sequels.table)
