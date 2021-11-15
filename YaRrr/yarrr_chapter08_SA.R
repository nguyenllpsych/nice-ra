> bsale <- data.frame(name = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j"),
+                     color = c("black", "green", "pink", "blue", "blue", 
+                               "green", "green", "yellow", "black", "black"),
+                     age = c(143, 53, 356, 23, 647, 24, 532, 43, 66, 86),
+                     price = c(53, 87, 54, 66, 264, 32, 532, 58, 99, 132),
+                     cost = c(52, 80, 20, 100, 189, 12, 520, 68, 80, 100),
+                     stringsAsFactors = FALSE) 
> # Explore the bsale dataset:
> head(bsale)     
  name color age price cost
1    a black 143    53   52
2    b green  53    87   80
3    c  pink 356    54   20
4    d  blue  23    66  100
5    e  blue 647   264  189
6    f green  24    32   12
> str(bsale)      
'data.frame':	10 obs. of  5 variables:
 $ name : chr  "a" "b" "c" "d" ...
 $ color: chr  "black" "green" "pink" "blue" ...
 $ age  : num  143 53 356 23 647 24 532 43 66 86
 $ price: num  53 87 54 66 264 32 532 58 99 132
 $ cost : num  52 80 20 100 189 12 520 68 80 100
> View(bsale)     # Open the data in a new window
Error in check_for_XQuartz() : 
  X11 library is missing: install XQuartz from xquartz.macosforge.org
> names(bsale)    # What are the names of the columns?
[1] "name"  "color" "age"   "price" "cost" 
> nrow(bsale)     # How many rows are there in the data?
[1] 10
> 
> # Calculating statistics from column vectors
> mean(bsale$age)       # What was the mean age?
[1] 197.3
> table(bsale$color)    # How many boats were there of each color?

 black   blue  green   pink yellow 
     3      2      3      1      1 
> max(bsale$price)      # What was the maximum price?
[1] 532
> 
> # Adding new columns
> bsale$id <- 1:nrow(bsale)
> bsale$age.decades <- bsale$age / 10
> bsale$profit <- bsale$price - bsale$cost
> 
> # What was the mean price of green boats?
> with(bsale, mean(price[color == "green"]))
[1] 217
> 
> # What were the names of boats older than 100 years?
> with(bsale, name[age > 100])
[1] "a" "c" "e" "g"
> 
> # What percent of black boats had a positive profit?
> with(subset(bsale, color == "black"), mean(profit > 0))
[1] 1
> 
> # Save only the price and cost columns in a new dataframe
> bsale.2 <- bsale[c("price", "cost")]
> 
> # Change the names of the columns to "p" and "c"
> names(bsale.2) <- c("p", "c")
> 
> # Create a dataframe called old.black.bsale containing only data from black boats older than 50 years
> old.black.bsale <- subset(bsale, color == "black" & age > 50)
> 
> x <- 1:5
> y <- 6:10
> z <- 11:15
> 
> # Create a matrix where x, y and z are columns
> cbind(x, y, z)
     x  y  z
[1,] 1  6 11
[2,] 2  7 12
[3,] 3  8 13
[4,] 4  9 14
[5,] 5 10 15
> ##      x  y  z
> ## [1,] 1  6 11
> ## [2,] 2  7 12
> ## [3,] 3  8 13
> ## [4,] 4  9 14
> ## [5,] 5 10 15
> # Create a matrix where x, y and z are rows
> rbind(x, y, z)
  [,1] [,2] [,3] [,4] [,5]
x    1    2    3    4    5
y    6    7    8    9   10
z   11   12   13   14   15
> ##   [,1] [,2] [,3] [,4] [,5]
> ## x    1    2    3    4    5
> ## y    6    7    8    9   10
> ## z   11   12   13   14   15
> cbind(c(1, 2, 3, 4, 5),
+       c("a", "b", "c", "d", "e"))
     [,1] [,2]
[1,] "1"  "a" 
[2,] "2"  "b" 
[3,] "3"  "c" 
[4,] "4"  "d" 
[5,] "5"  "e" 
> ##      [,1] [,2]
> ## [1,] "1"  "a" 
> ## [2,] "2"  "b" 
> ## [3,] "3"  "c" 
> ## [4,] "4"  "d" 
> ## [5,] "5"  "e"
> 
> matrix(data = 1:10,
+        nrow = 5,
+        ncol = 2)
     [,1] [,2]
