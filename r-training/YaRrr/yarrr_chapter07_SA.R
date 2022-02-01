
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

> 2+2
[1] 4
> # Boat sale. Creating the data vectors
> boat.names <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j")
> boat.colors <- c("black", "green", "pink", "blue", "blue", 
+                 "green", "green", "yellow", "black", "black")
> boat.ages <- c(143, 53, 356, 23, 647, 24, 532, 43, 66, 86)
> boat.prices <- c(53, 87, 54, 66, 264, 32, 532, 58, 99, 132)
> boat.costs <- c(52, 80, 20, 100, 189, 12, 520, 68, 80, 100)
> 
> # What was the price of the first boat?
> boat.prices[1]
[1] 53
> ## [1] 53
> 
> # What were the ages of the first 5 boats?
> boat.ages[1:5]
[1] 143  53 356  23 647
> ## [1] 143  53 356  23 647
> 
> # What were the names of the black boats?
> boat.names[boat.colors == "black"]
[1] "a" "i" "j"
> ## [1] "a" "i" "j"
> 
> # What were the prices of either green or yellow boats?
> boat.prices[boat.colors == "green" | boat.colors == "yellow"]
[1]  87  32 532  58
> ## [1]  87  32 532  58
> 
> # Change the price of boat "s" to 100
> boat.prices[boat.names == "s"] <- 100
> 
> # What was the median price of black boats less than 100 years old?
> median(boat.prices[boat.colors == "black" & boat.ages < 100])
[1] 115.5
> ## [1] 116
> 
> # How many pink boats were there?
> sum(boat.colors == "pink")
[1] 1
> ## [1] 1
> 
> # What percent of boats were older than 100 years old?
> mean(boat.ages < 100)
[1] 0.6
> ## [1] 0.6
> 
> # What is the first boat name?
> boat.names[1]
[1] "a"
> ## [1] "a"
> 
> # What are the first five boat colors?
> boat.colors[1:5]
[1] "black" "green" "pink"  "blue"  "blue" 
> ## [1] "black" "green" "pink"  "blue"  "blue"
> 
> # What is every second boat age?
> boat.ages[seq(1, 5, by = 2)]
[1] 143 356 647
> ## [1] 143 356 647
> 
> # What is the first boat age (3 times)
> boat.ages[c(1, 1, 1)]
[1] 143 143 143
> ## [1] 143 143 143
> 
> my.index <- 3:5
> boat.names[my.index]
[1] "c" "d" "e"
> ## [1] "c" "d" "e"
> 
> a <- c(1, 2, 3, 4, 5)
> a[c(TRUE, FALSE, TRUE, FALSE, TRUE)]
[1] 1 3 5
> ## [1] 1 3 5
> 
> # Which ages are > 100?
> boat.ages > 100
 [1]  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
> ##  [1]  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
> 
> # Which ages are equal to 23?
> boat.ages == 23
 [1] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
> ##  [1] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
> 
> # Which boat names are equal to c?
> boat.names == "c"
 [1] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
> ##  [1] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
> 
> 
> movie <- c("Whatever Works", "It Follows", "Love and Mercy", 
+              "The Goonies", "Jiro Dreams of Sushi",
+              "There Will be Blood", "Moon", 
+              "Spice World", "Serenity", "Finding Vivian Maier")
> 
> year <- c(2009, 2015, 2015, 1985, 2012, 2007, 2009, 1988, 2005, 2014)
> 
> boxoffice <- c(35, 15, 15, 62, 3, 10, 321, 79, 39, 1.5)
> 
> genre <- c("Comedy", "Horror", "Drama", "Adventure", "Documentary", 
+            "Drama", "Science Fiction", "Comedy", "Science Fiction", 
+            "Documentary")
> 
> time <- c(92, 97, 120, 90, 81, 158, 97, -84, 119, 84)
> 
> rating <- c("PG-13", "R", "R", "PG", "G", "R", "R", 
+             "PG-13", "PG-13", "Unrated")
> movie(10)
Error in movie(10) : could not find function "movie"
> movie[movie]
 [1] NA NA NA NA NA NA NA NA NA NA
> movie[10]
[1] "Finding Vivian Maier"
> genre[1:4]
[1] "Comedy"    "Horror"    "Drama"     "Adventure"
> movie[movie=="Spice World"] <- "The Naked Gun"
> 
>   movie[movie == "Spice World"] <- "The Naked Gun"
> movie[movie == "Spice World"] <- "The Naked Gun"
> movie[year < 1990]
[1] "The Goonies"   "The Naked Gun"
> ## [1] "The Goonies"   "The Naked Gun"
> sum(genre == "Drama")
[1] 2
> mean(genre == "Comedy")
[1] 0.2
> time[time < 0] <- NA
> 
> mean(time, na.rm = TRUE)
[1] 104.2222
> movie[genre == "Comedy"]
[1] "Whatever Works" "The Naked Gun" 
> boxoffice[genre == "Comedy"]
[1] 35 79
> movie[boxoffice < 50 & genre == "Comedy"]
[1] "Whatever Works"
> median(boxoffice[rating %in% c("G", "PG")])
[1] 32.5
> median(boxoffice[rating == "G" | rating == "PG"])
[1] 32.5
> mean(rating == "R" | genre == "Comedy")
[1] 0.6
objc[1655]: Class FIFinderSyncExtensionHost is implemented in both /System/Library/PrivateFrameworks/FinderKit.framework/Versions/A/FinderKit (0x7fff93d5e3f0) and /System/Library/PrivateFrameworks/FileProvider.framework/OverrideBundles/FinderSyncCollaborationFileProviderOverride.bundle/Contents/MacOS/FinderSyncCollaborationFileProviderOverride (0x11023bf50). One of the two will be used. Which one is undefined.
> 