# Chapter 15: Regression

## 15.2 Linear Regression with lm()
library(yarrr)
head(diamonds)

# Create a linear model of diamond values
#   DV = value, IVs = weight, clarity, color

diamonds.lm <- lm(formula = value ~ weight + clarity + color,
                  data = diamonds)

# Print summary statistics from diamond model
summary(diamonds.lm)

# Which components are in the regression object?
names(diamonds.lm)

# The coefficients in the diamond model
diamonds.lm$coefficients

# Coefficient statistics in the diamond model
summary(diamonds.lm)$coefficients


## Getting Models with fitted.values
# Add the fitted values as a new column in the dataframe
diamonds$value.lm <- diamonds.lm$fitted.values
head(diamonds)

# Plot the relationship between true diamond values
#   and linear model fitted values
plot(x = diamonds$value,                          # True values on x-axis
     y = diamonds.lm$fitted.values,               # fitted values on y-axis
     xlab = "True Values",
     ylab = "Model Fitted Values",
     main = "Regression fits diamond values")
abline(b = 1, a = 0)                             # Values should fall around this line!

## Using predict() to predict new data from a model
# Create a dataframe of new diamond data
diamonds.new <- data.frame(weight = c(12, 6, 5),
                           clarity = c(1.3, 1, 1.5),
                           color = c(5, 2, 3))

# Predict the value of the new diamonds using
#  the diamonds.lm regression model
predict(object = diamonds.lm,     # The regression model
        newdata = diamonds.new)   # dataframe of new data

#formula = value ~ weight * clarity:

# Create a regression model with interactions between 
#   IVS weight and clarity
diamonds.int.lm <- lm(formula = value ~ weight * clarity,
                      data = diamonds)

# Show summary statistics of model coefficients
summary(diamonds.int.lm)$coefficients

## Center variables before computing interactions
# Create centered versions of weight and clarity
diamonds$weight.c <- diamonds$weight - mean(diamonds$weight)
diamonds$clarity.c <- diamonds$clarity - mean(diamonds$clarity)

# Create a regression model with interactions of centered variables
diamonds.int.lm <- lm(formula = value ~ weight.c * clarity.c,
                      data = diamonds)

# Print summary
summary(diamonds.int.lm)$coefficients

## Getting an ANOVA froma regression model with aov()
# Create ANOVA object from regression
diamonds.aov <- aov(diamonds.lm)

# Print summary results
summary(diamonds.aov)


##15.3 Comparing regression models with anova()
# model 1: 1 IV (only weight)
diamonds.mod1 <- lm(value ~ weight, data = diamonds)

# Model 2: 2 IVs (weight AND clarity)
diamonds.mod2 <- lm(value ~ weight + clarity, data = diamonds)

# Model 3: 3 IVs (weight AND clarity AND color)
diamonds.mod3 <- lm(value ~ weight + clarity + color, data = diamonds)

# Compare model 1 to model 2
anova(diamonds.mod1, diamonds.mod2)
# Result shows Df of 1 and p <0.001.  
#     Adding clarity DID lead to a significantly improved fit over model 1

# Compare model 2 to model 3
anova(diamonds.mod2, diamonds.mod3)
# non significant( p = .21)

# Compare model 1 to model 3
anova(diamonds.mod1, diamonds.mod3)
# SIgnificant


##15.5 Losistic regression with glm(family = "binomial")
# Create a binary variable indicating whether or not
#   a diamond's value is greater than 190
diamonds$value.g190 <- diamonds$value > 190

# Conduct a logistic regression on the new binary variable
diamond.glm <- glm(formula = value.g190 ~ weight + clarity + color,
                   data = diamonds,
                   family = binomial)
# Print coefficients from logistic regression
summary(diamond.glm)$coefficients

# Add logistic fitted values back to dataframe as
#  new column pred.g190
diamonds$pred.g190 <- diamond.glm$fitted.values
# Look at the first few rows (of the named columns)
head(diamonds[c("weight", "clarity", "color", "value", "pred.g190")])
#Probabilities look to match the data well.
# Predict the 'probability' that the 3 new diamonds 
#  will have a value greater than 190

