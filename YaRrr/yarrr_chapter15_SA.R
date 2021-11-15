
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

The following object is masked _by_ ‘.GlobalEnv’:

    poopdeck


> head(diamonds)
  weight clarity color value
1   9.35    0.88     4 182.5
2  11.10    1.05     5 191.2
3   8.65    0.85     6 175.7
4  10.43    1.15     5 195.2
5  10.62    0.92     5 181.6
6  12.35    0.44     4 182.9
> 
> diamonds.lm <- lm(formula = value ~ weight + clarity + color,
+                   data = diamonds)
> summary(diamonds.lm)

Call:
lm(formula = value ~ weight + clarity + color, data = diamonds)

Residuals:
     Min       1Q   Median       3Q      Max 
-10.4046  -3.5473  -0.1134   3.2552  11.0464 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 148.3354     3.6253  40.917   <2e-16 ***
weight        2.1894     0.2000  10.948   <2e-16 ***
clarity      21.6922     2.1429  10.123   <2e-16 ***
color        -0.4549     0.3646  -1.248    0.214    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 4.672 on 146 degrees of freedom
Multiple R-squared:  0.6373,	Adjusted R-squared:  0.6298 
F-statistic: 85.49 on 3 and 146 DF,  p-value: < 2.2e-16

> names(diamonds.lm)
 [1] "coefficients"  "residuals"     "effects"       "rank"         
 [5] "fitted.values" "assign"        "qr"            "df.residual"  
 [9] "xlevels"       "call"          "terms"         "model"        
> diamonds.lm$coefficients
(Intercept)      weight     clarity       color 
148.3354083   2.1894206  21.6921673  -0.4549392 
> 
> summary(diamonds.lm)$coefficients
               Estimate Std. Error   t value     Pr(>|t|)
(Intercept) 148.3354083  3.6252564 40.917218 7.009013e-82
weight        2.1894206  0.1999856 10.947894 9.705745e-21
clarity      21.6921673  2.1428711 10.122946 1.410955e-18
color        -0.4549392  0.3645894 -1.247812 2.140973e-01
> 
> diamonds$value.lm <- diamonds.lm$fitted.values
> 
> head(diamonds)
  weight clarity color value value.lm
1   9.35    0.88     4 182.5 186.0758
2  11.10    1.05     5 191.2 193.1401
3   8.65    0.85     6 175.7 182.9826
4  10.43    1.15     5 195.2 193.8424
5  10.62    0.92     5 181.6 189.2692
6  12.35    0.44     4 182.9 183.0995
> 
> plot(x = diamonds$value,                          # True values on x-axis
+      y = diamonds.lm$fitted.values,               # fitted values on y-axis
+      xlab = "True Values",
+      ylab = "Model Fitted Values",
+      main = "Regression fits of diamond values")
> 
> abline(b = 1, a = 0)                             # Values should fall around this line!
> diamonds.new <- data.frame(weight = c(12, 6, 5),
+                            clarity = c(1.3, 1, 1.5),
+                            color = c(5, 2, 3))
> 
> predict(object = diamonds.lm,     # The regression model
+         newdata = diamonds.new)  
       1        2        3 
200.5336 182.2542 190.4559 
> diamonds.int.lm <- lm(formula = value ~ weight * clarity,
+                       data = diamonds)
> 
> summary(diamonds.int.lm)$coefficients
                  Estimate Std. Error    t value     Pr(>|t|)
(Intercept)    157.4721482  10.569499 14.8987334 4.169909e-31
weight           0.9786784   1.069683  0.9149234 3.617404e-01
clarity          9.9244813  10.484999  0.9465409 3.454367e-01
weight:clarity   1.2446969   1.055131  1.1796609 2.400537e-01
> diamonds$weight.c <- diamonds$weight - mean(diamonds$weight)
> diamonds$clarity.c <- diamonds$clarity - mean(diamonds$clarity)
> 
> diamonds.int.lm <- lm(formula = value ~ weight.c * clarity.c,
+                       data = diamonds)
> summary(diamonds.int.lm)$coefficients
                     Estimate Std. Error    t value      Pr(>|t|)
(Intercept)        189.401518  0.3830999 494.392034 2.907642e-237
weight.c             2.222877  0.1987610  11.183671  2.322231e-21
clarity.c           22.248309  2.1338360  10.426438  2.271834e-19
weight.c:clarity.c   1.244697  1.0551311   1.179661  2.400537e-01
> 
> diamonds.aov <- aov(diamonds.lm)
> 
> summary(diamonds.aov)
             Df Sum Sq Mean Sq F value Pr(>F)    
