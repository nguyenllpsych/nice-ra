#Chapter 5 Vector and Scalar
#crew info
captain.name<- "Jack"
captain.age<- 33
crew.names <-c("Heath", "Vincent", "Yuyang", "Becki")
crew.age<- c(19,35,21,44)
crew.sex<-c(rep("M, times =2"), rep("F", times =2))
crew.ages.decade<- creq.ages/10

#Earnings over first 10 days at sea
days<-  1:10
gold<- seq(from = 10, to =100, by =10)
silver<-rep(50, times =10)
total<-gold+silver
#vectors is combination of several scalars stored as a single object By using c() to bring stuff togather
c(1,5,9)
1:9
seq(from =0, to = 6, by =3)
#rep(x,times,each, lenght.out)// can be a combination of any command
rep(c(7,8), times = 2, each =3)


#Generating random data
sample()
#x: a vector of outcomes you want to sample from, e.g. x = c("head", "tail")
#size: samples you want to draw
#replace: if no argument is putted, default is true (drawing balls from a bag, if replace is true, you put the ball back, if is false, you don't put the ball back)
#prob: how likly each outcome in x is

#using sample to draw 10 samples from a vector from 1 to 10
sample(x = 1:10, size = 5) # number from 1 to 10, give me 5 random samples

#draw 30 samples from the integers 1:5 with replacement
sample(x=1:5, size =10, replace =TRUE)


#coin flips
sample(x=c("Head", "Tail"),
       prob = c(.99, .001),
       size = 10, #10 flips
       replace = TRUE) # you reset to the start with both head and tail exist)

#A chest draw
chest<-c(rep("gold", 20),
         rep("silver",30),
         rep("bronze", 50))

sample(x =chest,
       size = 10)
# to generate samples from a normal distribution in R, we use the function rnorm()
rnorm(n = 5, mean = 0, sd=1)

#uniform distribution
runif(n=5, min=0, max=1)

# use set.seed() to control random samples so that will output the same result

#R might
number1<- c(1,2,3,4,5,6,7,8,9,10)
number1<- 1:10
number1<- seq(from =1, to =10, by= 1)
number1


number2<-c(2.1,4.1,6.1,8.1)
number2<-seq(from = 2.1, to = 8.1, by = 2)
number2


number3<-c(....)
number3<-seq(from =0, to=15, by =5, lenght.out = 4)
number3


number4f<-c(101, 200, 1000)
number4t<-c(103, 210, 1200)
number4by<-c(1,5,100)
number4pt1<- seq(from=101, to =103, by=1)
number4pt2<-seq(from=200, to=210, by=5)
number4pt3<-seq(from=1000, by=100, length.out = 3)
number4final<-c(number4pt1, number4pt2, number4pt3)
number4final


number5chest<-c(rep("scimitars",10),
                rep("broadswords", 40),
                rep("cutlasses", 50))

sample(x=number5chest,
          size =10)

number6<-rep(c(1:5), times=10)
number6

number7<-rep(c(1:5), each=10)
number7

rnorm(n=50, mean=20, sd=2)

runif(n=25, min=-100, max=-50)
