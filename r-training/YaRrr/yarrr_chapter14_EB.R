# CHapter 14: ANOVA

library(yarrr)
head(poopdeck)
pirateplot(formula = time ~ cleaner + type,
           data = poopdeck,
           ylim = c(0, 150),
           xlab = "Cleaner",
           ylab = "Cleaning Time (minutes)",
           main = "poopdeck data",
           back.col = gray(.97), 
           cap.beans = TRUE, 
           theme = 2)
#14.2 4 steps to conduct an ANOVA
# Step 1: Create an aov object
mod.aov <- aov(formula = y ~ x1 + x2 + ...,
               data = data)
# Step 2: Look at a summary of the aov object
summary(mod.aov)
# Step 3: Calculate post-hoc tests
TukeyHSD(mod.aov)
mod.lm <- lm(formula = y ~ x1 + x2 + ...,
             data = data)

summary(mod.lm)

##14.3 One-way ANOVA Example
#time = dv and cleaner = iv
yarrr::pirateplot(time ~ cleaner, 
                  data = poopdeck, 
                  theme = 2, 
                  cap.beans = TRUE,
                  main = "formula = time ~ cleaner")
# Step 1: aov object with time as DV and cleaner as IV
cleaner.aov <- aov(formula = time ~ cleaner,
                   data = poopdeck)
# Step 2: Look at the summary of the anova object
summary(cleaner.aov)
# Step 3: Conduct post-hoc tests
TukeyHSD(cleaner.aov)
# Step 4: Create a regression object
cleaner.lm <- lm(formula = time ~ cleaner,
                 data = poopdeck)

# Show summary
summary(cleaner.lm)

##14.4 two was ANOVA example
# Step 1: Create ANOVA object with aov()
cleaner.type.aov <- aov(formula = time ~ cleaner + type,
                        data = poopdeck)
# Step 2: Get ANOVA table with summary()
summary(cleaner.type.aov)
# Step 3: Conduct post-hoc tests
TukeyHSD(cleaner.type.aov)
# Step 4: Look at regression coefficients
cleaner.type.lm <- lm(formula = time ~ cleaner + type,
                      data = poopdeck)

# ANOVA with interactions
# Step 1: Create ANOVA object with interactions
cleaner.type.int.aov <- aov(formula = time ~ cleaner * type,
                            data = poopdeck)
# Step 2: Look at summary table
summary(cleaner.type.int.aov)
# Step 4: Calculate regression coefficients
cleaner.type.int.lm <- lm(formula = time ~ cleaner * type,
                          data = poopdeck)


##14.5 Type I, II, and III ANOVAS
# Step 1: Calculate regression object with lm()
time.lm <- lm(formula = time ~ type + cleaner,
              data = poopdeck)
# Type I ANOVA - aov()
time.I.aov <- aov(time.lm)

# Type II ANOVA - Anova(type = 2)
time.II.aov <- car::Anova(time.lm, type = 2)

# Type III ANOVA - Anova(type = 3)
time.III.aov <- car::Anova(time.lm, type = 3)
# Are observations in the poopdeck data balanced?
with(poopdeck,
     table(cleaner, type))


##14.6 Getting additional info from ANOVA
# Show me what's in my aov object
names(cleaner.type.int.aov)
# Add the fits for the interaction model to the dataframe as int.fit
poopdeck$int.fit <- cleaner.type.int.aov$fitted.values
# Add the fits for the main effects model to the dataframe as me.fit
poopdeck$me.fit <- cleaner.type.aov$fitted.values
head(poopdeck)

# How far were the interaction model fits from the data on average?
mean(abs(poopdeck$int.fit - poopdeck$time))
# How far were the main effect model fits from the data on average?
mean(abs(poopdeck$me.fit - poopdeck$time))


## Couldn't do 14.7 (lme4)


## 14.8 Test your R might!
# 1
pixar.aov <- aov(formula = tattoos ~ fav.pixar,
                 data = pirates)

summary(pixar.aov)
# No significant effect

#2 
favpirate.aov <- aov(formula = tattoos ~ favorite.pirate,
                     data = pirates)

summary(favpirate.aov)
# no significant effect

# 3
pirpix.aov <- aov(formula = tattoos ~ favorite.pirate + fav.pixar,
                  data = pirates)

summary(pirpix.aov)
# SIgnificant effect

# 4
pirpix.int.aov <- aov(formula = tattoos ~ favorite.pirate * fav.pixar,
                      data = pirates)

summary(pirpix.int.aov)
# no significant effect

