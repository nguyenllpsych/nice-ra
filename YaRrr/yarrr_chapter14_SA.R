
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

> head(poopdeck)
Error in head(poopdeck) : object 'poopdeck' not found
> 
> libary(yarrr)
Error in libary(yarrr) : could not find function "libary"
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
> head(poopdeck)
  day cleaner   type time
1   1       a parrot   47
2   1       b parrot   55
3   1       c parrot   64
4   1       a  shark  101
5   1       b  shark   76
6   1       c  shark   63
> 
> pirateplot(formula = time ~ cleaner + type,
+            data = poopdeck,
+            ylim = c(0, 150),
+            xlab = "Cleaner",
+            ylab = "Cleaning Time (minutes)",
+            main = "poopdeck data",
+            back.col = gray(.97), 
+            cap.beans = TRUE, 
+            theme = 2)
> mod.aov <- aov(formula = y ~ x1 + x2 + ...,
+                data = data)
Error in model.frame.default(formula = y ~ x1 + x2 + ..., data = data,  : 
  'data' must be a data.frame, environment, or list
> mod.aov <- aov(formula = y ~ x1 + x2
+                data = data)
Error: unexpected symbol in:
"mod.aov <- aov(formula = y ~ x1 + x2
               data"
> mod.aov <- aov(formula = y ~ x1 + x2,
+                data = data)
Error in model.frame.default(formula = y ~ x1 + x2, data = data, drop.unused.levels = TRUE) : 
  'data' must be a data.frame, environment, or list
> summary(mod.aov)
Error in h(simpleError(msg, call)) : 
  error in evaluating the argument 'object' in selecting a method for function 'summary': object 'mod.aov' not found
> TukeyHSD(mod.aov)
Error in TukeyHSD(mod.aov) : object 'mod.aov' not found
> mod.lm <- lm(formula = y ~ x1 + x2 + ...,
+              data = data)
Error in model.frame.default(formula = y ~ x1 + x2 + ..., data = data,  : 
  'data' must be a data.frame, environment, or list
> 
> summary(mod.lm)
Error in h(simpleError(msg, call)) : 
  error in evaluating the argument 'object' in selecting a method for function 'summary': object 'mod.lm' not found
> library(dplyr)

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> library(yarrr)
> 
> head(poopdeck)
  day cleaner   type time
1   1       a parrot   47
2   1       b parrot   55
3   1       c parrot   64
4   1       a  shark  101
5   1       b  shark   76
6   1       c  shark   63
> pirateplot(formula = time ~ cleaner + type,
+            data = poopdeck,
+            ylim = c(0, 150),
+            xlab = "Cleaner",
+            ylab = "Cleaning Time (minutes)",
+            main = "poopdeck data",
+            back.col = gray(.97), 
+            cap.beans = TRUE, 
+            theme = 2)
> mod.aov <- aov(formula = y ~ x1 + x2 + ...,
+                data = data)
Error in model.frame.default(formula = y ~ x1 + x2 + ..., data = data,  : 
  'data' must be a data.frame, environment, or list
> 
> g1 <- rnorm(100, mean = 50, sd = 3)
> g2 <- rnorm(100, mean = 60, sd = 3)
> g3 <- rnorm(100, mean = 40, sd = 3)
> g1.c <- (g1 - mean(g1)) + 50
> g2.c <- (g2 - mean(g2)) + 50
> g3.c <- (g3 - mean(g3)) + 50
> df <- data.frame(data = c(g1, g2, g3),
+                  data.c = c(g1.c, g2.c, g3.c),
+                  group = rep(1:3, each = 100)
+ )
> 
> pirateplot(data ~ group, data = df,
+            theme = 0,
+            point.o = .5,
+            xlim = c(.5, 9),
+            bean.b.o = .5,
+            jitter.val = .08,
+            xlab = "",
+            avg.line.o = 1,
+            point.cex = .7,
+            at = 1:3,
+            ylim = c(0, 120),
+            yaxt = "n", xaxt = "n", cut.min = 0, cut.max = 100)
> mtext(c("A", "B", "C"), side = 1, at = 1:3, line = 1, cex = 1.5)
> 
> mod.aov <- aov(formula = y ~ x1 + x2 + ...,
+                data = data)
Error in model.frame.default(formula = y ~ x1 + x2 + ..., data = data,  : 
  'data' must be a data.frame, environment, or list
> 
> yarrr::pirateplot(time ~ cleaner, 
+                   data = poopdeck, 
+                   theme = 2, 
+                   cap.beans = TRUE,
+                   main = "formula = time ~ cleaner")
> ```
Error: attempt to use zero-length variable name
> cleaner.aov <- aov(formula = time ~ cleaner,
+                    data = poopdeck)
> summary(cleaner.aov)
             Df Sum Sq Mean Sq F value  Pr(>F)   
cleaner       2   6057    3028   5.294 0.00526 **
Residuals   597 341511     572                   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> TukeyHSD(cleaner.aov)
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = time ~ cleaner, data = poopdeck)

$cleaner
     diff        lwr        upr     p adj
b-a -0.42  -6.039575  5.1995746 0.9831441
c-a -6.94 -12.559575 -1.3204254 0.0107324
c-b -6.52 -12.139575 -0.9004254 0.0180906

> cleaner.lm <- lm(formula = time ~ cleaner,
+                  data = poopdeck)
> summary(cleaner.lm)

Call:
lm(formula = time ~ cleaner, data = poopdeck)

Residuals:
   Min     1Q Median     3Q    Max 
-63.02 -16.60  -1.05  16.92  71.92 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   66.020      1.691  39.037  < 2e-16 ***
cleanerb      -0.420      2.392  -0.176  0.86066    
cleanerc      -6.940      2.392  -2.902  0.00385 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 23.92 on 597 degrees of freedom
Multiple R-squared:  0.01743,	Adjusted R-squared:  0.01413 
F-statistic: 5.294 on 2 and 597 DF,  p-value: 0.005261

> 
> cleaner.type.aov <- aov(formula = time ~ cleaner + type,
+                         data = poopdeck)
> summary(cleaner.type.aov)
             Df Sum Sq Mean Sq F value  Pr(>F)    
cleaner       2   6057    3028   6.945 0.00104 ** 
type          1  81620   81620 187.177 < 2e-16 ***
Residuals   596 259891     436                    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
> TukeyHSD(cleaner.type.aov)
  Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = time ~ cleaner + type, data = poopdeck)

$cleaner
     diff        lwr       upr     p adj
b-a -0.42  -5.326395  4.486395 0.9779465
c-a -6.94 -11.846395 -2.033605 0.0027112
c-b -6.52 -11.426395 -1.613605 0.0053376

$type
                 diff      lwr      upr p adj
shark-parrot 23.32667 19.97811 26.67522     0

> 
> cleaner.type.lm <- lm(formula = time ~ cleaner + type,
+                       data = poopdeck)
> summary(cleaner.type.lm)

Call:
lm(formula = time ~ cleaner + type, data = poopdeck)

Residuals:
    Min      1Q  Median      3Q     Max 
-59.743 -13.792  -0.683  13.583  83.583 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)   54.357      1.705  31.881  < 2e-16 ***
cleanerb      -0.420      2.088  -0.201 0.840665    
cleanerc      -6.940      2.088  -3.323 0.000944 ***
typeshark     23.327      1.705  13.681  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 20.88 on 596 degrees of freedom
Multiple R-squared:  0.2523,	Adjusted R-squared:  0.2485 
F-statistic: 67.02 on 3 and 596 DF,  p-value: < 2.2e-16

> cleaner.type.int.aov <- aov(formula = time ~ cleaner * type,
+                           data = poopdeck)
> summary(cleaner.type.int.aov)
              Df Sum Sq Mean Sq F value   Pr(>F)    
cleaner        2   6057    3028   7.824 0.000443 ***
type           1  81620   81620 210.863  < 2e-16 ***
cleaner:type   2  29968   14984  38.710  < 2e-16 ***
Residuals    594 229923     387                     
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
> cleaner.type.int.lm <- lm(formula = time ~ cleaner * type,
+                           data = poopdeck)
> summary(cleaner.type.int.lm)

Call:
lm(formula = time ~ cleaner * type, data = poopdeck)

Residuals:
   Min     1Q Median     3Q    Max 
-54.28 -12.83  -0.08  12.29  74.87 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)          45.760      1.967  23.259  < 2e-16 ***
cleanerb              8.060      2.782   2.897 0.003908 ** 
cleanerc             10.370      2.782   3.727 0.000212 ***
typeshark            40.520      2.782  14.563  < 2e-16 ***
cleanerb:typeshark  -16.960      3.935  -4.310 1.91e-05 ***
cleanerc:typeshark  -34.620      3.935  -8.798  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 19.67 on 594 degrees of freedom
Multiple R-squared:  0.3385,	Adjusted R-squared:  0.3329 
F-statistic: 60.79 on 5 and 594 DF,  p-value: < 2.2e-16

> time.lm <- lm(formula = time ~ type + cleaner,
+               data = poopdeck)
> time.I.aov <- aov(time.lm)
> 
> time.II.aov <- car::Anova(time.lm, type = 2)
Error in loadNamespace(x) : there is no package called ‘car’
> 
> 
> time.III.aov <- car::Anova(time.lm, type = 3)
Error in loadNamespace(x) : there is no package called ‘car’
> 
> time.II.aov <- car::Anova(time.lm, type = 2)
Error in loadNamespace(x) : there is no package called ‘car’
> 
> time.III.aov <- car::Anova(time.lm, type = 3)
Error in loadNamespace(x) : there is no package called ‘car’
> 
> with(poopdeck,
+      table(cleaner, type))
       type
cleaner parrot shark
      a    100   100
      b    100   100
      c    100   100
> names(cleaner.type.int.aov)
 [1] "coefficients"  "residuals"     "effects"       "rank"         
 [5] "fitted.values" "assign"        "qr"            "df.residual"  
 [9] "contrasts"     "xlevels"       "call"          "terms"        
[13] "model"        
> 
> poopdeck$int.fit <- cleaner.type.int.aov$fitted.values
> 
> poopdeck$me.fit <- cleaner.type.aov$fitted.values
> 
> head(poopdeck)
  day cleaner   type time int.fit   me.fit
1   1       a parrot   47   45.76 54.35667
2   1       b parrot   55   53.82 53.93667
3   1       c parrot   64   56.13 47.41667
4   1       a  shark  101   86.28 77.68333
5   1       b  shark   76   77.38 77.26333
6   1       c  shark   63   62.03 70.74333
> 
> mean(abs(poopdeck$int.fit - poopdeck$time))
[1] 15.35173
> 
> mean(abs(poopdeck$me.fit - poopdeck$time))
[1] 16.5351
> 
> library(lme4)
Error in library(lme4) : there is no package called ‘lme4’
> 
> install.packages(lme4)
Error in install.packages(lme4) : object 'lme4' not found
> install.packages(lme4)
Error in install.packages(lme4) : object 'lme4' not found
> library(lme4)
Error in library(lme4) : there is no package called ‘lme4’
> my.mod <- lmer(formula = time ~ cleaner + type + (1|day),
+                 data = poopdeck)
Error in lmer(formula = time ~ cleaner + type + (1 | day), data = poopdeck) : 
  could not find function "lmer"
> pixar.aov <- aov(formula = tattoos ~ fav.pixar,
+              data = pirates)
> 
> summary(pixar.aov)
             Df Sum Sq Mean Sq F value Pr(>F)
fav.pixar    14    226   16.12    1.43  0.132
Residuals   985  11105   11.27               
> favpirate.aov <- aov(formula = tattoos ~ favorite.pirate,
+                      data = pirates)
> 
> summary(favpirate.aov)
                 Df Sum Sq Mean Sq F value Pr(>F)
favorite.pirate   5     83   16.65   1.471  0.197
Residuals       994  11248   11.32               
> pirpix.aov <- aov(formula = tattoos ~ favorite.pirate + fav.pixar,
+                   data = pirates)
> 
> summary(pirpix.aov)
                 Df Sum Sq Mean Sq F value Pr(>F)
favorite.pirate   5     83   16.65   1.479  0.194
fav.pixar        14    218   15.60   1.386  0.153
Residuals       980  11029   11.25               
> 
> pirpix.int.aov <- aov(formula = tattoos ~ favorite.pirate * fav.pixar,
+                       data = pirates)
> 
> summary(pirpix.int.aov)
                           Df Sum Sq Mean Sq F value Pr(>F)
favorite.pirate             5     83   16.65   1.473  0.196
fav.pixar                  14    218   15.60   1.380  0.156
favorite.pirate:fav.pixar  65    685   10.54   0.932  0.630
Residuals                 915  10344   11.30               
> 