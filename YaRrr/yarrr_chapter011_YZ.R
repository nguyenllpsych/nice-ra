#Chapter 11
library("yarrr")
plot(x = 1:10,
     y = 1:10,
     xlab = "X Axis label",
     ylab = "Y Axis label",
     main = "Main Title")

colors() #color reference in R

#gray() # level = 1 = totally white; level=0 = totally black; alpha =0 totally tranparent, 1...



plot(x = pirates$height, 
     y = pirates$weight, 
     col = "blue", 
     pch = 16, 
     main = "col ='blue'")

#using yarrr's transparent thingy
# Plot with transparent colors using the transparent() function in the yarrr package
plot(x = pirates$height, 
     y = pirates$weight, 
     col = yarrr::transparent("blue", trans.val = .9), 
     pch = 16, 
     main = "col = yarrr::transparent('blue', .9)")
#------------------------------------------------------
#x, y	Vectors of equal length specifying the x and y values of the points
#type	Type of plot. "l" means lines, "p" means points, "b" means lines and points, "n" means no plotting
#main, xlab, ylab	Strings giving labels for the plot title, and x and y axes
#xlim, ylim	Limits to the axes. For example, xlim = c(0, 100) will set the minimum and maximum of the x-axis to 0 and 100.
#pch	An integer indicating the type of plotting symbols (see ?points and section below), or a string specifying symbols as text. For example, pch = 21 will create a two-color circle, while pch = "P" will plot the character "P". To see all the different symbol types, run ?points.
#col	Main color of the plotting symbols. For example col = "red" will create red symbols.
#cex	A numeric vector specifying the size of the symbols (from 0 to Inf). The default size is 1. cex = 4 will make the points very large, while cex = .5 will make them very small.

plot(x = 1:10,                         # x-coordinates
     y = 1:10,                         # y-coordinates
     type = "p",                       # Just draw points (no lines)
     main = "My First Plot",
     xlab = "This is the x-axis label",
     ylab = "This is the y-axis label",
     xlim = c(0, 11),                  # Min and max values for x-axis
     ylim = c(0, 11),                  # Min and max values for y-axis
     col = "blue",                     # Color of the points
     pch = 16,                         # Type of symbol (16 means Filled circle)
     cex = 1)                           # Size of the symbols
#------------------------------------------------------
#histogram hist()
#x	Vector of values
#breaks	How should the bin sizes be calculated? Can be specified in many ways (see ?hist for details)
#freq	Should frequencies or probabilities be plotted? freq = TRUE shows frequencies, freq = FALSE shows probabilities.
#col, border	Colors of the bin filling (col) and border (border)

hist(x = ChickWeight$weight,
     main = "Chicken Weights",
     xlab = "Weight",
     xlim = c(0, 500))
#fancy version
hist(x = ChickWeight$weight,
     main = "Fancy Chicken Weight Histogram",
     xlab = "Weight",
     ylab = "Frequency",
     breaks = 20, # 20 Bins
     xlim = c(0, 500),
     col = "papayawhip", # Filling Color
     border = "hotpink") # Border Color
#two in one
hist(x = ChickWeight$weight[ChickWeight$Diet == 1],
     main = "Two Histograms in one",
     xlab = "Weight",
     ylab = "Frequency",
     breaks = 20,
     xlim = c(0, 500),
     col = gray(0, .5))

hist(x = ChickWeight$weight[ChickWeight$Diet == 2],
     breaks = 30,
     add = TRUE, # Add plot to previous one!
     col = gray(1, .8))

#------------------------------------------------------------------
#barplot() show summary stats for different groups
barplot(height = 1:5,  # A vector of heights
        names.arg = c("G1", "G2", "G3", "G4", "G5"), # A vector of names
        main = "Example Barplot", 
        xlab = "Group", 
        ylab = "Height")
#chink stuff using barplot
# Calculate mean weights for each time period
diet.weights <- aggregate(weight ~ Time, 
                          data = ChickWeight,
                          FUN = mean)

# Create barplot
barplot(height = diet.weights$weight,
        names.arg = diet.weights$Time,
        xlab = "Week",
        ylab = "Average Weight",
        main = "Average Chicken Weights by Time",
        col = "mistyrose")
#clustered barplot
swim.data <- cbind(c(2.1, 3), # Naked Times
                   c(1.5, 3)) # Clothed Times

colnames(swim.data) <- c("Naked", "Clothed")
rownames(swim.data) <- c("No Shark", "Shark")
View(swim.data)

#from that matrix we change it to plot
barplot(height = swim.data,
        beside = TRUE,                        # Put the bars next to each other
        legend.text = TRUE,                   # Add a legend
        col = c(transparent("green", .2), 
                transparent("red", .2)),
        main = "Swimming Speed Experiment",
        ylab = "Speed (in meters / second)",
        xlab = "Clothing Condition",
        ylim = c(0, 4))

#---------------------------------
#some pltting dunction
#points(x, y)	Adds points
#abline(), segments()	Adds lines or segments
#arrows()	Adds arrows
#curve()	Adds a curve representing a function
#rect(),polygon()	Adds a rectangle or arbitrary shape
#text(), mtext()	Adds text within the plot, or to plot margins
#legend()	Adds a legend
#axis()	Adds an axis

