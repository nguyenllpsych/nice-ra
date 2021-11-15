
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
> 