#Chapter 12


library("yarrr")

yarrr::piratepal("all") #more color
yarrr::piratepal("basel",
                 plot.result = TRUE,
                 trans = .1)          # Slightly transparent)
# Show me the pony palette
yarrr::piratepal("pony",            
                 plot.result = TRUE,
                 trans = .1)          # Slightly transparent

# Show me the evildead palette
yarrr::piratepal("evildead",            
                 plot.result = TRUE,
                 trans = .1)          # Slightly transparent

#-----------------------USing google plates
google.cols <- piratepal(palette = "google", 
                         trans = .2)

# Create a barplot with the google colors
barplot(height = 1:5,
        col = google.cols,
        border = "white",
        main = "Barplot with the google palette")

#-------------
install.packages("RColorBrewer")
library("RColorBrewer")
display.brewer.all()

#_____________
# Store the colors of google as a vector:
google.col <- c(
  rgb(19, 72, 206, maxColorValue = 255),    # Google blue
  rgb(206, 45, 35, maxColorValue = 255),    # Google red
  rgb(253, 172, 10, maxColorValue = 255),   # Google yellow
  rgb(18, 140, 70, maxColorValue = 255))    # Google green
#-----------------------------Margins
# First Plot with small margins
par(mar = c(2, 2, 2, 2)) # Set the margin on all sides to 2
plot(1:10)
mtext("Small Margins", side = 3, line = 1, cex = 1.2)
mtext("par(mar = c(2, 2, 2, 2))", side = 3)

# Second Plot with large margins
par(mar = c(5, 5, 5, 5)) # Set the margin on all sides to 6
plot(1:10)
mtext("Large Margins", side = 3, line = 1, cex = 1.2)
mtext("par(mar = c(5, 5, 5, 5))", side = 3)


#-------------------------------Arranging plots with par(mfrow) and layout()

par(mfrow = c(2, 2)) # Create a 2 x 2 plotting matrix
# The next 4 plots created will be plotted next to each other

# Plot 1
hist(rnorm(100))

# Plot 2
plot(pirates$weight, 
     pirates$height, pch = 16, col = gray(.3, .1))

# Plot 3
pirateplot(weight ~ Diet, 
           data = ChickWeight, 
           pal = "info", theme = 3)

# Plot 4
boxplot(weight ~ Diet, 
        data = ChickWeight)

# Put plotting arrangement back to its original state
par(mfrow = c(1, 1))

#_________________________
#Complex plot layouts with layout()

#mat	A matrix indicating the location of the next N figures in the global plotting space. Each value in the matrix must be 0 or a positive integer. R will plot the first plot in the entries of the matrix with 1, the second plot in the entries with 2,.
#widths	A vector of values for the widths of the columns of the plotting space.
#heights	A vector of values for the heights of the rows of the plotting space.

#will tell the r the sequence of making plots
layout.matrix <- matrix(c(0, 2, 3, 1), nrow = 2, ncol = 2)
layout.matrix
##      [,1] [,2]
## [1,]    0    3
## [2,]    2    1


#------------------background and hist color
par(bg = gray(.9)) # Create a light gray background
hist(x = rnorm(100), col = "skyblue")