[1,]    1    6
[2,]    2    7
[3,]    3    8
[4,]    4    9
[5,]    5   10
> ##      [,1] [,2]
> ## [1,]    1    6
> ## [2,]    2    7
> ## [3,]    3    8
> ## [4,]    4    9
> ## [5,]    5   10
> 
> # Now with 2 rows and 5 columns
> matrix(data = 1:10,
+        nrow = 2,
+        ncol = 5)
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    3    5    7    9
[2,]    2    4    6    8   10
> ##      [,1] [,2] [,3] [,4] [,5]
> ## [1,]    1    3    5    7    9
> ## [2,]    2    4    6    8   10
> 
> # Now with 2 rows and 5 columns, but fill by row instead of columns
> matrix(data = 1:10,
+        nrow = 2,
+        ncol = 5,
+        byrow = TRUE)
     [,1] [,2] [,3] [,4] [,5]
[1,]    1    2    3    4    5
[2,]    6    7    8    9   10
> 
> survey <- data.frame("index" = c(1, 2, 3, 4, 5),
+                      "sex" = c("m", "m", "m", "f", "f"),
+                      "age" = c(99, 46, 23, 54, 23))
> str(survey)
'data.frame':	5 obs. of  3 variables:
 $ index: num  1 2 3 4 5
 $ sex  : chr  "m" "m" "m" "f" ...
 $ age  : num  99 46 23 54 23
> 
> survey <- data.frame("index" = c(1, 2, 3, 4, 5),
+                      "sex" = c("m", "m", "m", "f", "f"),
+                      "age" = c(99, 46, 23, 54, 23),
+                      stringsAsFactors = FALSE)
> survey
  index sex age
1     1   m  99
2     2   m  46
3     3   m  23
4     4   f  54
5     5   f  23
> 
> str(survey)
'data.frame':	5 obs. of  3 variables:
 $ index: num  1 2 3 4 5
 $ sex  : chr  "m" "m" "m" "f" ...
 $ age  : num  99 46 23 54 23
> ## 'data.frame':    5 obs. of  3 variables:
> ##  $ index: num  1 2 3 4 5
> ##  $ sex  : chr  "m" "m" "m" "f" ...
> ##  $ age  : num  99 46 23 54 23
> head(ChickWeight)
  weight Time Chick Diet
1     42    0     1    1
2     51    2     1    1
3     59    4     1    1
4     64    6     1    1
5     76    8     1    1
6     93   10     1    1
> 
> tail(ChickWeight)
    weight Time Chick Diet
573    155   12    50    4
574    175   14    50    4
575    205   16    50    4
576    234   18    50    4
577    264   20    50    4
578    264   21    50    4
> > View(ChickWeight)
Error in check_for_XQuartz() : 
  X11 library is missing: install XQuartz from xquartz.macosforge.org
> summary(ToothGrowth)
      len        supp         dose      
 Min.   : 4.20   OJ:30   Min.   :0.500  
 1st Qu.:13.07   VC:30   1st Qu.:0.500  
 Median :19.25           Median :1.000  
 Mean   :18.81           Mean   :1.167  
 3rd Qu.:25.27           3rd Qu.:2.000  
 Max.   :33.90           Max.   :2.000  
> # Print additional information about ToothGrowth to the console
> str(ToothGrowth)
'data.frame':	60 obs. of  3 variables:
 $ len : num  4.2 11.5 7.3 5.8 6.4 10 11.2 11.2 5.2 7 ...
 $ supp: Factor w/ 2 levels "OJ","VC": 2 2 2 2 2 2 2 2 2 2 ...
 $ dose: num  0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 ...
>
> names(ToothGrowth)
[1] "len"  "supp" "dose"
> ToothGrowth$len
 [1]  4.2 11.5  7.3  5.8  6.4 10.0 11.2 11.2  5.2  7.0 16.5 16.5 15.2 17.3 22.5
[16] 17.3 13.6 14.5 18.8 15.5 23.6 18.5 33.9 25.5 26.4 32.5 26.7 21.5 23.3 29.5
[31] 15.2 21.5 17.6  9.7 14.5 10.0  8.2  9.4 16.5  9.7 19.7 23.3 23.6 26.4 20.0
[46] 25.2 25.8 21.2 14.5 27.3 25.5 26.4 22.4 24.5 24.8 30.9 26.4 27.3 29.4 23.0
> 
> mean(ToothGrowth$len)
[1] 18.81333
> ## [1] 19
> 
> 
> table(ToothGrowth$supp)

