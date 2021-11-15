
R version 4.1.1 (2021-08-10) -- "Kick Things"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin17.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[R.app GUI 1.77 (7985) x86_64-apple-darwin17.0]

[Workspace restored from /Users/salmaabusamrah/.RData]
[History restored from /Users/salmaabusamrah/.Rapp.history]

> survey.df$q.1[(survey.data$q1 %in% c("Y", "N")) == FALSE] <- NA
Error in survey.df$q.1[(survey.data$q1 %in% c("Y", "N")) == FALSE] <- NA : 
  object 'survey.df' not found
> survey.df$q.2[(survey.data$q2 %in% c("Y", "N")) == FALSE] <- NA
Error in survey.df$q.2[(survey.data$q2 %in% c("Y", "N")) == FALSE] <- NA : 
  object 'survey.df' not found
> library(yarr)
Error in library(yarr) : there is no package called ‘yarr’
> library(yarrr)
Loading required package: jpeg
Loading required package: BayesFactor
Loading required package: coda
Loading required package: Matrix
************
Welcome to BayesFactor 0.9.12-4.2. If you have questions, please contact Richard Morey (richarddmorey@gmail.com).

Type BFManual() to open the manual.
************
Loading required package: circlize
========================================
circlize version 0.4.13
CRAN page: https://cran.r-project.org/package=circlize
Github page: https://github.com/jokergoo/circlize
Documentation: https://jokergoo.github.io/circlize_book/book/

If you use it in published research, please cite:
Gu, Z. circlize implements and enhances circular visualization
  in R. Bioinformatics 2014.

This message can be suppressed by:
  suppressPackageStartupMessages(library(circlize))
========================================

yarrr v0.1.5. Citation info at citation('yarrr'). Package guide at yarrr.guide()
Email me at Nathaniel.D.Phillips.is@gmail.com

Attaching package: ‘yarrr’

The following objects are masked _by_ ‘.GlobalEnv’:

    auction, diamonds, movies, poopdeck

> for(i in 1:100) { # Loop over all 100 columns
+ 
+ temp <- survey.df[, i]  # Get data for ith column and save in a new temporary object temp
+ 
+ temp[(temp %in% c("Y", "N")) == FALSE] <- NA # Convert invalid values in temp to NA
+ 
+ survey.df[, i] <- temp # Assign temp back to survey.df!
+ 
+ }
Error in survey.df : object 'survey.df' not found
> for(loop.object in loop.vector) {
+ 
+   LOOP.CODE
+ 
+   }
Error in loop.vector : object 'loop.vector' not found
> for(i in 1:10) {
+   
+   print(i)
+   
+ }
[1] 1
[1] 2
[1] 3
[1] 4
[1] 5
[1] 6
[1] 7
[1] 8
[1] 9
[1] 10
> current.sum <- 0
> for(i in 1:100) {
+ 
+  current.sum <- current.sum + i # Add i to current.sum
+ 
+ }
> current.sum
[1] 5050
> sum(1:100)
[1] 5050
> n <- 100
> n * (n + 1) / 2
[1] 5050
> head(examscores)
   a  b  c  d
1 43 31 68 34
2 61 27 56 39
3 37 41 74 46
4 54 36 62 41
5 56 34 82 40
6 73 29 79 35
> par(mfrow = c(2, 2))
> oop.vector <- 1:4
> 
> for (i in loop.vector)
+ x <- examscores[,i]
Error in loop.vector : object 'loop.vector' not found
> for (i in loop.vector) { # Loop over loop.vector
+ 
+   # store data in column.i as x
+   x <- examscores[,i]
+   
+ hist(x,
+        main = paste("Question", i),
+        xlab = "Scores",
+        xlim = c(0, 100))
+ }
Error in loop.vector : object 'loop.vector' not found
> failure.percent <- rep(NA, 4)
> for(i in 1:4) { # Loop over columns 1 through 4
+ 
+   # Get the scores for the ith column
+   x <- examscores[,i] 
+   
+   # Calculate the percent of failures
+   failures.i <- mean(x < 50)  
+   
+    # Assign result to the ith value of failure.percent
+   failure.percent[i] <- failures.i 
+ 
+ }
> failure.percent
[1] 0.50 1.00 0.03 0.97
> 
> failure.percent <- rep(NA, 4)
> failure.percent[1] <- mean(examscores[,1] < 50)
> failure.percent[2] <- mean(examscores[,2] < 50)
> failure.percent[3] <- mean(examscores[,3] < 50)
> failure.percent[4] <- mean(examscores[,4] < 50)
> failure.percent
[1] 0.50 1.00 0.03 0.97
> design.matrix <- expand.grid("college" = c("JSSFP", "CCCC"), # college factor
+                              "sex" = c("male", "female"), # sex factor
+                              "median.age" = NA, # NA columns for our future calculations
+                              "mean.age" = NA, #...
+                              "sd.age" = NA, #...
+                              stringsAsFactors = FALSE)
> design.matrix
  college    sex median.age mean.age sd.age
