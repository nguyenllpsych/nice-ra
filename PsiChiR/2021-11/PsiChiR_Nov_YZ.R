install.packages("dplyr")
install.packages("foreign")
library(foreign)
library(dplyr)

#------------Load the file
db = file.choose() ##choose the .sav file
dataset = read.spss(db, to.data.frame=TRUE)
head(dataset) ##checking the file is the correct one
View(dataset)

#Question 1
NoReligiousServices <- dataset %>%
            filter(AttendService == "No")
  
View(NoReligiousServices)

#Question 2
NoReligiousServices %>% count (Year)

#Question 3
hist(x=NoReligiousServices$HCTotal,
     main = "Historgram for HCTotal",
     xlab = "HCTotal",
     ylab = "Frequency",
     xlim = c(20,100)
     )

#Question 4
testing <- aov(formula = HCTotal ~ Year,
               data =NoReligiousServices)

summary(testing)
