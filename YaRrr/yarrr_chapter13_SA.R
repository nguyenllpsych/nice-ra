
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

> getwd()
[1] "/Users/salmaabusamrah"
> ls()
 [1] "a"              "b"              "c"              "data"          
 [5] "FavoritePirate" "group.mean"     "model"          "my.age"        
 [9] "sum.1.to.5"     "tat.sword.lm"   "tchests.model" 
> study1.df <- data.frame(id = 1:5, 
+                         sex = c("m", "m", "f", "f", "m"), 
+                         score = c(51, 20, 67, 52, 42))
> 
> score.by.sex <- aggregate(score ~ sex, 
+                           FUN = mean, 
+                           data = study1.df)
> 
> study1.htest <- t.test(score ~ sex, 
+                        data = study1.df)
> save(study1.df, score.by.sex, study1.htest,
+      file = "data/study1.RData")
Error in gzfile(file, "wb") : cannot open the connection
In addition: Warning message:
In gzfile(file, "wb") :
  cannot open compressed file 'data/study1.RData', probable reason 'No such file or directory'
> save.image(file = "data/projectimage.RData")
Error in gzfile(file, "wb") : cannot open the connection
In addition: Warning message:
In gzfile(file, "wb") :
  cannot open compressed file 'data/projectimage.RDataTmp', probable reason 'No such file or directory'
> load(file = "data/study1.RData")
Error in readChar(con, 5L, useBytes = TRUE) : cannot open the connection
In addition: Warning messages:
1: In file.remove(outfile) :
  cannot remove file 'data/projectimage.RDataTmp', reason 'No such file or directory'
2: In readChar(con, 5L, useBytes = TRUE) :
  cannot open compressed file 'data/study1.RData', probable reason 'No such file or directory'
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
> study1.df <- data.frame(id = 1:5, 
+                         sex = c("m", "m", "f", "f", "m"), 
+                         score = c(51, 20, 67, 52, 42))
> 
> score.by.sex <- aggregate(score ~ sex, 
+                           FUN = mean, 
+                           data = study1.df)
> 
> study1.htest <- t.test(score ~ sex, 
+                        data = study1.df)
> save(study1.df, score.by.sex, study1.htest,
+      file = "data/study1.RData")
Error in gzfile(file, "wb") : cannot open the connection
In addition: Warning message:
In gzfile(file, "wb") :
  cannot open compressed file 'data/study1.RData', probable reason 'No such file or directory'
> save.image(file = "data/projectimage.RData")
Error in gzfile(file, "wb") : cannot open the connection
In addition: Warning message:
In gzfile(file, "wb") :
  cannot open compressed file 'data/projectimage.RDataTmp', probable reason 'No such file or directory'
> load(file = "data/study1.RData")
Error in readChar(con, 5L, useBytes = TRUE) : cannot open the connection
In addition: Warning messages:
1: In file.remove(outfile) :
  cannot remove file 'data/projectimage.RDataTmp', reason 'No such file or directory'
2: In readChar(con, 5L, useBytes = TRUE) :
  cannot open compressed file 'data/study1.RData', probable reason 'No such file or directory'
> load(file = "data/projectimage.RData")
Error in readChar(con, 5L, useBytes = TRUE) : cannot open the connection
In addition: Warning message:
In readChar(con, 5L, useBytes = TRUE) :
  cannot open compressed file 'data/projectimage.RData', probable reason 'No such file or directory'
> rm(huge.df)
Warning message:
In rm(huge.df) : object 'huge.df' not found
> study1.df <- data.frame(id = 1:5, 
+                         sex = c("m", "m", "f", "f", "m"), 
+                         score = c(51, 20, 67, 52, 42))
> 
> score.by.sex <- aggregate(score ~ sex, 
+                           FUN = mean, 
+                           data = study1.df)
> 
> study1.htest <- t.test(score ~ sex, 
+                        data = study1.df)
> save(study1.df, score.by.sex, study1.htest,
+      file = "data/study1.RData")
Error in gzfile(file, "wb") : cannot open the connection
In addition: Warning message:
In gzfile(file, "wb") :
  cannot open compressed file 'data/study1.RData', probable reason 'No such file or directory'
> save(study1.df, score.by.sex, study1.htest,
+      file = "data/study1.RData")
Error in gzfile(file, "wb") : cannot open the connection
In addition: Warning message:
In gzfile(file, "wb") :
  cannot open compressed file 'data/study1.RData', probable reason 'No such file or directory'
