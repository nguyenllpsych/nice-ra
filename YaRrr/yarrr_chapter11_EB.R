## Chapter 11: Plotting (I)

# A basic scatterplot
plot(x = 1:10,
     y = 1:10,
     xlab = "X Axis label",
     ylab = "Y Axis label",
     main = "Main Title")

# 11.1 colors 
# all the colors 
colors()
#interactive demo of colors
demo("colors")
<Return>
gray(level = 1)
# Plot with Standard Colors
plot(x = pirates$height, 
     y = pirates$weight, 
     col = "blue", 
     pch = 16, 
     main = "col ='blue'")
# Plot with transparent colors using the transparent() function in the yarrr package
plot(x = pirates$height, 
     y = pirates$weight, 
     col = yarrr::transparent("blue", trans.val = .9), 
     pch = 16, 
     main = "col = yarrr::transparent('blue', .9)")
library(yarrr)
piratepal()

# 11.3 Scatterplot
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

#11.4 Histogram
hist(x = ChickWeight$weight,
     main = "Chicken Weights",
     xlab = "Weight",
     xlim = c(0, 500))
hist(x = ChickWeight$weight,
     main = "Fancy Chicken Weight Histogram",
     xlab = "Weight",
     ylab = "Frequency",
     breaks = 20, # 20 Bins
     xlim = c(0, 500),
     col = "papayawhip", # Filling Color
     border = "hotpink") # Border Color
# make two histograms on the same plot
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

#11.5 Barplot
barplot(height = 1:5,  # A vector of heights
        names.arg = c("G1", "G2", "G3", "G4", "G5"), # A vector of names
        main = "Example Barplot", 
        xlab = "Group", 
        ylab = "Height")

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

#can represent data in matrix
swim.data <- cbind(c(2.1, 3), # Naked Times
                   c(1.5, 3)) # Clothed Times

colnames(swim.data) <- c("Naked", "Clothed")
rownames(swim.data) <- c("No Shark", "Shark")

# Print result
swim.data

# Now to make into a barplot
barplot(height = swim.data,
        beside = TRUE,                        # Put the bars next to each other
        legend.text = TRUE,                   # Add a legend
        col = c(transparent("green", .2), 
                transparent("red", .2)),
        main = "Swimming Speed Experiment",
        ylab = "Speed (in meters / second)",
        xlab = "Clothing Condition",
        ylim = c(0, 4))

# 11.6 pirateplot()
library(yarrr)
#pirateplot() includes formula (plotting variables y ~ x) and 
#   data (specify name of dataframe object)
yarrr::pirateplot(formula = weight ~ Time, # dv is weight, iv is Diet
                  data = ChickWeight,
                  main = "Pirateplot of chicken weights",
                  xlab = "Diet",
                  ylab = "Weight")
# Using greyscale and a theme of 3
yarrr::pirateplot(formula = height ~ sex + headband,    # DV = height, IV1 = sex, IV2 = headband
                  data = pirates,           
                  theme = 3,
                  main = "Pirate Heights",
                  pal = "gray")
# Can completely customize plot- use theme = 0 
pirateplot(formula = weight ~ Time,
           data = ChickWeight,
           theme = 0,
           main = "Fully customized pirateplot",
           pal = "southpark", # southpark color palette
           bean.f.o = .6, # Bean fill
           point.o = .3, # Points
           inf.f.o = .7, # Inference fill
           inf.b.o = .8, # Inference border
           avg.line.o = 1, # Average line
           bar.f.o = .5, # Bar
           inf.f.col = "white", # Inf fill col
           inf.b.col = "black", # Inf border col
           avg.line.col = "black", # avg line col
           bar.f.col = gray(.8), # bar filling color
           point.pch = 21,
           point.bg = "white",
           point.col = "black",
           point.cex = .7)
# can also start with a theme and make adjustments
pirateplot(formula = weight ~ Time,
           data = ChickWeight,
           main = "Adjusting an existing theme",
           theme = 2,  # Start with theme 2
           inf.f.o = 0, # Turn off inf fill
           inf.b.o = 0, # Turn off inf border
           point.o = .2,   # Turn up points
           bar.f.o = .5, # Turn up bars
           bean.f.o = .4, # Light bean filling
           bean.b.o = .2, # Light bean border
           avg.line.o = 0, # Turn off average line
           point.col = "black") # Black points

