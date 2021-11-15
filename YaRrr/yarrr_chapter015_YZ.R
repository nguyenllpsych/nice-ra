#Chapter 15 Regression

#Linear model
library("yarrr")
head(diamonds)

# Create a linear model of diamond values
#   DV = value, IVs = weight, clarity, color

diamonds.lm <- lm(formula = value ~ weight + clarity + color,
                  data = diamonds)
summary(diamonds.lm)

# Which components are in the regression object?
names(diamonds.lm)
# The coefficients in the diamond model
diamonds.lm$coefficients

# Add the fitted values as a new column in the dataframe
diamonds$value.lm <- diamonds.lm$fitted.values
head(diamonds)

# Plot the relationship between true diamond values
#   and linear model fitted values

plot(x = diamonds$value,                          # True values on x-axis
     y = diamonds.lm$fitted.values,               # fitted values on y-axis
     xlab = "True Values",
     ylab = "Model Fitted Values",
     main = "Regression fits of diamond values")

abline(b = 1, a = 0)                             # Values should fall around this line!


#-------------
#We cab=b predict stuff
# Create a dataframe of new diamond data
diamonds.new <- data.frame(weight = c(12, 6, 5),
                           clarity = c(1.3, 1, 1.5),
                           color = c(5, 2, 3))
# Predict the value of the new diamonds using
#  the diamonds.lm regression model
predict(object = diamonds.lm,     # The regression model
        newdata = diamonds.new)   # dataframe of new data

#-------------------------------
# Create a regression model with interactions between 
#   IVS weight and clarity
diamonds.int.lm <- lm(formula = value ~ weight * clarity,
                      data = diamonds)
summary(diamonds.int.lm)$coefficients
#--------------------Center variables 
# Create centered versions of weight and clarity
diamonds$weight.c <- diamonds$weight - mean(diamonds$weight)
diamonds$clarity.c <- diamonds$clarity - mean(diamonds$clarity)

# Create a regression model with interactions of centered variables
diamonds.int.lm <- lm(formula = value ~ weight.c * clarity.c,
                      data = diamonds)

# Print summary
summary(diamonds.int.lm)$coefficients



# Create ANOVA object from regression
diamonds.aov <- aov(diamonds.lm)

# Print summary results
summary(diamonds.aov)

#Deciding what model should be used (Simple is better)
# model 1: 1 IV (only weight)
diamonds.mod1 <- lm(value ~ weight, data = diamonds)

# Model 2: 2 IVs (weight AND clarity)
diamonds.mod2 <- lm(value ~ weight + clarity, data = diamonds)

# Model 3: 3 IVs (weight AND clarity AND color)
diamonds.mod3 <- lm(value ~ weight + clarity + color, data = diamonds)
# Compare model 1 to model 2
anova(diamonds.mod1, diamonds.mod2)
# Compare model 2 to model 3
anova(diamonds.mod2, diamonds.mod3)
# Compare model 1 to model 3
anova(diamonds.mod1, diamonds.mod3)

#glm()is for non-normal data-not bell shape
# Create a binary variable indicating whether or not
#   a diamond's value is greater than 190
diamonds$value.g190 <- diamonds$value > 190

# Conduct a logistic regression on the new binary variable
diamond.glm <- glm(formula = value.g190 ~ weight + clarity + color,
                   data = diamonds,
                   family = binomial)
summary(diamond.glm)$coefficients

# Predict the 'probability' that the 3 new diamonds 
#  will have a value greater than 190

predict(object = diamond.glm,
        newdata = diamonds.new)
# Get logit predictions of new diamonds
logit.predictions <- predict(object = diamond.glm,
                             newdata = diamonds.new
)

# Apply inverse logit to transform to probabilities
#  (See Equation in the margin)
prob.predictions <- 1 / (1 + exp(-logit.predictions))

# Print final predictions!
prob.predictions

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

#log transformed version of data cna be less skrewed
# Create a new log-transformed version of movie revenue
movies$revenue.all.log <- log(movies$revenue.all)

hist(movies$revenue.all.log, 
     main = "Log-transformed Movie revenue")

     
#---------------------------------------------------R might
#1
head (auction)

jbb.cannon.lm <- lm(formula = jbb  ~ cannons ,
                  data = auction)
summary(jbb.cannon.lm)


#2
modern.lm <- lm(formula = jbb ~ cannons, 
                           data = subset(auction, style == "modern"))

classic.lm <- lm(formula = jbb ~ cannons, 
                            data = subset(auction, style == "classic"))

summary(modern.lm)
summary(classic.lm)

#3

jbb.agestyle.lm <- lm(formula = jbb  ~ style * age,
                    data = auction)
summary(jbb.agestyle.lm)

#4
all.lm<- lm(jbb~cannons+rooms+age+condition+color+style,
            data = auction
            )

summary(all.lm)


#5
price.all.lm <- lm(price ~ cannons + rooms + age + condition + color + style,
                   data = auction
)
summary(price.all.lm)$coefficients

#6
at.a.price <- auction$price>3500

price.lm<- glm(at.a.price ~ cannons + rooms + age + condition + color + style,
               data = auction,
               family = binomial
               )
summary(at.a.price)

#7
new.ships <- data.frame(cannons = c(12,8,32),
                        rooms = c(34,26,65),
                        age = c(43,54,100),
                        condition = c(7,3,5),
                        color = c("black","black","red"),
                        style = c("classic", "modern", "modern"),
                        stringsAsFactors = FALSE)

predict(object = price.all.lm,
        newdata = new.ships
        )

#8
ships <- predict (object = price.lm,
                   newdata = new.ships
                   )
1 / (1 + exp(-ships))
