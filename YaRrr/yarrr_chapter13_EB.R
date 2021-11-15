## Chapter 13: Hypothesis Tests

library(yarrr) # Load yarrr to get the pirates data

# 1 sample t-test
# Are pirate ages different than 30 on average?
t.test(x = pirates$age, 
       mu = 30)

# 2 sample t-test
# Do females and males have different numbers of  tattoos?
sex.ttest <- t.test(formula = tattoos ~ sex,
                    data = pirates, 
                    subset = sex %in% c("male", "female"))
sex.ttest # Print result

# Correlation test
# Is there a relationship between age and height?
cor.test(formula = ~ age + height,
         data = pirates)

# Chi-Square test
# Is there a relationship between college and favorite pirate?
chisq.test(x = pirates$college,
           y = pirates$favorite.pirate)


#13.1 A short introduction to hypothesis testing
# Body piercing data
american.bp <- c(3, 5, 2, 1, 4, 4, 6, 3, 5, 4)
european.bp <- c(6, 5, 7, 7, 6, 3, 4, 6, 5, 4)

# Store data in a dataframe
bp.survey <- data.frame("bp" = c(american.bp, european.bp),
                        "group" = rep(c("American", "European"), each = 10),
                        stringsAsFactors = FALSE)

yarrr::pirateplot(bp ~ group,
                  data = bp.survey,
                  main = "Body Piercing Survey",
                  ylab = "Number of Body Piercings",
                  xlab = "Group", 
                  theme = 2, point.o = .8, cap.beans = TRUE)

# 13.1.1 Null vs Hypothesis tests 
# You always start with a null hypothesis; nothing is going on and everything is the same.
# Alteernative hypothesis: opposite of null

#13.1.2 Descriptive stats
# Pring descriptive statistics of the piercing data
summary(american.bp)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##     1.0     3.0     4.0     3.7     4.8     6.0
summary(european.bp)

#13.1.3 Test statistics
# compares descriptive stats and determines how different they are 
# Conduct a two-sided t-test comparing the vectors american.bp and european.bp
#  and save the results in an object called bp.test
bp.test <- t.test(x = american.bp,
                  y = european.bp,
                  alternative = "two.sided")
bp.test
# test stat is -2.52. If there was no difference we would expect a number close to 0

#13.1.4 P value
# P-value: assuming that the null is true, what is the probability that
#     we would have gotten a stat as fas away as we did
# What is the p-value from our t-test?
bp.test$p.value
# 2.1% of the time, we will get a test stat as large as -2.52
# threshold p < 0.05 --> reject the null


##13.2 Hypothesis test objects: htest
# T-test comparing male and female heights
#  stored in a new htest object called height.htest
height.htest <- t.test(formula = height ~ sex,
                       data = pirates,
                       subset = sex %in% c("male", "female"))
# Print main results from height.htest
height.htest
# Show me all the elements in the height.htest object
names(height.htest)
# Get the test statistic
height.htest$statistic
# Get the p-value
height.htest$p.value
# Get a confidence interval for the mean
height.htest$conf.int


##13.3 t.test()

?t.test
tattoo.ttest <- t.test(x = pirates$tattoos,  # Vector of data
                       mu = 5)               # Null: Mean is 5
# Print the result
tattoo.ttest
tattoo.ttest <- t.test(x = pirates$tattoos,
                       mu = 9.5)  # Null: Mean is 9.5
tattoo.ttest

# two sample t-test
# Fomulation of a two-sample t-test

# Method 1: Formula
t.test(formula = y ~ x,  # Formula
       data = df) # Dataframe containing the variables

# Want to compare individual vectors (not together)
# Method 2: Vector
t.test(x = x,  # First vector
       y = y)  # Second vector

# 2-sample t-test
#  IV = eyepatch (0 or 1)
#  DV = tattoos
tat.patch.htest <- t.test(formula = tattoos ~ eyepatch,
                          data = pirates)

# Show me all of the elements in the htest object
names(tat.patch.htest)

# Confidence interval for mean differences
tat.patch.htest$conf.int

# Using subset to select levels of IV
# Will return an error because there are more than
#  2 levels of the age IV

t.test(formula = tattoos ~ age,
       data = pirates)
# Compare the tattoos of pirates aged 29 and 30:
tatage.htest <- t.test(formula = tattoos ~ age,
                       data = pirates,
                       subset = age %in% c(29, 30))  # Compare age of 29 to 30
tatage.htest

# Is there an effect of college on # of tattoos
#  only for female pirates?

t.test(formula = tattoos ~ college,
       data = pirates,
       subset = sex == "female")


## 13.4 cor.test()
# Correlation Test
#   Correlating two variables x and y

# Method 1: Formula notation
##  Use if x and y are in a dataframe
cor.test(formula = ~ x + y,
         data = df)

# Method 2: Vector notation
## Use if x and y are separate vectors
cor.test(x = x,
         y = y)

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

# Print result
age.parrots.ctest

# WHat information can we get from this?
names(age.parrots.ctest)

# Let's look at CI
#  95% confidence interval of the correlation coefficient
age.parrots.ctest$conf.int

# We can use subset 
# Is there a correlation between age and 
#  number parrots ONLY for female pirates?
cor.test(formula = ~ age + parrots,
         data = pirates,
         subset = sex == "female")


## 13.5 chsq.test()
# is there a difference in rates of outcomes on a nominal scale?
# General form of a one-sample chi-square test
chisq.test(x = table(x))

# Frequency table of pirate colleges
table(pirates$college)

# Are all colleges equally prevelant?
college.cstest <- chisq.test(x = table(pirates$college))
college.cstest
# can safely reject the null

# Do pirates that wear eyepatches have come from different colleges
#  than those that do not wear eyepatches?

table(pirates$eyepatch, 
      pirates$college)

# Is there a relationship between a pirate's
# college and whether or not they wear an eyepatch?

colpatch.cstest <- chisq.test(x = table(pirates$college,
                                        pirates$eyepatch))
colpatch.cstest


##13.6 Test your R Might

#1 male pirates longer beards?
beard.htest <- t.test(formula = beard.length ~ sex, subset = sex %in% c("male", "female"), data = pirates)
beard.htest
apa(beard.htest)
# yes, they do, p < 0.01

#2 fave movie Up more or less likely for eyepatch than Inside Out?
df <- subset(pirates, fav.pixar %in% c("Up", "Inside Out"))
pixar.table <- table(df$fav.pixar, df$eyepatch)

pixar.htest <- chisq.test(pixar.table)
pixar.htest
apa(pixar.htest)
# Inside out more likely to wear eye patch, p < 0.01

# 3 longer movies have significantly higher budgets 
budget.time.htest <- cor.test(formula = ~ budget + time,
                              data = movies)
budget.time.htest
apa(budget.time.htest)
# Yes, there is a significantly higher budget for linger movies

#4 R movies earn more money than PG-13 movies? 
revenue.rating.htest <- t.test(formula = revenue.all ~ rating,
                               subset = rating %in% c("R", "PG-13"),
                               data = movies)
revenue.rating.htest
apa(revenue.rating.htest)
# no, there is not a significant difference 

# 5 certain movie genres significantly more common?
genre <-table(movies$genre)
genre.htest <- chisq.test(genre)
genre.htest
apa(genre.htest)
#Yes, some movie genres are more common

#6 sequels and nonsequels differ in ratiings?