#-----Blank plot first
plot(x = 1,                 
     xlab = "X Label", 
     ylab = "Y Label",
     xlim = c(0, 100), 
     ylim = c(0, 100),
     main = "Blank Plotting Canvas",
     type = "n")

#now create a blank plot for chiken stuff
# Create a blank plot
plot(x = 1,
     type = "n",
     xlim = c(100, 225), 
     ylim = c(30, 110),
     pch = 16,
     xlab = "Height", 
     ylab = "Weight",
     main = "Adding points to a plot with points()")

# Add coral2 points for male data
points(x = pirates$height[pirates$sex == "male"],
       y = pirates$weight[pirates$sex == "male"],
       pch = 16,
       col = transparent("coral2", trans.val = .8))

# Add steelblue points for female data
points(x = pirates$height[pirates$sex == "female"],
       y = pirates$weight[pirates$sex == "female"],
       pch = 16,
       col = transparent("steelblue3", trans.val = .8))


#---------------------------------------------------abline(), segments(), grid()
#h, v	Locations of horizontal and vertical lines (for abline() only)
#x0, y0, x1, y1	Starting and ending coordinates of lines (for segments() only)
#lty	Line type. 1 = solid, 2 = dashed, 3 = dotted, .
#lwd	Width of the lines specified by a number. 1 is the default (.2 is very thin, 5 is very thick)
#col	Line color

#To add straight lines to a plot, use abline() or segments(). abline() will add a line across the entire plot, while segments() will add a line with defined starting and end points.
plot(x = pirates$weight,
     y = pirates$height,
     xlab = "weight",
     ylab = "height",
     main = "Adding reference lines with abline", 
     pch = 16, 
     col = gray(.5, .2))
# Add horizontal line at mean height
abline(h = mean(pirates$height), 
       lty = 2)                        # Dashed line (1-6)

# Add vertical line at mean weight
abline(v = mean(pirates$weight),
       lty = 2)                        # Dashed line (1-6)
#-----------------------------------------------adding regression line!!!!!!
# Add a regression line to a scatterplot
plot(x = pirates$height,
     y = pirates$weight,
     pch = 16,
     col = transparent("purple", .7),
     main = "Adding a regression line to a scatterplot()")

# Add the regression line
abline(lm(weight ~ height, data = pirates), 
       lty = 2)


#---------------segment func
# Before and after data
before <- c(2.1, 3.5, 1.8, 4.2, 2.4, 3.9, 2.1, 4.4)
after <- c(7.5, 5.1, 6.9, 3.6, 7.5, 5.2, 6.1, 7.3)

# Create plotting space and before scores
plot(x = rep(1, length(before)), 
     y = before, 
     xlim = c(.5, 2.5), 
     ylim = c(0, 11),
     ylab = "Score", 
     xlab = "Time",
     main = "Using segments() to connect points", 
     xaxt = "n")

# Add after scores
points(x = rep(2, length(after)), y = after)

# Add connections with segments()
segments(x0 = rep(1, length(before)), 
         y0 = before, 
         x1 = rep(2, length(after)), 
         y1 = after, 
         col = gray(0, .5))

# Add labels
mtext(text = c("Before", "After"), 
      side = 1, at = c(1, 2), line = 1)
#--------------------------------grid()
# Add gridlines to a plot with grid()
plot(pirates$age,
     pirates$beard.length,
     pch = 16,
     col = gray(.1, .2), main = "Add grid lines to a plot with grid()")

# Add gridlines
grid()
#-----------------------------text() plot lable
#x, y	Coordinates of the labels
#labels	Labels to be plotted
#cex	Size of the labels
#adj	Horizontal text adjustment. adj = 0 is left justified, adj = .5 is centered, and adj = 1 is right-justified
#pos	Position of the labels relative to the coordinates. pos = 1, puts the label below the coordinates, while 2, 3, and 4 put it to the left, top and right of the coordinates respectively

plot(1, 
     xlim = c(0, 10), 
     ylim = c(0, 10), 
     type = "n")

text(x = c(1, 5, 9),
     y = c(9, 5, 1),
     labels = c("Put", "text", "here"))
# adding text break
plot(1, 
     type = "n",
     main = "The \\n tag",
     xlab = "", ylab = "")

# Text withoutbreaks
text(x = 1, y = 1.3, labels = "Text without \\n", font = 2)
text(x = 1, y = 1.2,
     labels = "Haikus are easy. But sometimes they don't make sense. Refrigerator",
     font = 3) # italic font

abline(h = 1, lty = 2)
# Text with  breaks
text(x = 1, y = .92, labels = "Text with \\n", font = 2)
text(x = 1, y = .7,
     labels = "Haikus are easy\nBut sometimes they don't make sense\nRefrigerator",
     font = 3)   # italic font