weight        1   3218    3218 147.397 <2e-16 ***
clarity       1   2347    2347 107.531 <2e-16 ***
color         1     34      34   1.557  0.214    
Residuals   146   3187      22                   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
>  diamonds.mod1 <- lm(value ~ weight, data = diamonds)
> 
>  diamonds.mod2 <- lm(value ~ weight + clarity, data = diamonds)
> 
>  diamonds.mod3 <- lm(value ~ weight + clarity + color, data = diamonds)
> 
>  anova(diamonds.mod1, diamonds.mod2)
Analysis of Variance Table

Model 1: value ~ weight
Model 2: value ~ weight + clarity
  Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
1    148 5568.7                                  
2    147 3221.3  1    2347.5 107.12 < 2.2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
> anova(diamonds.mod2, diamonds.mod3)
Analysis of Variance Table

Model 1: value ~ weight + clarity
Model 2: value ~ weight + clarity + color
  Res.Df    RSS Df Sum of Sq     F Pr(>F)
1    147 3221.3                          
2    146 3187.3  1    33.991 1.557 0.2141
> 
> anova(diamonds.mod1, diamonds.mod3)
Analysis of Variance Table

Model 1: value ~ weight
Model 2: value ~ weight + clarity + color
  Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
1    148 5568.7                                  
2    146 3187.3  2    2381.5 54.544 < 2.2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
> 
> diamonds$value.g190 <- diamonds$value > 190
> 
> diamond.glm <- glm(formula = value.g190 ~ weight + clarity + color,
+                    data = diamonds,
+                    family = binomial)
> summary(diamond.glm)$coefficients
               Estimate Std. Error   z value     Pr(>|z|)
(Intercept) -18.8009011  3.4634258 -5.428412 5.685775e-08
weight        1.1251118  0.1968203  5.716441 1.087783e-08
clarity       9.2909721  1.9629068  4.733272 2.209289e-06
color        -0.3836406  0.2480698 -1.546503 1.219832e-01
> 
> diamonds$pred.g190 <- diamond.glm$fitted.values
> 
> head(diamonds[c("weight", "clarity", "color", "value", "pred.g190")])
  weight clarity color value  pred.g190
1   9.35    0.88     4 182.5 0.16251772
2  11.10    1.05     5 191.2 0.82129665
3   8.65    0.85     6 175.7 0.03008442
4  10.43    1.15     5 195.2 0.84559083
5  10.62    0.92     5 181.6 0.44454833
6  12.35    0.44     4 182.9 0.08688269
> 
> predict(object = diamond.glm,
+         newdata = diamonds.new)
         1          2          3 
 4.8605008 -3.5265396 -0.3898059 
> ##       1       2       3 
> logit.predictions <- predict(object = diamond.glm,
+                              newdata = diamonds.new
+                              )
> prob.predictions <- 1 / (1 + exp(-logit.predictions))
> 
> prob.predictions
         1          2          3 
0.99231295 0.02856646 0.40376402 
> plot(x = diamonds$weight,
+      y = diamonds$value,
+      xlab = "Weight",
+      ylab = "Value",
+      main = "Adding a regression line with abline()"
+      )
> diamonds.lm <- lm(formula = value ~ weight,
+                   data = diamonds)
> 
> abline(diamonds.lm,
+        col = "red", lwd = 2)
Error in int_abline(a = a, b = b, h = h, v = v, untf = untf, ...) : 
  plot.new has not been called yet
> hist(movies$revenue.all, 
+      main = "Movie revenue\nBefore log-transformation")
> movies$revenue.all.log <- log(movies$revenue.all)
> 
> hist(movies$revenue.all.log, 
+      main = "Log-transformed Movie revenue")
> head(auction)
  cannons rooms age condition  color   style  jbb price
1      18    20 140         5    red classic 3976  3502
2      21    21  93         5    red  modern 3463  2955
3      20    18  48         2   plum classic 3175  3281
4      24    20  81         5 salmon classic 4463  4400
5      20    21  93         2    red  modern 2858  2177
6      21    19  60         6    red classic 4420  3792
> 
> library(yarrr)
> jbb.cannon.lm <- lm(formula = jbb ~ cannons, 
+                     data = auction)
> 
> summary(jbb.cannon.lm)$coefficients
            Estimate Std. Error  t value      Pr(>|t|)
(Intercept) 1396.326  60.569742 23.05319  1.300370e-94
cannons      100.748   2.956476 34.07707 1.931619e-169
> 
> jbb.cannon.modern.lm <- lm(formula = jbb ~ cannons, 
+                           data = subset(auction, style == "modern"))
> 
> jbb.cannon.classic.lm <- lm(formula = jbb ~ cannons, 
+                           data = subset(auction, style == "classic"))
> 
> summary(jbb.cannon.modern.lm)$coefficients
              Estimate Std. Error  t value      Pr(>|t|)