# Reducing a pirateplot to a (at least colorful) barplot
pirateplot(formula = weight ~ Diet,
           data = ChickWeight,
           main = "Reducing a pirateplot to a (horrible) barplot",
           theme = 0,                                    # Start from scratch
           pal = "black",
           inf.disp = "line",                            # Use a line for inference
           inf.f.o = 1,                                  # Turn up inference opacity
           inf.f.col = "black",                          # Set inference line color
           bar.f.o = .3)                                

#help with customization
?pirateplot()

# Additional pirateplot customizations
pirateplot(formula = weight ~ Diet, 
           data = ChickWeight,
           main = "Adding quantile lines and background colors",
           theme = 2,
           cap.beans = TRUE,
           back.col = transparent("blue", .95), # Add light blue background
           gl.col = "gray", # Gray gridlines
           gl.lwd = c(.75, 0),
           inf.f.o = .6, # Turn up inf filling
           inf.disp = "bean", # Wrap inference around bean
           bean.b.o = .4, # Turn down bean borders
           quant = c(.1, .9), # 10th and 90th quantiles
           quant.col = "black") # Black quantile lines

# Create a pirateplot
pirateplot(formula = tattoos ~ sex + headband,
           data = pirates)

# Save data from the pirateplot to an object
tattoos.pp <- pirateplot(formula = tattoos ~ sex + headband,
                         data = pirates,
                         plot = FALSE)
# Show me statistics from groups in the pirateplot
tattoos.pp

##11.7 Low-level plotting functions
# Create a blank plotting space
plot(x = 1,                 
     xlab = "X Label", 
     ylab = "Y Label",
     xlim = c(0, 100), 
     ylim = c(0, 100),
     main = "Blank Plotting Canvas",
     type = "n")

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

# Adding lines to a plot
plot(x = pirates$weight,
     y = pirates$height,
     xlab = "weight",
     ylab = "height",
     main = "Adding reference lines with abline", 
     pch = 16, 
     col = gray(.5, .2))

# Add horizontal line at mean height
abline(h = mean(pirates$height), 
       lty = 2)                        # Dashed line

# Add vertical line at mean weight
abline(v = mean(pirates$weight),
       lty = 2)                        # Dashed line

# Add a regression line to a scatterplot
plot(x = pirates$height,
     y = pirates$weight,
     pch = 16,
     col = transparent("purple", .7),
     main = "Adding a regression line to a scatterplot()")

# Add the regression line
abline(lm(weight ~ height, data = pirates), 
       lty = 2)


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

# Add gridlines to a plot with grid()
plot(pirates$age,
     pirates$beard.length,
     pch = 16,
     col = gray(.1, .2), main = "Add grid lines to a plot with grid()")

# Add gridlines
grid()

# Adding text to a plot
plot(1, 
     xlim = c(0, 10), 
     ylim = c(0, 10), 
     type = "n")

text(x = c(1, 5, 9),
     y = c(9, 5, 1),
     labels = c("Put", "text", "here"))

# Create data vectors
height <- c(156, 175, 160, 172, 159, 165, 178)
weight <- c(65, 74, 69, 72, 66, 75, 75)
id <- c("andrew", "heidi", "becki", "madisen", "david", "vincent", "jack")

# Plot data
plot(x = height, 
     y = weight, 
     xlim = c(155, 180), 
     ylim = c(65, 80), 
     pch = 16,
     col = yarrr::piratepal("xmen"))

# Add id labels
text(x = height, 
     y = weight,
     labels = id, 
     pos = 3)            # Put labels above the points

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

# Combinging text and numbers with paste()
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

# Using curve
# Plot the function x^2 from -10 to +10
curve(expr = x^2, 
      from = -10, 
      to = 10, lwd = 2)
#Add custom function
# Plot the normal distribution with mean = 22 and sd = 3