1   JSSFP   male         NA       NA     NA
2    CCCC   male         NA       NA     NA
3   JSSFP female         NA       NA     NA
4    CCCC female         NA       NA     NA
> for(row.i in 1:nrow(design.matrix)) {
+ 
+ # Get factor values for current row
+   college.i <- design.matrix$college[row.i]
+   sex.i <- design.matrix$sex[row.i]
+ 
+ # Subset pirates with current factor values
+   data.temp <- subset(pirates, 
+                       college == college.i & sex == sex.i)
+ 
+ # Calculate statistics
+   median.i <- median(data.temp$age)
+   mean.i <- mean(data.temp$age)
+   sd.i <- sd(data.temp$age)
+ 
+ # Assign statistics to row.i of design.matrix
+   design.matrix$median.age[row.i] <- median.i
+   design.matrix$mean.age[row.i] <- mean.i
+   design.matrix$sd.age[row.i] <- sd.i
+ 
+ }
> design.matrix
  college    sex median.age mean.age   sd.age
1   JSSFP   male         31 32.03226 2.643497
2    CCCC   male         24 23.31234 4.270308
3   JSSFP female         33 33.81356 3.530895
4    CCCC female         26 25.89474 3.386598
> number.list <- list(
+       "a" = rnorm(n = 10),
+       "b" = rnorm(n = 5),
+       "c" = rnorm(n = 15))
>  
>  number.list
$a
 [1]  1.66313690  0.18855486  0.02230243  0.65216638  0.46659389 -0.02040391
 [7] -1.73688704  0.20696871  0.03989779 -1.16047279

$b
[1]  0.7339106 -0.9151006  1.7318662  1.7316519 -1.4514079

$c
 [1] -0.348710186 -2.434993318 -0.004448464  0.263409328 -0.605333181 -0.340357719
 [7] -0.422661809  1.961044596  0.108758285 -0.519568962 -0.223560837  0.873597410
[13]  0.743661689 -0.149595095  0.451712129

> number.list[[1]]
 [1]  1.66313690  0.18855486  0.02230243  0.65216638  0.46659389 -0.02040391
 [7] -1.73688704  0.20696871  0.03989779 -1.16047279
> 
> number.list$b
[1]  0.7339106 -0.9151006  1.7318662  1.7316519 -1.4514079
> 
> samples.ls <- vector("list", 5)
> 
> for(i in 1:5) {
+    samples.ls[[i]] <- rnorm(n = i, mean = 0, sd = 1)
+  }
> samples.ls
[[1]]
[1] 1.294313

[[2]]
[1]  0.3886758 -0.3925621

[[3]]
[1]  0.1481889 -0.6721483 -0.9491760

[[4]]
[1]  0.8754549 -1.3825022  0.5485269 -1.8758684

[[5]]
[1] -0.7527606  1.7226872  0.6442583  1.2608385 -0.1446486

> par(mfrow = c(2, 2))
> for (time.i in c(0, 2, 4, 6)) {
+ data.temp <- subset(ChickWeight, Time == time.i)
+ hist(x = data.temp$weight, main = time.i
+ ) }
> survey <- data.frame(
+ "participant" = c(1, 2, 3, 4, 5, 6),
+ "q1" = c(5, 3, 2, 7, 11, 5), "q2" = c(4, 2, 2, 5, 5, 2), "q3" = c(2, 1, 4, 2, 9, 10), "q4" = c(2, 5, 2, 5, 4, 2), "q5" = c(1, 4, -20, 2, 4, 2) )
> survey.clean <- survey for(i in 2:6){
Error: unexpected 'for' in "survey.clean <- survey for"
> x <- survey.clean[,i]
Error: object 'survey.clean' not found
> x[(x %in% 1:10) == F] <- NA survey.clean[,i] <- x
Error: unexpected symbol in "x[(x %in% 1:10) == F] <- NA survey.clean"
> }
Error: unexpected '}' in "}"
> survey.clean
Error: object 'survey.clean' not found
> survey <- data.frame("q1" = c(5, 3, 2, 7, 11, 5),
+                      "q2" = c(4, 2, 2, 5, 5, 2),
+                      "q3" = c(2, 1, 4, 2, 9, 10),
+                      "q4" = c(2, 5, 2, 5, 4, 2),
+                      "q5" = c(1, 4, -20, 2, 4, 2))
> for(i in 2:6){
+ x <- survey.clean[,i]
+ x[(x %in% 1:10) == F] <- NA survey.clean[,i] <- x
Error: unexpected symbol in:
"x <- survey.clean[,i]
x[(x %in% 1:10) == F] <- NA survey.clean"
> }
Error: unexpected '}' in "}"
> survey.clean
Error: object 'survey.clean' not found
> survey.clean<-data.frame("q1" = c(5, 3, 2, 7, 11, 5),
+                      "q2" = c(4, 2, 2, 5, 5, 2),
+                      "q3" = c(2, 1, 4, 2, 9, 10),
+                      "q4" = c(2, 5, 2, 5, 4, 2),
+                      "q5" = c(1, 4, -20, 2, 4, 2))
> survey.clean
  q1 q2 q3 q4  q5
