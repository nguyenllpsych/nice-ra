library(foreign)
file.choose()
Hookup.Culture = read.spss("/Users/emilybuss/Downloads/Hookup Culture Final Data 2.9.21 (1).sav", to.data.frame = TRUE)


#### Level 1 ####

# Remove perticipants who say they attend religious services

install.packages("dplyr")

library(dplyr)

Hookup.Culture %>% 
  select(AttendService) %>%
  filter(AttendService == "No")



#### Level 2 ####

# Determine frequencies for "Year"

yeartable <- table(Hookup.Culture$Year)

yeartable



#### Level 3 ####

# Create histogram for "HCTotal"

hist(x = Hookup.Culture$HCTotal,
     main = "Hookup Culture Total Scores",
     xlab = "HCTotal") 


#### Level 4 ####

# Determine whether HCTotal differs across year

HCTot.aov <- aov(formula = HCTotal ~ Year,
                 data = Hookup.Culture)
summary(HCTot.aov)

# HCTotal does not significantly differ across years at a = 0.05