> a <- data.frame("sex" = c("m", "f", "m"),
+                 "age" = c(19, 43, 25),
+                 "favorite.movie" = c("Moon", "The Goonies", "Spice World"))
> b <- mean(a$age)
> c <- table(a$sex)
> ls()
 [1] "a"              "b"              "c"              "data"          
 [5] "FavoritePirate" "group.mean"     "model"          "my.age"        
 [9] "score.by.sex"   "study1.df"      "study1.htest"   "sum.1.to.5"    
[13] "tat.sword.lm"   "tchests.model" 
> library(yarrr)
> 
> t.test(x = pirates$age, 
+        mu = 30)

	One Sample t-test

data:  pirates$age
t = -14.427, df = 999, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 30
95 percent confidence interval:
 27.00092 27.71908
sample estimates:
mean of x 
    27.36 

> sex.ttest <- t.test(formula = tattoos ~ sex,
+                     data = pirates, 
+                     subset = sex %in% c("male", "female"))
> sex.ttest # Print result

	Welch Two Sample t-test

data:  tattoos by sex
t = -0.016792, df = 952, p-value = 0.9866
alternative hypothesis: true difference in means between group female and group male is not equal to 0
95 percent confidence interval:
 -0.4313270  0.4240083
sample estimates:
mean in group female   mean in group male 
            9.431034             9.434694 

> cor.test(formula = ~ age + height,
+           data = pirates)

	Pearson's product-moment correlation

data:  age and height
t = -6.9204, df = 998, p-value = 8.042e-12
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.2723684 -0.1540389
sample estimates:
       cor 
-0.2139885 

> 
> # Chi-Square test
> # Is there a relationship between college and favorite pirate?
> chisq.test(x = pirates$college,
+            y = pirates$favorite.pirate)

	Pearson's Chi-squared test

data:  pirates$college and pirates$favorite.pirate
X-squared = 52.138, df = 5, p-value = 5.054e-10

> american.bp <- c(3, 5, 2, 1, 4, 4, 6, 3, 5, 4)
> european.bp <- c(6, 5, 7, 7, 6, 3, 4, 6, 5, 4)
> 
> # Store data in a dataframe
> bp.survey <- data.frame("bp" = c(american.bp, european.bp),
+                         "group" = rep(c("American", "European"), each = 10),
+                          stringsAsFactors = FALSE)
> yarrr::pirateplot(bp ~ group,
+                  data = bp.survey,
+                  main = "Body Piercing Survey",
+                  ylab = "Number of Body Piercings",
+                  xlab = "Group", 
+                  theme = 2, point.o = .8, cap.beans = TRUE)
> summary(american.bp)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   1.00    3.00    4.00    3.70    4.75    6.00 
> ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
> ##     1.0     3.0     4.0     3.7     4.8     6.0
> summary(european.bp)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
   3.00    4.25    5.50    5.30    6.00    7.00 
> ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
> ##     3.0     4.2     5.5     5.3     6.0     7.0
> bp.test <- t.test(x = american.bp,
+                   y = european.bp,
+                   alternative = "two.sided")
> bp.test

	Welch Two Sample t-test

data:  american.bp and european.bp
t = -2.5228, df = 17.783, p-value = 0.0214
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -2.9335927 -0.2664073
sample estimates:
mean of x mean of y 
      3.7       5.3 

> bp.test$p.value
[1] 0.02140251
> 
> height.htest <- t.test(formula = height ~ sex,
+                        data = pirates,
+                        subset = sex %in% c("male", "female"))
> height.htest

	Welch Two Sample t-test

data:  height by sex
t = -20.655, df = 950.55, p-value < 2.2e-16
alternative hypothesis: true difference in means between group female and group male is not equal to 0
95 percent confidence interval:
 -15.26008 -12.61186
sample estimates:
mean in group female   mean in group male 
            163.0436             176.9796 

> names(height.htest)
 [1] "statistic"   "parameter"   "p.value"     "conf.int"    "estimate"   
 [6] "null.value"  "stderr"      "alternative" "method"      "data.name"  
> height.htest$statistic
        t 
-20.65452 
> height.htest$p.value
[1] 1.389065e-78
> 
> height.htest$conf.int
[1] -15.26008 -12.61186
attr(,"conf.level")
[1] 0.95
> tattoo.ttest <- t.test(x = pirates$tattoos,  # Vector of data
+                        mu = 5) 
> tattoo.ttest

	One Sample t-test