(Intercept) 1217.27769  71.845276 16.94304  3.535431e-51
cannons       99.83212   3.488605 28.61663 3.135059e-107
> 
> summary(jbb.cannon.classic.lm)$coefficients
             Estimate Std. Error  t value      Pr(>|t|)
(Intercept) 1537.0644  75.909014 20.24877  5.887226e-67
cannons      103.5857   3.724782 27.80988 2.019452e-103
> int.lm <- lm(formula = jbb ~ style * age,
+              data = auction
+              )
> summary(int.lm)$coefficients
                   Estimate  Std. Error    t value      Pr(>|t|)
(Intercept)     3414.159853  79.1958008 43.1103647 5.950734e-230
stylemodern      -15.724384 111.7382609 -0.1407252  8.881155e-01
age                1.947393   0.7564536  2.5743722  1.018570e-02
stylemodern:age   -3.673715   1.0701565 -3.4328766  6.217865e-04
> 
> jbb.all.lm <- lm(jbb ~ cannons + rooms + age + condition + color + style,
+                  data = auction
+                  )
> 
> summary(jbb.all.lm)$coefficients
               Estimate Std. Error     t value      Pr(>|t|)
(Intercept)  134.361542  52.858476   2.5419110  1.117630e-02
cannons      100.701336   1.551230  64.9171074  0.000000e+00
rooms         50.463422   1.638292  30.8024528 1.175723e-146
age            1.141996   0.204610   5.5813305  3.081126e-08
condition    107.648347   3.913309  27.5082640 3.356423e-124
colorbrown     4.915661  16.607746   0.2959860  7.673028e-01
colorplum    -29.753257  31.324719  -0.9498332  3.424288e-01
colorred      15.065058  18.322732   0.8222059  4.111577e-01
colorsalmon  -19.425891  20.747224  -0.9363128  3.493405e-01
stylemodern -397.781546  12.838092 -30.9844757 6.692196e-148
> 
> price.all.lm <- lm(price ~ cannons + rooms + age + condition + color + style,
+                  data = auction
+                  )
> summary(price.all.lm)$coefficients
               Estimate Std. Error     t value      Pr(>|t|)
(Intercept)  302.537435 73.8091950   4.0989125  4.490974e-05
cannons      100.009515  2.1660671  46.1710150 3.963897e-249
rooms         48.817358  2.2876376  21.3396378  2.005213e-83
age            1.222873  0.2857082   4.2801447  2.049159e-05
condition    104.113644  5.4643689  19.0531874  3.401876e-69
colorbrown  -119.201672 23.1903085  -5.1401503  3.306970e-07
colorplum     15.645526 43.7404264   0.3576903  7.206513e-01
colorred    -603.588315 25.5850372 -23.5914574  5.351434e-98
colorsalmon   70.367922 28.9704895   2.4289518  1.531967e-02
stylemodern -419.156802 17.9265331 -23.3819222  1.269003e-96
> 
> auction$price.gt.3500 <- auction$price > 3500
> 
> price.all.blr <- glm(price.gt.3500 ~ cannons + rooms + age + condition + color + style,
+                  data = auction,
+                  family = binomial   # Logistic regression
+                  )
> summary(price.all.blr)$coefficients
                 Estimate  Std. Error     z value     Pr(>|z|)
(Intercept) -19.740094021 1.424015345 -13.8622762 1.072195e-43
cannons       0.625063195 0.044209500  14.1386625 2.194150e-45
rooms         0.268830315 0.029645863   9.0680548 1.211606e-19
age           0.009679072 0.003302151   2.9311414 3.377190e-03
condition     0.682511646 0.074543009   9.1559444 5.388440e-20
colorbrown   -0.892408487 0.254883365  -3.5012426 4.630941e-04
colorplum    -0.129114009 0.508960693  -0.2536817 7.997415e-01
colorred     -4.076423193 0.410714173  -9.9252070 3.234309e-23
colorsalmon   0.247896652 0.317232324   0.7814357 4.345463e-01
stylemodern  -2.403747935 0.243187906  -9.8843235 4.868590e-23
> 
> new.ships <- data.frame(cannons = c(12, 8, 32),
+                   rooms = c(34, 26, 65),
+                   age = c(43, 54, 100),
+                   condition = c(7, 3, 5),
+                   color = c("black", "black", "red"),
+                   style = c("classic", "modern", "modern"),
+                   stringsAsFactors = FALSE)
> 
> predict(object = price.all.lm,
+         newdata = new.ships
+         )
       1        2        3 
3943.821 2331.084 6296.081 
> log.pred <- predict(object = price.all.blr,
+                     newdata = new.ships
+                     )
> 
> 1 / (1 + exp(-log.pred))
           1            2            3 
0.8903846993 0.0005084966 0.9999998381 
> 