#-----------paste func help to combine numbers with text
# Create the plot
plot(x = ChickWeight$Time,
     y = ChickWeight$weight, 
     col = gray(.3, .5), 
     pch = 16,
     main = "Combining text with numeric scalers using paste()")

# Add reference line
abline(h = mean(ChickWeight$weight), 
       lty = 2)

# Add text
text(x = 3, 
     y = mean(ChickWeight$weight), 
     labels = paste("Mean weight =", 
                    round(mean(ChickWeight$weight), 2)),
     pos = 3)
#--------------------------------curve()
#expr	The name of a function written as a function of x that returns a single vector. You can either use base functions in R like expr = $x^2$, expr = x + 4 - 2, or use your own custom functions such as expr = my.fun, where my.fun is previously defined (e.g.; my.fun <- function(x) {dnorm(x, mean = 10, sd = 3))
#from, to	The starting (from) and ending (to) value of x to be plotted.
#add	A logical value indicating whether or not to add the curve to an existing plot. If add = FALSE, then curve() will act like a high-level plotting function and create a new plot. If add = TRUE, then curve() will act like a low-level plotting function.

# Plot the function x^2 from -10 to +10
curve(expr = x^2, 
      from = -10, 
      to = 10, lwd = 2)


#or plot your own func
# Plot the normal distribution with mean = 22 and sd = 3

# Create a function
my.fun <- function(x) {dnorm(x, mean = 2, sd = 3)}

curve(expr = my.fun, 
      from = -10, 
      to = 10, lwd = 2)

#-----------------------------------legend in a graph
# Create plot with data from females
plot(x = pirates$age[pirates$sex == "female"], 
     y = pirates$tattoos[pirates$sex == "female"],
     xlim = c(0, 50),
     ylim = c(0, 20),
     pch = 16, col = yarrr::transparent("red", .7),
     xlab = "Age", ylab = "Tattoos", 
     main = "Adding a legend with legend()")

# Add data from males
points(x = pirates$age[pirates$sex == "male"], 
       y = pirates$tattoos[pirates$sex == "male"],
       pch = 16, col = yarrr::transparent("blue", .7))

# Add legend
legend("bottomright",
       legend = c("Females", "Males"),
       col = transparent(c('red', 'blue'), .5),
       pch = c(16, 16),
       bg = "white")

#------------------hi-tech stuff
plot(1, xlim = c(1, 100), ylim = c(1, 100),
     type = "n", xaxt = "n", yaxt = "n",
     ylab = "", xlab = "", main = "Adding simple figures to a plot")

text(25, 95, labels = "rect()")
rect(xleft = 10, ybottom = 70,
     xright = 40, ytop = 90, lwd = 2, col = "coral")

text(25, 60, labels = "polygon()")
polygon(x = runif(6, 15, 35),
        y = runif(6, 40, 55),
        col = "skyblue")

text(25, 30, labels = "segments()")
segments(x0 = runif(5, 10, 40),
         y0 = runif(5, 5, 25),
         x1 = runif(5, 10, 40),
         y1 = runif(5, 5, 25), 
         lwd = 2)

text(75, 95, labels = "symbols(circles)")
symbols(x = runif(3, 60, 90),
        y = runif(3, 60, 70),
        circles = c(1, .1, .3),
        add = TRUE, bg = gray(.5, .1))

text(75, 30, labels = "arrows()")
arrows(x0 = runif(3, 60, 90),
       y0 = runif(3, 10, 25),
       x1 = runif(3, 60, 90),
       y1 = runif(3, 10, 25),
       length = .1, lwd = 2)
#---------------------saving plots to a file
#file	The directory and name of the final plot entered as a string. For example, to put a plot on my desktop, I'd write file = "/Users/nphillips/Desktop/plot.pdf" when creating a pdf, and file = "/Users/nphillips/Desktop/plot.jpg" when creating a jpeg.
#width, height	The width and height of the final plot in inches.
#dev.off()	This is not an argument to pdf() and jpeg(). You just need to execute this code after creating the plot to finish creating the image file (see examples).
# Step 1: Call the pdf command to start the plot
pdf(file = "/Users/ndphillips/Desktop/My Plot.pdf",   # The directory you want to save the file in
    width = 4, # The width of the plot in inches
    height = 4) # The height of the plot in inches

# Step 2: Create the plot with R code
plot(x = 1:10, 
     y = 1:10)
abline(v = 0) # Additional low-level plotting commands
text(x = 0, y = 1, labels = "Random text")

# Step 3: Run dev.off() to create the file!
dev.off()

#---------------------------------------------------------
#R might!

#1
beard.avg <-aggregate(formula = Beard ~ Ship,  
          FUN = mean,                       
          data = BeardLengths)              

barplot(height = beard.avg$Beard,
        names.arg =  beard.avg$Ship,
        xlab = "Ship",
        ylab = "Beard Length",
        main = "Barplot of mean beard lenght by ship",
        col = "mistyrose")
#2
yarrr::pirateplot(formula = Beard ~ Ship, # dv is weight, iv is Diet
                  data = BeardLengths,
                  main = "Beard Lenght by Ship",
                  xlab = "Ship",
                  ylab = "Beard")