data:  pirates$tattoos
t = 41.587, df = 999, p-value < 2.2e-16
alternative hypothesis: true mean is not equal to 5
95 percent confidence interval:
 9.22001 9.63799
sample estimates:
mean of x 
    9.429 

> tattoo.ttest <- t.test(x = pirates$tattoos,
+                        mu = 9.5) 
> t.test(formula = y ~ x,  # Formula
+        data = df) 
Error in model.frame.default(formula = y ~ x, data = df) : 
  'data' must be a data.frame, environment, or list
> 
> t.test(x = x,  # First vector
+        y = y)
Error in t.test(x = x, y = y) : object 'x' not found
> tat.patch.htest <- t.test(formula = tattoos ~ eyepatch,
+                           data = pirates)
> names(tat.patch.htest)
 [1] "statistic"   "parameter"   "p.value"     "conf.int"    "estimate"   
 [6] "null.value"  "stderr"      "alternative" "method"      "data.name"  
> tat.patch.htest$conf.int
[1] -0.1641539  0.7087957
attr(,"conf.level")
[1] 0.95
> 
> t.test(formula = tattoos ~ age,
+        data = pirates)
Error in t.test.formula(formula = tattoos ~ age, data = pirates) : 
  grouping factor must have exactly 2 levels
> tatage.htest <- t.test(formula = tattoos ~ age,
+                        data = pirates,
+                        subset = age %in% c(29, 30))
> t.test(formula = tattoos ~ college,
+        data = pirates,
+        subset = sex == "female")

	Welch Two Sample t-test

data:  tattoos by college
t = 1.0713, df = 461.26, p-value = 0.2846
alternative hypothesis: true difference in means between group CCCC and group JSSFP is not equal to 0
95 percent confidence interval:
 -0.2714396  0.9220492
sample estimates:
 mean in group CCCC mean in group JSSFP 
           9.596491            9.271186 

> cor.test(formula = ~ x + y,
+          data = df)
Error in model.frame.default(formula = ~x + y, data = df) : 
  'data' must be a data.frame, environment, or list
> cor.test(x = x,
+          y = y)
Error in cor.test(x = x, y = y) : object 'x' not found
> age.parrots.ctest <- cor.test(formula = ~ age + parrots,
+                              data = pirates)
> 
> age.parrots.ctest

	Pearson's product-moment correlation

data:  age and parrots
t = 6.1311, df = 998, p-value = 1.255e-09
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.1300655 0.2495678
sample estimates:
      cor 
0.1905224 

> age.parrots.ctest <- cor.test(x = pirates$age,
+                              y = pirates$parrots)
> 
> age.parrots.ctest

	Pearson's product-moment correlation

data:  pirates$age and pirates$parrots
t = 6.1311, df = 998, p-value = 1.255e-09
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.1300655 0.2495678
sample estimates:
      cor 
0.1905224 

> names(age.parrots.ctest)
[1] "statistic"   "parameter"   "p.value"     "estimate"    "null.value" 
[6] "alternative" "method"      "data.name"   "conf.int"   
> age.parrots.ctest$conf.int
[1] 0.1300655 0.2495678
attr(,"conf.level")
[1] 0.95
> cor.test(formula = ~ age + parrots,
+          data = pirates,
+          subset = sex == "female")

	Pearson's product-moment correlation

data:  age and parrots
t = 4.6727, df = 462, p-value = 3.906e-06
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.1237924 0.2977054
sample estimates:
      cor 
0.2124305 

> chisq.test(x = table(x))
Error in table(x) : object 'x' not found
> table(pirates$college)

 CCCC JSSFP 
  658   342 
> college.cstest <- chisq.test(x = table(pirates$college))
> 
> college.cstest

	Chi-squared test for given probabilities

data:  table(pirates$college)
X-squared = 99.856, df = 1, p-value < 2.2e-16

> table(pirates$eyepatch, 
+       pirates$college)
   
    CCCC JSSFP
  0  225   117
  1  433   225
> colpatch.cstest <- chisq.test(x = table(pirates$college,
+                                         pirates$eyepatch))
> 
> colpatch.cstest

	Pearson's Chi-squared test with Yates' continuity correction

data:  table(pirates$college, pirates$eyepatch)
X-squared = 0, df = 1, p-value = 1

> test.result <- t.test(age ~ headband,
+                       data = pirates)
> test.result

	Welch Two Sample t-test

