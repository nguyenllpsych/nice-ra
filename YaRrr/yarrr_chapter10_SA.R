> exam <- data.frame(
+   id = 1:5,
+   q1 = c(1, 5, 2, 3, 2),
+   q2 = c(8, 10, 9, 8, 7),
+   q3 = c(3, 7, 4, 6, 4))
> 
> # Demographic data
> demographics <- data.frame(
+   id = 1:5,
+   sex = c("f", "m", "f", "f", "m"),
+   age = c(25, 22, 24, 19, 23))
> 
> # Combine exam and demographics
> combined <- merge(x = exam, 
+               y = demographics, 
+               by = "id")
> 
> # Mean q1 score for each sex
> aggregate(formula = q1 ~ sex, 
+           data = combined, 
+           FUN = mean)
  sex  q1
1   f 2.0
2   m 3.5
> ##   sex  q1
> ## 1   f 2.0
> ## 2   m 3.5
> 
> # Median q3 score for each sex, but only for those
> #   older than 20
> aggregate(formula = q3 ~ sex, 
+           data = combined,
+           subset = age > 20,
+           FUN = mean)
  sex  q3
1   f 3.5
2   m 5.5
> ##   sex  q3
> ## 1   f 3.5
> ## 2   m 5.5
> 
> # Many summary statistics by sex using dplyr!
> library(dplyr)
Error in library(dplyr) : there is no package called ‘dplyr’
> combined %>% group_by(sex) %>%
+   summarise(
+     q1.mean = mean(q1),
+     q2.mean = mean(q2),
+     q3.mean = mean(q3),
+     age.mean = mean(age),
+     N = n())
Error in combined %>% group_by(sex) %>% summarise(q1.mean = mean(q1),  : 
  could not find function "%>%"
> ## # A tibble: 2 x 6
> ##      sex q1.mean q2.mean q3.mean age.mean     N
> ##   <fctr>   <dbl>   <dbl>   <dbl>    <dbl> <int>
> ## 1      f     2.0     8.3     4.3       23     3
> ## 2      m     3.5     8.5     5.5       22     2
> 
> 
> # Sort the pirates dataframe by height
> pirates <- pirates[order(pirates$height),]
Error: object 'pirates' not found
> 
> # Look at the first few rows and columns of the result
> pirates[1:5, 1:4]
Error: object 'pirates' not found
> ##      id    sex age height
> ## 39   39 female  25    130
> ## 854 854 female  25    130
> ## 30   30 female  26    135
> ## 223 223 female  28    135
> ## 351 351 female  36    137
> library("yarrr")
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
> pirates <- pirates[order(pirates$height),]
> 
> # Look at the first few rows and columns of the result
> pirates[1:5, 1:4]
     id    sex age height
39   39 female  25 129.83
854 854 female  25 130.41
30   30 female  26 134.87
223 223 female  28 135.15
351 351 female  36 137.43
> ##      id    sex age height
> ## 39   39 female  25    130
> ## 854 854 female  25    130
> ## 30   30 female  26    135
> ## 223 223 female  28    135
> ## 351 351 female  36    137
> # Sort the pirates dataframe by height in decreasing order
> pirates <- pirates[order(pirates$height, decreasing = TRUE),]
> 
> # Look at the first few rows and columns of the result
> pirates[1:5, 1:4]
     id  sex age height
2     2 male  31 209.25
793 793 male  25 209.06
430 430 male  26 201.31
292 292 male  29 200.62
895 895 male  27 200.59
> ##      id  sex age height
> ## 2     2 male  31    209
> ## 793 793 male  25    209
> ## 430 430 male  26    201
> ## 292 292 male  29    201
> ## 895 895 male  27    201
> pirates <- pirates[order(pirates$sex, pirates$height),]
> pirates <- pirates[order(pirates$height, decreasing = TRUE),]
> risk.survey <- data.frame(
+   "participant" = c(1, 2, 3, 4, 5),
+   "risk.score" = c(3, 4, 5, 3, 1))
> happiness.survey <- data.frame(
+   "participant" = c(4, 2, 5, 1, 3),
+   "happiness.score" = c(20, 40, 50, 90, 53))
> combined.survey <- merge(x = risk.survey,
+                          y = happiness.survey,
+                          by = "participant",
+                          all = TRUE)
> combined.survey
  participant risk.score happiness.score
1           1          3              90
2           2          4              40
3           3          5              53
4           4          3              20
5           5          1              50
> ##   participant risk.score happiness.score
> ## 1           1          3              90
> ## 2           2          4              40
> ## 3           3          5              53
> ## 4           4          3              20
> ## 5           5          1              50
> aggregate(formula = dv ~ iv, # dv is the data, iv is the group 
+           FUN = fun, # The function you want to apply
+           data = df) # The dataframe object containing dv and iv
Error in model.frame.default(formula = dv ~ iv, data = df) : 
  'data' must be a data.frame, environment, or list
> # The WRONG way to do grouped aggregation. 
> #  We should be using aggregate() instead!
> mean(ChickWeight$weight[ChickWeight$Diet == 1])
[1] 102.6455
> ## [1] 103
> mean(ChickWeight$weight[ChickWeight$Diet == 2])
[1] 122.6167
> ## [1] 123
> mean(ChickWeight$weight[ChickWeight$Diet == 3])
[1] 142.95
> ## [1] 143
> mean(ChickWeight$weight[ChickWeight$Diet == 4])
[1] 135.2627
> ## [1] 135
> aggregate(formula = weight ~ Diet,  # DV is weight, IV is Diet
+           FUN = mean,               # Calculate the mean of each group
+           data = ChickWeight) 
  Diet   weight
1    1 102.6455
2    2 122.6167
3    3 142.9500
4    4 135.2627
> aggregate(formula = weight ~ Diet,  # DV is weight, IV is Diet
+           FUN = mean,               # Calculate the mean of each group
+           data = ChickWeight)       # dataframe is ChickWeight
  Diet   weight
1    1 102.6455
2    2 122.6167
3    3 142.9500
4    4 135.2627
> ##   Diet weight
> ## 1    1    103
> ## 2    2    123
> ## 3    3    143
> ## 4    4    135
> aggregate(formula = weight ~ Diet,  # DV is weight, IV is Diet
+           FUN = mean,               # Calculate the mean of each group
+           subset = Time < 10,       # Only when Chicks are less than 10 weeks old
+           data = ChickWeight)       # dataframe is ChickWeight
  Diet   weight
1    1 58.03093
2    2 63.40000
3    3 65.94000
4    4 69.36000
> ##   Diet weight
> aggregate(formula = weight ~ Diet + Time,  # DV is weight, IVs are Diet and Time
+           FUN = mean,                      # Calculate the mean of each group
+           subset = Time %in% c(0, 2, 4),   # Only when Chicks are 0, 2, and 4 weeks old
+           data = ChickWeight)
   Diet Time   weight
1     1    0 41.40000
2     2    0 40.70000
3     3    0 40.80000
4     4    0 41.00000
5     1    2 47.25000
6     2    2 49.40000
7     3    2 50.40000
8     4    2 51.80000
9     1    4 56.47368
10    2    4 59.80000
11    3    4 62.20000
12    4    4 64.50000
> install.packages("dplyr")     # Install dplyr (only necessary once)
--- Please select a CRAN mirror for use in this session ---
also installing the dependencies ‘fansi’, ‘pkgconfig’, ‘purrr’, ‘cli’, ‘crayon’, ‘utf8’, ‘ellipsis’, ‘generics’, ‘lifecycle’, ‘R6’, ‘rlang’, ‘tibble’, ‘tidyselect’, ‘vctrs’, ‘pillar’

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/fansi_0.5.0.tgz'
Content type 'application/x-gzip' length 237583 bytes (232 KB)
==================================================
downloaded 232 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/pkgconfig_2.0.3.tgz'
Content type 'application/x-gzip' length 17777 bytes (17 KB)
==================================================
downloaded 17 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/purrr_0.3.4.tgz'
Content type 'application/x-gzip' length 417295 bytes (407 KB)
==================================================
downloaded 407 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/cli_3.0.1.tgz'
Content type 'application/x-gzip' length 715922 bytes (699 KB)
==================================================
downloaded 699 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/crayon_1.4.1.tgz'
Content type 'application/x-gzip' length 139748 bytes (136 KB)
==================================================
downloaded 136 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/utf8_1.2.2.tgz'
Content type 'application/x-gzip' length 196736 bytes (192 KB)
==================================================
downloaded 192 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/ellipsis_0.3.2.tgz'
Content type 'application/x-gzip' length 36499 bytes (35 KB)
==================================================
downloaded 35 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/generics_0.1.0.tgz'
Content type 'application/x-gzip' length 68647 bytes (67 KB)
==================================================
downloaded 67 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/lifecycle_1.0.1.tgz'
Content type 'application/x-gzip' length 105712 bytes (103 KB)
==================================================
downloaded 103 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/R6_2.5.1.tgz'
Content type 'application/x-gzip' length 82529 bytes (80 KB)
==================================================
downloaded 80 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/rlang_0.4.11.tgz'
Content type 'application/x-gzip' length 1313203 bytes (1.3 MB)
==================================================
downloaded 1.3 MB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/tibble_3.1.5.tgz'
Content type 'application/x-gzip' length 845762 bytes (825 KB)
==================================================
downloaded 825 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/tidyselect_1.1.1.tgz'
Content type 'application/x-gzip' length 198270 bytes (193 KB)
==================================================
downloaded 193 KB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/vctrs_0.3.8.tgz'
Content type 'application/x-gzip' length 1413008 bytes (1.3 MB)
==================================================
downloaded 1.3 MB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/pillar_1.6.3.tgz'
Content type 'application/x-gzip' length 1057570 bytes (1.0 MB)
==================================================
downloaded 1.0 MB

trying URL 'https://mirror.las.iastate.edu/CRAN/bin/macosx/contrib/4.1/dplyr_1.0.7.tgz'
Content type 'application/x-gzip' length 1263555 bytes (1.2 MB)
==================================================
downloaded 1.2 MB


The downloaded binary packages are in
	/var/folders/ns/4vw4qg350f76xc84clgnpqhh0000gn/T//RtmpEWDDAx/downloaded_packages
> library("dplyr")              # Load dplyr

Attaching package: ‘dplyr’

The following objects are masked from ‘package:stats’:

    filter, lag

The following objects are masked from ‘package:base’:

    intersect, setdiff, setequal, union

> pirates.agg <- pirates %>%                   # Start with the pirates dataframe
+                filter(headband == "yes") %>% # Only pirates that wear hb
+                group_by(sex, college) %>%    # Group by these variables
+                summarise( 
+                         age.mean = mean(age),      # Define first summary...
+                         tat.med = median(tattoos), # you get the idea...
+                         n = n()                    # How many are in each group?
+                ) # End
`summarise()` has grouped output by 'sex'. You can override using the `.groups` argument.
> pirates.agg
# A tibble: 6 × 5
# Groups:   sex [3]
  sex    college age.mean tat.med     n
  <chr>  <chr>      <dbl>   <dbl> <int>
1 female CCCC        26.0      10   206
2 female JSSFP       33.8      10   203
3 male   CCCC        23.4      10   358
4 male   JSSFP       31.9      10    85
5 other  CCCC        24.8      10    24
6 other  JSSFP       32        12    11
> movies %>% # From the movies dataframe...
+     filter(genre != "Horror" & time > 50) %>% # Select only these rows
+     group_by(rating, sequel) %>% # Group by rating and sequel
+     summarise( #
+       frequency = n(), # How many movies in each group?
+       budget.mean = mean(budget, na.rm = T),  # Mean budget?
+       revenue.mean = mean(revenue.all), # Mean revenue?
+       billion.p = mean(revenue.all > 1000)) # Percent of movies with revenue > 1000?
`summarise()` has grouped output by 'rating'. You can override using the `.groups` argument.
# A tibble: 14 × 6
# Groups:   rating [7]
   rating    sequel frequency budget.mean revenue.mean billion.p
   <chr>      <int>     <int>       <dbl>        <dbl>     <dbl>
 1 G              0        59      41.2          234.    0      
 2 G              1        12      92.9          357.    0.0833 
 3 NC-17          0         2       3.75          18.5   0      
 4 Not Rated      0        84       1.74          55.5   0      
 5 Not Rated      1        12       0.667         66.1   0      
 6 PG             0       312      51.8          191.    0.00962
 7 PG             1        62      77.2          372.    0.0161 
 8 PG-13          0       645      52.1          168.    0.00620
 9 PG-13          1       120     124.           524.    0.117  
10 R              0       623      31.4          109.    0      
11 R              1        42      58.2          226.    0      
12 <NA>           0        86       1.65          33.7   0      
13 <NA>           1        15       5.51          48.1   0      
14 <NA>          NA        11       0             34.1   0      
> vignette("introduction", package = "dplyr")
Warning message:
vignette ‘introduction’ not found 
> # Some exam scores
> exam <- data.frame("q1" = c(1, 0, 0, 0, 0),
+                    "q2" = c(1, 0, 1, 1, 0),
+                    "q3" = c(1, 0, 1, 0, 0),
+                    "q4" = c(1, 1, 1, 1, 1),
+                    "q5" = c(1, 0, 0, 1, 1))
> 
> rowMeans(exam)
[1] 1.0 0.2 0.6 0.6 0.4
> ## [1] 1.0 0.2 0.6 0.6 0.4
> colMeans(exam)''
Error: unexpected string constant in "colMeans(exam)''"
> colMeans(exam)
 q1  q2  q3  q4  q5 
0.2 0.6 0.4 1.0 0.6 
> with(movies, tapply(X = time,        # DV is time
+                     INDEX = genre,   # IV is genre
+                     FUN = mean,      # function is mean
+                     na.rm = TRUE)) 
             Action           Adventure        Black Comedy 
          112.82114           105.76825           113.41176 
             Comedy Concert/Performance         Documentary 
           99.02907            78.40000            69.17391 
              Drama              Horror     Multiple Genres 
          115.97813            99.10280           114.00000 
            Musical             Reality     Romantic Comedy 
          112.96667            43.50000           107.04478 
  Thriller/Suspense             Western 
          112.14113           120.86667 
> read.table(caffeinestudy.webarchive.txt)
Error in read.table(caffeinestudy.webarchive.txt) : 
  object 'caffeinestudy.webarchive.txt' not found
> "drink"	"cups"	"gender"	"age"	"score"
Error: unexpected string constant in ""drink" "cups""
> "1"	"greentea"	1	"male"	24	25.17
Error: unexpected string constant in ""1"     "greentea""
> "2"	"coffee"	1	"female"	20	18.27
Error: unexpected string constant in ""2"     "coffee""
> "3"	"greentea"	1	"male"	26	19.91
Error: unexpected string constant in ""3"     "greentea""
> "4"	"coffee"	1	"female"	31	9.88
Error: unexpected string constant in ""4"     "coffee""
> "5"	"greentea"	1	"male"	18	21.25
Error: unexpected string constant in ""5"     "greentea""
> "6"	"coffee"	1	"female"	28	8.31
Error: unexpected string constant in ""6"     "coffee""
> "7"	"greentea"	1	"male"	21	19.43
Error: unexpected string constant in ""7"     "greentea""
> "8"	"coffee"	1	"male"	30	9.51
Error: unexpected string constant in ""8"     "coffee""
> "9"	"greentea"	1	"male"	29	21.32
Error: unexpected string constant in ""9"     "greentea""
> "10"	"coffee"	1	"female"	22	10.69
Error: unexpected string constant in ""10"    "coffee""
> "11"	"greentea"	1	"male"	24	18.79
Error: unexpected string constant in ""11"    "greentea""
> "12"	"coffee"	1	"male"	25	10.3
Error: unexpected string constant in ""12"    "coffee""
> "13"	"greentea"	1	"male"	24	19.11
Error: unexpected string constant in ""13"    "greentea""
> "14"	"coffee"	1	"male"	33	13.97
Error: unexpected string constant in ""14"    "coffee""
> "15"	"greentea"	1	"female"	25	20.03
Error: unexpected string constant in ""15"    "greentea""
> "16"	"coffee"	1	"female"	23	6.85
Error: unexpected string constant in ""16"    "coffee""
> "17"	"greentea"	1	"female"	27	18.74
Error: unexpected string constant in ""17"    "greentea""
> "18"	"coffee"	1	"female"	26	6.55
Error: unexpected string constant in ""18"    "coffee""
> "19"	"greentea"	1	"male"	25	21.01
Error: unexpected string constant in ""19"    "greentea""
> "20"	"coffee"	1	"female"	25	14.23
Error: unexpected string constant in ""20"    "coffee""
> "21"	"greentea"	1	"male"	26	23.16
Error: unexpected string constant in ""21"    "greentea""
> "22"	"coffee"	1	"male"	22	11.01
Error: unexpected string constant in ""22"    "coffee""
> "23"	"greentea"	1	"female"	22	19.54
Error: unexpected string constant in ""23"    "greentea""
> "24"	"coffee"	1	"female"	30	11.45
Error: unexpected string constant in ""24"    "coffee""
> "25"	"greentea"	1	"female"	19	19.73
Error: unexpected string constant in ""25"    "greentea""
> "26"	"coffee"	1	"male"	25	-0.21
Error: unexpected string constant in ""26"    "coffee""
> "27"	"greentea"	1	"female"	22	21.79
Error: unexpected string constant in ""27"    "greentea""
> "28"	"coffee"	1	"male"	26	8.14
Error: unexpected string constant in ""28"    "coffee""
> "29"	"greentea"	1	"female"	28	26.34
Error: unexpected string constant in ""29"    "greentea""
> "30"	"coffee"	1	"female"	19	20.84
Error: unexpected string constant in ""30"    "coffee""
> "31"	"greentea"	1	"male"	28	13.8
Error: unexpected string constant in ""31"    "greentea""
> "32"	"coffee"	1	"male"	25	12.95
Error: unexpected string constant in ""32"    "coffee""
> "33"	"greentea"	1	"female"	21	20.62
Error: unexpected string constant in ""33"    "greentea""
> "34"	"coffee"	1	"female"	19	7.38
Error: unexpected string constant in ""34"    "coffee""
> "35"	"greentea"	1	"male"	27	23.1
Error: unexpected string constant in ""35"    "greentea""
> "36"	"coffee"	1	"female"	25	13.54
Error: unexpected string constant in ""36"    "coffee""
> "37"	"greentea"	1	"female"	26	19.53
Error: unexpected string constant in ""37"    "greentea""
> "38"	"coffee"	1	"female"	27	8.52
Error: unexpected string constant in ""38"    "coffee""
> "39"	"greentea"	1	"female"	30	14.57
Error: unexpected string constant in ""39"    "greentea""
> "40"	"coffee"	1	"female"	25	6.88
Error: unexpected string constant in ""40"    "coffee""
> "41"	"greentea"	1	"male"	23	18.83
Error: unexpected string constant in ""41"    "greentea""
> "42"	"coffee"	1	"female"	29	8.75
Error: unexpected string constant in ""42"    "coffee""
> "43"	"greentea"	1	"female"	22	24.77
Error: unexpected string constant in ""43"    "greentea""
> "44"	"coffee"	1	"female"	22	8.67
Error: unexpected string constant in ""44"    "coffee""
> "45"	"greentea"	1	"female"	23	29.48
Error: unexpected string constant in ""45"    "greentea""
> "46"	"coffee"	1	"female"	32	7.85
Error: unexpected string constant in ""46"    "coffee""
> "47"	"greentea"	1	"female"	23	27.88
Error: unexpected string constant in ""47"    "greentea""
> "48"	"coffee"	1	"male"	26	10.81
Error: unexpected string constant in ""48"    "coffee""
> "49"	"greentea"	1	"male"	21	14.57
Error: unexpected string constant in ""49"    "greentea""
> "50"	"coffee"	1	"male"	21	12.88
Error: unexpected string constant in ""50"    "coffee""
> "51"	"greentea"	5	"male"	24	40.14
Error: unexpected string constant in ""51"    "greentea""
> "52"	"coffee"	5	"female"	29	58.22
Error: unexpected string constant in ""52"    "coffee""
> "53"	"greentea"	5	"male"	24	44.26
Error: unexpected string constant in ""53"    "greentea""
> "54"	"coffee"	5	"male"	28	62.57
Error: unexpected string constant in ""54"    "coffee""
> "55"	"greentea"	5	"female"	21	45.09
Error: unexpected string constant in ""55"    "greentea""
> "56"	"coffee"	5	"male"	24	54.89
Error: unexpected string constant in ""56"    "coffee""
> "57"	"greentea"	5	"male"	23	37.19
Error: unexpected string constant in ""57"    "greentea""
> "58"	"coffee"	5	"male"	24	54.94
Error: unexpected string constant in ""58"    "coffee""
> "59"	"greentea"	5	"male"	29	24.9
Error: unexpected string constant in ""59"    "greentea""
> "60"	"coffee"	5	"male"	25	61.66
Error: unexpected string constant in ""60"    "coffee""
> "61"	"greentea"	5	"male"	26	46.2
Error: unexpected string constant in ""61"    "greentea""
> "62"	"coffee"	5	"female"	26	63.36
Error: unexpected string constant in ""62"    "coffee""
> "63"	"greentea"	5	"male"	23	33.35
Error: unexpected string constant in ""63"    "greentea""
> "64"	"coffee"	5	"male"	21	55.75
Error: unexpected string constant in ""64"    "coffee""
> "65"	"greentea"	5	"female"	24	31.06
Error: unexpected string constant in ""65"    "greentea""
> "66"	"coffee"	5	"male"	25	66.16
Error: unexpected string constant in ""66"    "coffee""
> "67"	"greentea"	5	"female"	28	38.33
Error: unexpected string constant in ""67"    "greentea""
> "68"	"coffee"	5	"male"	24	55.16
Error: unexpected string constant in ""68"    "coffee""
> "69"	"greentea"	5	"male"	24	44.4
Error: unexpected string constant in ""69"    "greentea""
> "70"	"coffee"	5	"female"	30	58.73
Error: unexpected string constant in ""70"    "coffee""
> "71"	"greentea"	5	"female"	23	32.41
Error: unexpected string constant in ""71"    "greentea""
> "72"	"coffee"	5	"female"	26	59.88
Error: unexpected string constant in ""72"    "coffee""
> "73"	"greentea"	5	"female"	23	40.13
Error: unexpected string constant in ""73"    "greentea""
> "74"	"coffee"	5	"male"	26	60.82
Error: unexpected string constant in ""74"    "coffee""
> "75"	"greentea"	5	"female"	20	42.05
Error: unexpected string constant in ""75"    "greentea""
> "76"	"coffee"	5	"male"	23	56.86
Error: unexpected string constant in ""76"    "coffee""
> "77"	"greentea"	5	"male"	24	43.18
Error: unexpected string constant in ""77"    "greentea""
> "78"	"coffee"	5	"female"	28	53.99
Error: unexpected string constant in ""78"    "coffee""
> "79"	"greentea"	5	"male"	24	46.73
Error: unexpected string constant in ""79"    "greentea""
> "80"	"coffee"	5	"female"	26	57.01
Error: unexpected string constant in ""80"    "coffee""
> "81"	"greentea"	5	"male"	24	42.21
Error: unexpected string constant in ""81"    "greentea""
> "82"	"coffee"	5	"female"	22	63.07
Error: unexpected string constant in ""82"    "coffee""
> "83"	"greentea"	5	"male"	27	38.5
Error: unexpected string constant in ""83"    "greentea""
> "84"	"coffee"	5	"male"	24	52
Error: unexpected string constant in ""84"    "coffee""
> "85"	"greentea"	5	"male"	29	38.3
Error: unexpected string constant in ""85"    "greentea""
> "86"	"coffee"	5	"male"	26	57.09
Error: unexpected string constant in ""86"    "coffee""
> "87"	"greentea"	5	"male"	25	38.05
Error: unexpected string constant in ""87"    "greentea""
> "88"	"coffee"	5	"female"	26	64.23
Error: unexpected string constant in ""88"    "coffee""
> "89"	"greentea"	5	"female"	25	43.42
Error: unexpected string constant in ""89"    "greentea""
> "90"	"coffee"	5	"male"	26	61.19
Error: unexpected string constant in ""90"    "coffee""
> "91"	"greentea"	5	"female"	24	36.45
Error: unexpected string constant in ""91"    "greentea""
> "92"	"coffee"	5	"female"	19	73.07
Error: unexpected string constant in ""92"    "coffee""
> "93"	"greentea"	5	"male"	25	31.87
Error: unexpected string constant in ""93"    "greentea""
> "94"	"coffee"	5	"female"	27	51.96
Error: unexpected string constant in ""94"    "coffee""
> "95"	"greentea"	5	"female"	22	41.7
Error: unexpected string constant in ""95"    "greentea""
> "96"	"coffee"	5	"female"	22	73.64
Error: unexpected string constant in ""96"    "coffee""
> "97"	"greentea"	5	"female"	24	38.36
Error: unexpected string constant in ""97"    "greentea""
> "98"	"coffee"	5	"female"	23	53.72
Error: unexpected string constant in ""98"    "coffee""
> "99"	"greentea"	5	"male"	26	37.84
Error: unexpected string constant in ""99"    "greentea""
> "100"	"coffee"	5	"male"	25	72.74
Error: unexpected string constant in ""100"   "coffee""
> df<-read.table(https://raw.githubusercontent.com/ndphillips/ThePiratesGuideToR/master/data/caffeinestudy.txt)
Error: unexpected '/' in "df<-read.table(https:/"
> 
> 
> 
> df<-read.table(caffeinestudy.txt)
Error in read.table(caffeinestudy.txt) : 
  object 'caffeinestudy.txt' not found
> file= "caffeinestudy.txt"
> df<-read.table(caffeinestudy.txt)
Error in read.table(caffeinestudy.txt) : 
  object 'caffeinestudy.txt' not found
> mydata <- read.table(file = "caffeinestudy.txt",    # file is in a data folder in my working directory
+                      sep = '\t',                  # file is tab--delimited
+                      header = TRUE,               # the first row of the data is a header row
+                      stringsAsFactors = FALSE)
Error in file(file, "rt") : cannot open the connection
In addition: Warning message:
In file(file, "rt") :
  cannot open file 'caffeinestudy.txt': No such file or directory
> 
> {r echo = FALSE, eval = FALSE}

set.seed(100)

drink <- rep(c("greentea", "coffee"), times = 50)

cups <- rep(c(1, 5), each = 50)

gender <- sample(rep(c("male", "female"), times = 50), size = 100)



df <- data.frame(drink, cups, gender)



df$response.m[df$drink == "greentea" & df$cups == 1] <- 20

df$response.m[df$drink == "greentea" & df$cups == 5] <- 40

df$response.m[df$drink == "coffee" & df$cups == 1] <- 10

df$response.m[df$drink == "coffee" & df$cups == 5] <- 60



df$age <- round(rnorm(nrow(df), mean = 25, sd = 3), 0)

for(i in 1:nrow(df)) {df$score[i] <- round(rnorm(1, mean = df$response.m[i], sd = 5), 2)}



df <- df[c("drink", "cups", "gender", "age", "score")]



write.table(df, file = "data/caffeinestudy.txt", sep = "\t")

``

> 
> 
> 