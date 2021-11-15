#Chapter 13
library("yarrr")
install.packages("car")
# Step 1: Create an aov object
mod.aov <- aov(formula = y ~ x1 + x2 + ...,
               data = data)

# Step 2: Look at a summary of the aov object
summary(mod.aov)

# Step 3: Calculate post-hoc tests
TukeyHSD(mod.aov)

# Step 4: Look at coefficients
mod.lm <- lm(formula = y ~ x1 + x2 + ...,
             data = data)
#-----------------------------------------One way ANOVA
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
#--------------Two way ANOVA
# Step 1: Create ANOVA object with aov() put all IV with a + sign
cleaner.type.aov <- aov(formula = time ~ cleaner + type,
                        data = poopdeck)
# Step 2: Get ANOVA table with summary()
summary(cleaner.type.aov)
# Step 3: Conduct post-hoc tests
TukeyHSD(cleaner.type.aov)
# Step 4: Look at regression coefficients
cleaner.type.lm <- lm(formula = time ~ cleaner + type,
                      data = poopdeck)
#--------------------------------Interactions in the 
# Step 1: Create ANOVA object with interactions
cleaner.type.int.aov <- aov(formula = time ~ cleaner * type,
                            data = poopdeck)
summary(cleaner.type.int.aov)

#use type 2 or 3 ANOVAs to thoese IV who don't have same amount of data

# Step 1: Calculate regression object with lm()
time.lm <- lm(formula = time ~ type + cleaner,
              data = poopdeck)
# Type I ANOVA - aov()
time.I.aov <- aov(time.lm)

# Type II ANOVA - Anova(type = 2)
time.II.aov <- car::Anova(time.lm, type = 2)

# Type III ANOVA - Anova(type = 3)
time.III.aov <- car::Anova(time.lm, type = 3)

#------------Additional info
# Show me what's in my aov object
names(cleaner.type.int.aov)
head(poopdeck)
##---------------R might
#1
rMight <- aov(formula = tattoos ~ fav.pixar,
                   data = pirates)
summary(rMight)


#2
rMight2 <- aov(formula = tattoos ~ favorite.pirate,
              data = pirates)
summary(rMight2)
