install.packages("rio")
install.packages("dplyr")
library(rio)
library(dplyr)
install_formats()

####
data<- rio::import(file = "NICE_data_YZ.sav")
summary(data)
names(data)
#          View(data)

#### finding conscientiousness score
dict <- rio::import(file = "Dictionary_YZ.xlsx")
View(dict)

consci_items <- dict %>%
  filter(scale == "BFAS Conscientiousness") %>%
  pull(variable)

data$conscientiousness <- data %>%
  select(all_of(consci_items))%>%
  
  rowMeans(na.rm = TRUE)
View(data)

##Removing the column "consci" how?

##U-MICS educational commitment score? (find the mean score?)
umics_commitment <- dict %>%
  filter(scale == "UMICS Commitment") %>%
  pull(variable)

data$UMICS_COMMIT <- data%>%
  select(all_of(umics_commitment))%>%
  rowMeans(na.rm = TRUE)
View(data)

## (1): find out if there is a significant difference between the edu_commitment of students who were born in US or not) 
na.omit(data$usborn)
na.omit(data$UMICS_COMMIT)
t.test(formula = umics_commitment ~ usborn,
       data = data,
       na.rm = TRUE,
       
       alternative = 'two.sided')
     


