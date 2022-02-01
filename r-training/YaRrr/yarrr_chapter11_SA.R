
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

[History restored from /Users/salmaabusamrah/.Rapp.history]

> plot(x = 1:10,
+      y = 1:10,
+      xlab = "X Axis label",
+      ylab = "Y Axis label",
+      main = "Main Title")
> plot(x = pirates$height, 
+      y = pirates$weight, 
+      col = "blue", 
+      pch = 16, 
+      main = "col ='blue'")
Error in plot(x = pirates$height, y = pirates$weight, col = "blue", pch = 16,  : 
  object 'pirates' not found
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
> plot(x = pirates$height, 
+      y = pirates$weight, 
+      col = "blue", 
+      pch = 16, 
+      main = "col ='blue'")
> plot(x = 1:10,                         # x-coordinates
+      y = 1:10,                         # y-coordinates
+      type = "p",                       # Just draw points (no lines)
+      main = "My First Plot",
+      xlab = "This is the x-axis label",
+      ylab = "This is the y-axis label",
+      xlim = c(0, 11),                  # Min and max values for x-axis
+      ylim = c(0, 11),                  # Min and max values for y-axis
+      col = "blue",                     # Color of the points
+      pch = 16,                         # Type of symbol (16 means Filled circle)
+      cex = 1)                           # Size of the symbols
> hist(x = ChickWeight$weight,
+      main = "Chicken Weights",
+      xlab = "Weight",
+      xlim = c(0, 500))
> hist(x = ChickWeight$weight[ChickWeight$Diet == 1],
+      main = "Two Histograms in one",
+      xlab = "Weight",
+      ylab = "Frequency",
+      breaks = 20,
+      xlim = c(0, 500),
+      col = gray(0, .5))
> 
> hist(x = ChickWeight$weight[ChickWeight$Diet == 2],
+      breaks = 30,
+      add = TRUE, # Add plot to previous one!
+      col = gray(1, .8))
> barplot(height = 1:5,  # A vector of heights
+         names.arg = c("G1", "G2", "G3", "G4", "G5"), # A vector of names
+         main = "Example Barplot", 
+         xlab = "Group", 
+         ylab = "Height")
> diet.weights <- aggregate(weight ~ Time, 
+                       data = ChickWeight,
+                       FUN = mean)
> barplot(height = diet.weights$weight,
+         names.arg = diet.weights$Time,
+         xlab = "Week",
+         ylab = "Average Weight",
+         main = "Average Chicken Weights by Time",
+         col = "mistyrose")
> swim.data <- cbind(c(2.1, 3), # Naked Times
+                    c(1.5, 3)) # Clothed Times
> 
> colnames(swim.data) <- c("Naked", "Clothed")
> rownames(swim.data) <- c("No Shark", "Shark")
> 
> # Print result
> swim.data
         Naked Clothed
No Shark   2.1     1.5
Shark      3.0     3.0
> ##          Naked Clothed
> ## No Shark   2.1     1.5
> ## Shark      3.0     3.0
> barplot(height = swim.data,
+         beside = TRUE,                        # Put the bars next to each other
+         legend.text = TRUE,                   # Add a legend
+         col = c(transparent("green", .2), 
+                 transparent("red", .2)),
+         main = "Swimming Speed Experiment",
+         ylab = "Speed (in meters / second)",
+         xlab = "Clothing Condition",
+         ylim = c(0, 4))
> yarrr::pirateplot(formula = height ~ sex + headband,    # DV = height, IV1 = sex, IV2 = headband
+                   data = pirates,           
+                   theme = 3,
+                   main = "Pirate Heights",
+                   pal = "gray")
> pirateplot(formula = weight ~ Time,
+            data = ChickWeight,
+            theme = 0,
+            main = "Fully customized pirateplot",
+            pal = "southpark", # southpark color palette
+            bean.f.o = .6, # Bean fill
+            point.o = .3, # Points
+            inf.f.o = .7, # Inference fill
+            inf.b.o = .8, # Inference border
+            avg.line.o = 1, # Average line
+            bar.f.o = .5, # Bar
+            inf.f.col = "white", # Inf fill col
+            inf.b.col = "black", # Inf border col
+            avg.line.col = "black", # avg line col
+            bar.f.col = gray(.8), # bar filling color
+            point.pch = 21,
+            point.bg = "white",
+            point.col = "black",
+            point.cex = .7)
> pirateplot(formula = weight ~ Time,
+            data = ChickWeight,
+            main = "Adjusting an existing theme",
+            theme = 2,  # Start with theme 2
+            inf.f.o = 0, # Turn off inf fill
+            inf.b.o = 0, # Turn off inf border
+            point.o = .2,   # Turn up points
+            bar.f.o = .5, # Turn up bars
+            bean.f.o = .4, # Light bean filling
+            bean.b.o = .2, # Light bean border
+            avg.line.o = 0, # Turn off average line
+            point.col = "black") # Black points
> pirateplot(formula = weight ~ Diet,
+            data = ChickWeight,
+            main = "Reducing a pirateplot to a (horrible) barplot",
+            theme = 0,                                    # Start from scratch
+            pal = "black",
+            inf.disp = "line",                            # Use a line for inference
+            inf.f.o = 1,                                  # Turn up inference opacity
+            inf.f.col = "black",                          # Set inference line color
+            bar.f.o = .3)                                
> pirateplot(formula = weight ~ Diet, 
+            data = ChickWeight,
+            main = "Adding quantile lines and background colors",
+            theme = 2,
+            cap.beans = TRUE,
+            back.col = transparent("blue", .95), # Add light blue background
+            gl.col = "gray", # Gray gridlines
+            gl.lwd = c(.75, 0),
+            inf.f.o = .6, # Turn up inf filling
+            inf.disp = "bean", # Wrap inference around bean
+            bean.b.o = .4, # Turn down bean borders
+            quant = c(.1, .9), # 10th and 90th quantiles
+            quant.col = "black") # Black quantile lines
> pirateplot(formula = tattoos ~ sex + headband,
+            data = pirates)
> plot(x = 1,                 
+      xlab = "X Label", 
+      ylab = "Y Label",
+      xlim = c(0, 100), 
+      ylim = c(0, 100),
+      main = "Blank Plotting Canvas",
+      type = "n")
> plot(x = 1,
+      type = "n",
+      xlim = c(100, 225), 
+      ylim = c(30, 110),
+      pch = 16,
+      xlab = "Height", 
+      ylab = "Weight",
+      main = "Adding points to a plot with points()")
> 
> points(x = pirates$height[pirates$sex == "male"],
+        y = pirates$weight[pirates$sex == "male"],
+        pch = 16,
+        col = transparent("coral2", trans.val = .8))
Error in plot.xy(xy.coords(x, y), type = type, ...) : 
  plot.new has not been called yet
> 
> plot(x = 1,
+      type = "n",
+      xlim = c(100, 225), 
+      ylim = c(30, 110),
+      pch = 16,
+      xlab = "Height", 
+      ylab = "Weight",
+      main = "Adding points to a plot with points()")
> 
> points(x = pirates$height[pirates$sex == "male"],
+        y = pirates$weight[pirates$sex == "male"],
+        pch = 16,
+        col = transparent("coral2", trans.val = .8))
Error in plot.xy(xy.coords(x, y), type = type, ...) : 
  plot.new has not been called yet
> points(x = pirates$height[pirates$sex == "female"],
+        y = pirates$weight[pirates$sex == "female"],
+        pch = 16,
+        col = transparent("steelblue3", trans.val = .8))
Error in plot.xy(xy.coords(x, y), type = type, ...) : 
  plot.new has not been called yet
> plot(x = pirates$weight,
+      y = pirates$height,
+      xlab = "weight",
+      ylab = "height",
+      main = "Adding reference lines with abline", 
+      pch = 16, 
+      col = gray(.5, .2))
> 
> # Add horizontal line at mean height
> abline(h = mean(pirates$height), 
+        lty = 2)                        # Dashed line
> 
> # Add vertical line at mean weight
> abline(v = mean(pirates$weight),
+        lty = 2)             
> plot(x = pirates$height,
+      y = pirates$weight,
+      pch = 16,
+      col = transparent("purple", .7),
+      main = "Adding a regression line to a scatterplot()")
> 
> # Add the regression line
> abline(lm(weight ~ height, data = pirates), 
+        lty = 2)
> before <- c(2.1, 3.5, 1.8, 4.2, 2.4, 3.9, 2.1, 4.4)
> after <- c(7.5, 5.1, 6.9, 3.6, 7.5, 5.2, 6.1, 7.3)
> 
> # Create plotting space and before scores
> plot(x = rep(1, length(before)), 
+      y = before, 
+      xlim = c(.5, 2.5), 
+      ylim = c(0, 11),
+      ylab = "Score", 
+      xlab = "Time",
+      main = "Using segments() to connect points", 
+      xaxt = "n")
> 
> # Add after scores
> points(x = rep(2, length(after)), y = after)
> 
> # Add connections with segments()
> segments(x0 = rep(1, length(before)), 
+          y0 = before, 
+          x1 = rep(2, length(after)), 
+          y1 = after, 
+          col = gray(0, .5))
> 
> # Add labels
> mtext(text = c("Before", "After"), 
+       side = 1, at = c(1, 2), line = 1)
> plot(pirates$age,
+      pirates$beard.length,
+      pch = 16,
+      col = gray(.1, .2), main = "Add grid lines to a plot with grid()")
> 
> # Add gridlines
> grid()
> plot(1, 
+      xlim = c(0, 10), 
+      ylim = c(0, 10), 
+      type = "n")
> 
> text(x = c(1, 5, 9),
+      y = c(9, 5, 1),
+      labels = c("Put", "text", "here"))
> # Create data vectors
> height <- c(156, 175, 160, 172, 159, 165, 178)
> weight <- c(65, 74, 69, 72, 66, 75, 75)
> id <- c("andrew", "heidi", "becki", "madisen", "david", "vincent", "jack")
> 
> # Plot data
> plot(x = height, 
+      y = weight, 
+      xlim = c(155, 180), 
+      ylim = c(65, 80), 
+      pch = 16,
+      col = yarrr::piratepal("xmen"))
> 
> # Add id labels
> text(x = height, 
+      y = weight,
+      labels = id, 
+      pos = 3)            # Put 
> plot(1, 
+      type = "n",
+      main = "The \\n tag",
+      xlab = "", ylab = "")
> 
> # Text withoutbreaks
> text(x = 1, y = 1.3, labels = "Text without \\n", font = 2)
> text(x = 1, y = 1.2,
+      labels = "Haikus are easy. But sometimes they don't make sense. Refrigerator",
+      font = 3) # italic font
> 
> abline(h = 1, lty = 2)
> # Text with  breaks
> text(x = 1, y = .92, labels = "Text with \\n", font = 2)
> text(x = 1, y = .7,
+      labels = "Haikus are easy\nBut sometimes they don't make sense\nRefrigerator",
+      font = 3)   # italic font
> plot(x = ChickWeight$Time,
+      y = ChickWeight$weight, 
+      col = gray(.3, .5), 
+      pch = 16,
+      main = "Combining text with numeric scalers using paste()")
> 
> # Add reference line
> abline(h = mean(ChickWeight$weight), 
+        lty = 2)
> 
> # Add text
> text(x = 3, 
+      y = mean(ChickWeight$weight), 
+      labels = paste("Mean weight =", 
+                     round(mean(ChickWeight$weight), 2)),
+      pos = 3)
> curve(expr = x^2, 
+       from = -10, 
+       to = 10, lwd = 2)
> my.fun <- function(x) {dnorm(x, mean = 2, sd = 3)}
> 
> curve(expr = my.fun, 
+       from = -10, 
+       to = 10, lwd = 2)
> plot(1, 
+      xlim = c(-5, 5), ylim = c(-5, 5),
+      type = "n", 
+      main = "Plotting function lines with curve()",
+      ylab = "", xlab = "")
> 
> # Add x and y-axis lines
> abline(h = 0)
> abline(v = 0)
> 
> # set up colors
> col.vec <- piratepal("google")
> 
> # x ^ 2
> curve(expr = x^2, from = -5, to = 5,
+       add = TRUE, lwd = 3, col = col.vec[1])
> 
> # sin(x)
> curve(expr = sin, from = -5, to = 5,
+       add = TRUE, lwd = 3, col = col.vec[2])
> 
> # dnorm(mean = 2, sd = .2)
> my.fun <- function(x) {return(dnorm(x, mean = 2, sd = .2))}
> curve(expr = my.fun, 
+       from = -5, to = 5,
+       add = TRUE, 
+       lwd = 3, col = col.vec[3])
> 
> # Add legend
> legend("bottomright",
+        legend = c("x^2", "sin(x)", "dnorm(x, 2, .2)"),
+        col = col.vec[1:3], 
+        lwd = 3)
> legend("bottomright",                  # Put legend in bottom right of graph
+        legend = c("Females", "Males"), # Names of groups
+        col = c("blue", "orange"),      # Colors of symbols
+        pch = c(16, 16))                # Symbol types
Error in strwidth(legend, units = "user", cex = cex, font = text.font) : 
  plot.new has not been called yet
> plot(1, xlim = c(1, 100), ylim = c(1, 100),
+      type = "n", xaxt = "n", yaxt = "n",
+      ylab = "", xlab = "", main = "Adding simple figures to a plot")
> 
> text(25, 95, labels = "rect()")
> rect(xleft = 10, ybottom = 70,
+      xright = 40, ytop = 90, lwd = 2, col = "coral")
> 
> text(25, 60, labels = "polygon()")
> polygon(x = runif(6, 15, 35),
+         y = runif(6, 40, 55),
+         col = "skyblue")
> 
> text(25, 30, labels = "segments()")
> segments(x0 = runif(5, 10, 40),
+          y0 = runif(5, 5, 25),
+          x1 = runif(5, 10, 40),
+          y1 = runif(5, 5, 25), 
+          lwd = 2)
> 
> text(75, 95, labels = "symbols(circles)")
> symbols(x = runif(3, 60, 90),
+         y = runif(3, 60, 70),
+         circles = c(1, .1, .3),
+         add = TRUE, bg = gray(.5, .1))
> 
> text(75, 30, labels = "arrows()")
> arrows(x0 = runif(3, 60, 90),
+        y0 = runif(3, 10, 25),
+        x1 = runif(3, 60, 90),
+        y1 = runif(3, 10, 25),
+        length = .1, lwd = 2)
> pdf(file = "/Users/ndphillips/Desktop/My Plot.pdf",   # The directory you want to save the file in
+     width = 4, # The width of the plot in inches
+     height = 4) # The height of the plot in inches
Error in pdf(file = "/Users/ndphillips/Desktop/My Plot.pdf", width = 4,  : 
  cannot open file '/Users/ndphillips/Desktop/My Plot.pdf'
> plot(x = 1:10, 
+      y = 1:10)
> abline(v = 0) # Additional low-level plotting commands
> text(x = 0, y = 1, labels = "Random text")
> 
> # Step 3: Run dev.off() to create the file!
> dev.off()
null device 
          1 
> x <- rnorm(50, mean = 50, sd = 10)
> y <- x + rnorm(50, mean = 20, sd = 8)
> 
> # Set up the plotting space
> plot(1, 
+      bty = "n",
+      xlim = c(0, 100),
+      ylim = c(0, 100),
+      type = "n", xlab = "", ylab = "", 
+      main = "Turning a scatterplot into a balloon plot!")
> 
> # Add gridlines
> grid()
> 
> # Add Strings with segments()
> segments(x0 = x + rnorm(length(x), mean = 0, sd = .5), 
+          y0 = y - 10, 
+          x1 = x, 
+          y1 = y, 
+          col = gray(.1, .95),
+          lwd = .5)
> 
> # Add balloons
> points(x, y, 
+        cex = 2, # Size of the balloons
+        pch = 21, 
+        col = "white", # white border
+        bg = yarrr::piratepal("basel"))  # Filling color
> pirates.r <- pirates[1:100,]
> 
> plot(x = pirates.r$height,
+      y = pirates.r$weight,
+      xlab = "height",
+      ylab = "weight",
+      main = "Specifying point sizes and colors with a 3rd variable",
+      cex = pirates.r$tattoos  / 8,          # Point size reflects how many tattoos they have
+      col = gray(1 - pirates.r$tattoos / 20)) # color reflects tattoos
> 
> grid()
> avg.lengths <- aggregate(Beard ~ Ship, 
+                          data = BeardLengths, 
+                          FUN = mean)
> barplot(avg.lengths$Beard,
+         names.arg = avg.lengths$Ship,
+         ylab = "Beard Length",
+         xlab = "Ship",
+         main = "Barplot of mean beard length by ship",
+         ylim = c(0, 25)
+         )
> pirateplot(formula = Beard ~ Ship,
+            data = BeardLengths,
+            main = "Pirateplot of beard lengths by ship")
> plot(x = pirates$age,
+      y = pirates$parrots,
+      pch = 16,
+      col = gray(level = .5, alpha = .1),
+      xlab = "Age",
+      ylab = "Parrots",
+      main = "Pirate age and number of parrots owned")
> 