predict(object = diamond.glm,
        newdata = diamonds.new)
#Need to turn these back into real probabilities
# Get logit predictions of new diamonds
logit.predictions <- predict(object = diamond.glm,
                             newdata = diamonds.new
)

# Apply inverse logit to transform to probabilities
#  (See Equation in the margin)
prob.predictions <- 1 / (1 + exp(-logit.predictions))

# Print final predictions!
prob.predictions
#Model predicts that the diamonds are worth over 190 is 99.235, 2.8% AND 40%


## Adding a regression line to the plot
# Scatterplot of diamond weight and value
plot(x = diamonds$weight,
     y = diamonds$value,
     xlab = "Weight",
     ylab = "Value",
     main = "Adding a regression line with abline()"
)

# Calculate regression model
diamonds.lm <- lm(formula = value ~ weight,
                  data = diamonds)

# Add regression line
abline(diamonds.lm,
       col = "red", lwd = 2)

## Transforming skewed variables prior to standard regression
# The distribution of movie revenus is highly
#  skewed.
hist(movies$revenue.all, 
     main = "Movie revenue\nBefore log-transformation")
# Create a new log-transformed version of movie revenue
movies$revenue.all.log <- log(movies$revenue.all)
# Distribution of log-transformed
#  revenue is much less skewed

hist(movies$revenue.all.log, 
     main = "Log-transformed Movie revenue")


## 15.6 Test your might!
head(auction)

#1
# jbb.cannon.lm model
# DV = jbb, IV = cannons
jbb.cannon.lm <- lm(formula = jbb ~ cannons, 
                    data = auction)
# Print jbb.cannon.lm coefficients
summary(jbb.cannon.lm)$coefficients

#2
# jbb.cannon.modern.lm  model
# DV = jbb, IV = cannons. Only include modern ships
jbb.cannon.modern.lm <- lm(formula = jbb ~ cannons, 
                           data = subset(auction, style == "modern"))

# jbb.cannon.classic.lm model
# DV = jbb, IV = cannons. Only include classic ships
jbb.cannon.classic.lm <- lm(formula = jbb ~ cannons, 
                            data = subset(auction, style == "classic"))
summary(jbb.cannon.modern.lm)$coefficients
summary(jbb.cannon.classic.lm)$coefficients


#3
# int.lm model
# DV = jbb, IV = interaction between style and age
int.lm <- lm(formula = jbb ~ style * age,
             data = auction
)

# Print int.lm coefficients
summary(int.lm)$coefficients

#4
# jbb.all.lm model
# DV = jbb, IV = everything (except price)]
jbb.all.lm <- lm(jbb ~ cannons + rooms + age + condition + color + style,
                 data = auction
)

# Print jbb.all.lm coefficients
summary(jbb.all.lm)$coefficients

#5
# price.all.lm model
# DV = price, IV = everything (except jbb)]
price.all.lm <- lm(price ~ cannons + rooms + age + condition + color + style,
                   data = auction
)

# Print price.all.lm coefficients
summary(price.all.lm)$coefficients

#6 
# Create new binary variable indicating whether
#   a ship sold for more than 3500
auction$price.gt.3500 <- auction$price > 3500

# price.all.blr model
# DV = price.gt.3500, IV = everything (except jbb)
price.all.blr <- glm(price.gt.3500 ~ cannons + rooms + age + condition + color + style,
                     data = auction,
                     family = binomial   # Logistic regression
)

# price.all.blr coefficients
summary(price.all.blr)$coefficients

#7
# Create a dataframe with new ship data
new.ships <- data.frame(cannons = c(12, 8, 32),
                        rooms = c(34, 26, 65),
                        age = c(43, 54, 100),
                        condition = c(7, 3, 5),
                        color = c("black", "black", "red"),
                        style = c("classic", "modern", "modern"),
                        stringsAsFactors = FALSE)

# Predict new ship data based on price.all.lm model
predict(object = price.all.lm,
        newdata = new.ships)

#8
# Calculate logit of predictions
log.pred <- predict(object = price.all.blr,
                    newdata = new.ships
)

# Convert logits to probabilities
1 / (1 + exp(-log.pred))