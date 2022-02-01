#Chpater 6 - vector functions

midterm<-c(1,2,3,4,5,6,7,8,9,10)
final<-c(10,9,8,7,6,5,4,3,2,1)

length(midterm)

midterm<- midterm+5 
midterm

final-midterm

(final+midterm)/2

mean(midterm)

sd(midterm)

max(final)

midterm.z<-(midterm-mean(midterm))/sd(midterm)

1:10+100 #scalar will be added to each vector values

#Descriptive stats
sum(1:10) # sum of 1+2+3...+10
product(1:10) #self explain
min(1:10) #smallest number from 1 to 10
max(1:10)
mean(1:10)#avg of them all
median(1:10) # 
sd(1:10) sd of 1,2,3...10
var(1:10)
range(1:10)

quantile(1:10, probs=.2)
summary(1:10) # everything above

length(1:10) # count the lenghth of a vector

round(3.25, 1)
ceiling(c(5.1, 7.9))#4 she 5 ru
7%%3 #modular

#counting stats
unique(c(1,1,2,10)) #what different value are there
table(c("A","A","b","b","c")) gives you a nice table


#ignore missing data
a<-c(1,5,NA,2,10)
mean(a, na.rm = TRUE)

#Standardization z-score: (data set - data set means)/sd data set so that the mean is 0 and sd is 1


#R might
number1<-1:10
sqrt(number1)


sober<-c(2,0,3,1,0,3,5)
drunk<-c(0,0,1,0,1,2,2)
mean(sober)
mean(drunk)

difference<-sober-drunk
difference

mean(difference)
median(difference)
sd(difference)

riceBoard<-1:64 
1
1*2
1*2*2
1*2*2*2

1:64??????????