OJ VC 
30 30 
> ## 
> ## OJ VC 
> ## 30 30
> head(ToothGrowth[c("len", "supp")])
   len supp
1  4.2   VC
2 11.5   VC
3  7.3   VC
4  5.8   VC
5  6.4   VC
6 10.0   VC
> survey <- data.frame("index" = c(1, 2, 3, 4, 5),
+                      "age" = c(24, 25, 42, 56, 22))
> survey$sex <- c("m", "m", "f", "f", "m")
> names(df)[1] <- "a"
Error in names(df)[1] <- "a" : names() applied to a non-vector
> 
> 
> names(df)[2] <- "b"
Error in names(df)[2] <- "b" : names() applied to a non-vector
> df[1:5, 2]
Error in df[1:5, 2] : object of type 'closure' is not subsettable
> ToothGrowth.OJ.a <- ToothGrowth[ToothGrowth$supp == "OJ" &
+                                 ToothGrowth$dose < 1, ]
> subset(x = ToothGrowth,
+       subset = len < 20 &
+                supp == "OJ" &
+                dose >= 1)
    len supp dose
41 19.7   OJ    1
49 14.5   OJ    1
> subset(x = ToothGrowth,
+     subset = len > 30 & supp == "VC",
+     select = c(len, dose))
    len dose
23 33.9    2
26 32.5    2
> oj <- subset(x = ToothGrowth,
+              subset = supp == "OJ")
> mean(oj$len)
[1] 20.66333
> ## [1] 21
> oj <- ToothGrowth[ToothGrowth$supp == "OJ",]
> 
>
> mean(oj$len)
[1] 20.66333
> ## [1] 21
> health <- data.frame("age" = c(32, 24, 43, 19, 43),
+                      "height" = c(1.75, 1.65, 1.50, 1.92, 1.80),
+                      "weight" = c(70, 65, 62, 79, 85))
> 
> health$weight / health$height ^ 2
[1] 22.85714 23.87511 27.55556 21.43012 26.23457
> with(health, height / weight ^ 2)
[1] 0.0003571429 0.0003905325 0.0003902185 0.0003076430 0.0002491349
> health$weight + health$height / health$age + 2 * health$height
[1] 73.55469 68.36875 65.03488 82.94105 88.64186
> ## [1] 74 68 65 83 89
> 
> # Short code that does the same thing
> with(health, weight + height / age + 2 * height)
[1] 73.55469 68.36875 65.03488 82.94105 88.64186
> health$weight + health$height / health$age + 2 * health$height
[1] 73.55469 68.36875 65.03488 82.94105 88.64186
> ## [1] 74 68 65 83 89
> 
> # Short code that does the same thing
> with(health, weight + height / age + 2 * height)
[1] 73.55469 68.36875 65.03488 82.94105 88.64186
> 
> piratesurvey <- data.frame(
+   name = c("Astrid", "Lea", "Sarina", "Remon", "Letizia", "Babice", "Jonas", "Wendy", "Niveditha", "Gioia"),
+   sex = c("F", "F", "F", "M", "F", "F", "M", "F", "F", "F"),
+   age = c(30, 25, 25, 29, 22, 22, 35, 19, 32, 21),
+   superhero = c("Batman", "Superman", "Batman", "Spiderman", "Batman",
+                "Antman", "Batman", "Superman", "Maggott", "Superman"),
+   tattoos = c(11, 15, 12, 5, 65, 3, 9, 13, 900, 0),
+   stringsAsFactors = FALSE
+ )
> median(piratesurvey$age)
[1] 25
> mean(piratesurvey$age[piratesurvey$sex=="F"])
[1] 24.5
> mean(piratesurvey$age[piratesurvey$sex == "M"])
[1] 32
> with(piratesurvey, 
+      max(tattoos[sex == "M"]))
[1] 9
> with(piratesurvey, 
+      mean(sex[age < 25] == "F"))
[1] 1
> with(piratesurvey, 
+      mean(age[sex == "F"] < 25))
[1] 0.5
> piratesurvey$tattoos.per.year <- with(piratesurvey, tattoos / age)
> piratesurvey$name[piratesurvey$tattoos.per.year == max(piratesurvey$tattoos.per.year)]
[1] "Niveditha"
> piratesurvey$name[with(piratesurvey, sex == "F" & superhero == "Superman")]
[1] "Lea"   "Wendy" "Gioia"
> with(piratesurvey, (tattoos[age > 20 & superhero == "Spiderman"]))
[1] 5
> 