data:  age by headband
t = 0.35135, df = 135.47, p-value = 0.7259
alternative hypothesis: true difference in means between group no and group yes is not equal to 0
95 percent confidence interval:
 -1.030754  1.476126
sample estimates:
 mean in group no mean in group yes 
         27.55752          27.33484 

> yarrr::apa(test.result)
[1] "mean difference = -0.22, t(135.47) = 0.35, p = 0.73 (2-tailed)"
> age.parrots.ctest <- cor.test(formula = ~ age + parrots,
+                               data = pirates)
> 
> age.parrots.ctest

	Pearson's product-moment correlation

data:  age and parrots
t = 6.1311, df = 998, p-value = 1.255e-09
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.1300655 0.2495678
sample estimates:
      cor 
0.1905224 

> yarrr::apa(age.parrots.ctest)
[1] "r = 0.19, t(998) = 6.13, p < 0.01 (2-tailed)"
> beard.sex.htest <- t.test(formula = beard.length ~ sex,
+                            subset = sex %in% c("male", "female"),
+                            data = pirates)
> 
> beard.sex.htest

	Welch Two Sample t-test

data:  beard.length by sex
t = -70.887, df = 499.82, p-value < 2.2e-16
alternative hypothesis: true difference in means between group female and group male is not equal to 0
95 percent confidence interval:
 -19.54472 -18.49052
sample estimates:
mean in group female   mean in group male 
           0.3987069           19.4163265 

> apa(beard.sex.htest)
[1] "mean difference = 19.02, t(499.82) = -70.89, p < 0.01 (2-tailed)"
> df <- subset(pirates, fav.pixar %in% c("Up", "Inside Out"))
> pixar.ep.table <- table(df$fav.pixar, df$eyepatch)
> 
> pixar.ep.htest <- chisq.test(pixar.ep.table)
> pixar.ep.htest

	Pearson's Chi-squared test with Yates' continuity correction

data:  pixar.ep.table
X-squared = 88.964, df = 1, p-value < 2.2e-16

> apa(pixar.ep.htest)
[1] "X(1, N = 422) = 88.96, p < 0.01 (2-tailed)"
> budget.time.htest <- cor.test(formula = ~ budget + time,
+                               data = movies)
> 
> budget.time.htest

	Pearson's product-moment correlation

data:  budget and time
t = 14.086, df = 2313, p-value < 2.2e-16
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.2431172 0.3181687
sample estimates:
      cor 
0.2810726 

> apa(budget.time.htest)
[1] "r = 0.28, t(2313) = 14.09, p < 0.01 (2-tailed)"
> revenue.rating.htest <- t.test(formula = revenue.all ~ rating,
+                                subset = rating %in% c("R", "PG-13"),
+                                data = movies)
> 
> apa(revenue.rating.htest)
[1] "mean difference = -68.86, t(1779.2) = 10.67, p < 0.01 (2-tailed)"
> genre.table <- table(movies$genre)
> genre.htest <- chisq.test(genre.table)
> 
> genre.htest

	Chi-squared test for given probabilities

data:  genre.table
X-squared = 6408.9, df = 13, p-value < 2.2e-16

> apa(genre.htest)
[1] "X(13, N = 4682) = 6408.91, p < 0.01 (2-tailed)"
> 
> genre.sequel.table <- table(movies$genre, movies$sequel)
> 
> genre.sequel.htest <- chisq.test(genre.sequel.table)
Warning message:
In chisq.test(genre.sequel.table) :
  Chi-squared approximation may be incorrect
> apa(genre.sequel.htest)
[1] "X(13, N = 4669) = 387.17, p < 0.01 (2-tailed)"
> genre.sequel.table <- table(movies$genre, movies$sequel)
> 
> genre.sequel.table <- genre.sequel.table + 20
> 
> genre.sequel.table
                     
                         0    1
  Action               550  178
  Adventure            384  141
  Black Comedy          54   20
  Comedy              1078  172
  Concert/Performance   34   20
  Documentary           83   20
  Drama               1077   46
  Horror               235  105
  Multiple Genres       21   20
  Musical               92   25
  Reality               22   20
  Romantic Comedy      265   23
  Thriller/Suspense    425   41
  Western               57   21
> genre.sequel.htest <- chisq.test(genre.sequel.table)
> 
> genre.sequel.htest

	Pearson's Chi-squared test

data:  genre.sequel.table
X-squared = 388.31, df = 13, p-value < 2.2e-16

> 
> 