# Create a function
my.fun <- function(x) {dnorm(x, mean = 2, sd = 3)}

curve(expr = my.fun, 
      from = -10, 
      to = 10, lwd = 2)

# Create plotting space
plot(1, 
     xlim = c(-5, 5), ylim = c(-5, 5),
     type = "n", 
     main = "Plotting function lines with curve()",
     ylab = "", xlab = "")

# Add x and y-axis lines
abline(h = 0)
abline(v = 0)

# set up colors
col.vec <- piratepal("google")

# x ^ 2
curve(expr = x^2, from = -5, to = 5,
      add = TRUE, lwd = 3, col = col.vec[1])

# sin(x)
curve(expr = sin, from = -5, to = 5,
      add = TRUE, lwd = 3, col = col.vec[2])

# dnorm(mean = 2, sd = .2)
my.fun <- function(x) {return(dnorm(x, mean = 2, sd = .2))}
curve(expr = my.fun, 
      from = -5, to = 5,
      add = TRUE, 
      lwd = 3, col = col.vec[3])

# Add legend
legend("bottomright",
       legend = c("x^2", "sin(x)", "dnorm(x, 2, .2)"),
       col = col.vec[1:3], 
       lwd = 3)

## Adding legends
# Add a legend to the bottom right of a plot

legend("bottomright",                  # Put legend in bottom right of graph
       legend = c("Females", "Males"), # Names of groups
       col = c("blue", "orange"),      # Colors of symbols
       pch = c(16, 16))                # Symbol types

##Adding a legend with legend()
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

#crazy plots
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

##11.9 Examples
# Turn a boring scatterplot into a  balloonplot! 

# Create some random correlated data
x <- rnorm(50, mean = 50, sd = 10)
y <- x + rnorm(50, mean = 20, sd = 8)

# Set up the plotting space
plot(1, 
     bty = "n",
     xlim = c(0, 100),
     ylim = c(0, 100),
     type = "n", xlab = "", ylab = "", 
     main = "Turning a scatterplot into a balloon plot!")

# Add gridlines
grid()

# Add Strings with segments()
segments(x0 = x + rnorm(length(x), mean = 0, sd = .5), 
         y0 = y - 10, 
         x1 = x, 
         y1 = y, 
         col = gray(.1, .95),
         lwd = .5)

# Add balloons
points(x, y, 
       cex = 2, # Size of the balloons
       pch = 21, 
       col = "white", # white border
       bg = yarrr::piratepal("basel"))  # Filling color

# Using color and sizes to represent variables 
# Just the first 100 pirates
pirates.r <- pirates[1:100,]

plot(x = pirates.r$height,
     y = pirates.r$weight,
     xlab = "height",
     ylab = "weight",
     main = "Specifying point sizes and colors with a 3rd variable",
     cex = pirates.r$tattoos  / 8,          # Point size reflects how many tattoos they have
     col = gray(1 - pirates.r$tattoos / 20)) # color reflects tattoos
grid()


## 11.10 Test your R might!
# 1 calculate average beardlength
BeardLengths
beard.length <- aggregate(Beard ~ Ship, data = BeardLengths, FUN = mean)
barplot(height = beard.length$Beard,
                         names.arg = beard.length$Ship,
                         xlab = "Ship",
                         ylab = "Beard Length",
                         main = "Barplot of mean beard length by ship",
                         col = "purple")

# 2 Make pirateplot()
yarrr::pirateplot(formula = Beard ~ Ship, 
                  data = BeardLengths,
                  main = "Pirateplot of beard lengths",
                  xlab = "Ship",
                  ylab = "Beard")

# 3 Create Scatterplot
pirates

plot(x = beard.length$Ship,        
     y = beard.length$Beard,                
     type = "p",                       
     main = "Pirate age and number of ",
     xlab = "This is the x-axis label",
     ylab = "This is the y-axis label",
     xlim = c(0, 11),                  # Min and max values for x-axis
     ylim = c(0, 11),                  # Min and max values for y-axis
     col = "blue",                     # Color of the points
     pch = 16,                         # Type of symbol (16 means Filled circle)
     cex = 1)                           # Size of the symbols
