#Chapter 3
# Install the yarrr package
install.packages('yarrr')

# Load the package
library(yarrr)

# What is the mean age?
mean(pirates$age)

# What was the tallest pirate?
max(pirates$height)

# How many pirates are there of each sex?
table(pirates$sex)

# Calculate the mean age, separately for each sex
aggregate(formula = age ~ sex,
          data = pirates,
          FUN = mean)

# Create scatterplot Beginner
plot(x = pirates$height,        # X coordinates
     y = pirates$weight)        # y-coordinates

# Create scatterplot Intermediate
plot(x = pirates$height,        # X coordinates
     y = pirates$weight,        # y-coordinates
     main = 'My first scatterplot of pirate data!',
     xlab = 'Height (in cm)',   # x-axis label
     ylab = 'Weight (in kg)',   # y-axis label
     pch = 16,                  # Filled circles
     col = gray(.0, .1))        # Transparent gray

# Create scatterplot Advanced
plot(x = pirates$height,        # X coordinates
     y = pirates$weight,        # y-coordinates
     main = 'My first scatterplot of pirate data!',
     xlab = 'Height (in cm)',   # x-axis label
     ylab = 'Weight (in kg)',   # y-axis label
     pch = 16,                  # Filled circles
     col = gray(.0, .1))        # Transparent gray

grid()        # Add gridlines

# Create a linear regression model
model <- lm(formula = weight ~ height, 
            data = pirates)

abline(model, col = 'blue')      # Add regression to plot

#------------------------------------------------------------------Hypothesis tests
# Age by headband t-test
t.test(formula = age ~ headband,
       data = pirates,
       alternative = 'two.sided')
cor.test(formula = ~ height + weight,
         data = pirates)

# Create tattoos model
tat.sword.lm <- lm(formula = tattoos ~ sword.type,
                   data = pirates)

# Get ANOVA table
anova(tat.sword.lm)

# Create a linear regression model: DV = tchests, IV = age, weight, tattoos
tchests.model <- lm(formula = tchests ~ age + weight + tattoos,
                    data = pirates)

# Show summary statistics
summary(tchests.model)