1  5  4  2  2   1
2  3  2  1  5   4
3  2  2  4  2 -20
4  7  5  2  5   2
5 11  5  9  4   4
6  5  2 10  2   2
> survey.clean <- survey for(i in 2:6){
Error: unexpected 'for' in "survey.clean <- survey for"
> x <- survey.clean[,i]
> x[(x %in% 1:10) == F] <- NA survey.clean[,i] <- x
Error: unexpected symbol in "x[(x %in% 1:10) == F] <- NA survey.clean"
> }
Error: unexpected '}' in "}"
> survey.clean
  q1 q2 q3 q4  q5
1  5  4  2  2   1
2  3  2  1  5   4
3  2  2  4  2 -20
4  7  5  2  5   2
5 11  5  9  4   4
6  5  2 10  2   2
> survey <- data.frame(
+ "participant" = c(1, 2, 3, 4, 5, 6),
+ "q1" = c(5, 3, 2, 7, 11, 5), "q2" = c(4, 2, 2, 5, 5, 2), "q3" = c(2, 1, 4, 2, 9, 10), "q4" = c(2, 5, 2, 5, 4, 2), "q5" = c(1, 4, -20, 2, 4, 2) )
> for(i in 2:6){
+ x <- survey.clean[,i]
+ x[(x %in% 1:10) == F] <- NA survey.clean[,i] <- x
Error: unexpected symbol in:
"x <- survey.clean[,i]
x[(x %in% 1:10) == F] <- NA survey.clean"
> }
Error: unexpected '}' in "}"
> invalid.answers <- rep(NA, 6)
> for(row.i in 1:6) {
+ # Get responses for row i
+ x <- survey[row.i, 2:6]
+ # Determine how many are invalid
+ y <- sum((x %in% 1:10) == F)
+ # Add result to invalid.answers
+ invalid.answers[row.i] <- y }
> survey$invalid.answers <- invalid.answers
> survey
  participant q1 q2 q3 q4  q5 invalid.answers
1           1  5  4  2  2   1               0
2           2  3  2  1  5   4               0
3           3  2  2  4  2 -20               1
4           4  7  5  2  5   2               0
5           5 11  5  9  4   4               1
6           6  5  2 10  2   2               0
> survey.B <- data.frame(
+ "participant" = c(1, 2, 3, 4, 5, 6),
+ "q1" = c(5, 3, 2, 7, 1, 9), "q2" = c(4, 2, 2, 5, 1, 10), "q3" = c(2, 1, 4, 2, 9, 10), "q4" = c(10, 5, 2, 10, 4, 2), "q5" = c(4, 4, 3, 2, 4, 2)
+ )
> survey.B.z <- survey.B
> for(i in 2:6) {x <- survey.B[,i]x.mean <- mean(x)
Error: unexpected symbol in "for(i in 2:6) {x <- survey.B[,i]x.mean"
> x.sd <- sd(x)
> x.z <- (x - x.mean) / x.sdsurvey.B.z[,i]
Error: object 'x.mean' not found
> # Print result!
> survey.B.z
  participant q1 q2 q3 q4 q5
1           1  5  4  2 10  4
2           2  3  2  1  5  4
3           3  2  2  4  2  3
4           4  7  5  2 10  2
5           5  1  1  9  4  4
6           6  9 10 10  2  2
> <- x.z
Error: unexpected assignment in "<-"
> 
> 