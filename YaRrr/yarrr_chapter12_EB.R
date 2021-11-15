## Chapter 12 plotting(II)

## 12.1 More colors
# see color palettes
yarrr::piratepal("all")

# see palette in detail
# Show me the basel (the name) palette
yarrr::piratepal("basel",            
                 plot.result = TRUE,
                 trans = .1)          # Slightly transparent
# Show me the pony palette
yarrr::piratepal("pony",            
                 plot.result = TRUE,
                 trans = .1)          # Slightly transparent
# Show me the evildead palette
yarrr::piratepal("evildead",            
                 plot.result = TRUE,
                 trans = .1)          # Slightly transparent

# when you find a palette you like, save colors as vector
# Save the Google palette to a vector
google.cols <- piratepal(palette = "google", 
                         trans = .2)

# Create a barplot with the google colors
barplot(height = 1:5,
        col = google.cols,
        border = "white",
        main = "Barplot with the google palette")

# Even more palettes
install.packages("RColorBrewer")
library("RColorBrewer")
display.brewer.all()

# Create color function from colorRamp2
smoking.colors <- circlize::colorRamp2(breaks = c(0, 15, 25),
                                       colors = c("blue", "green", "red"),
                                       transparency = .2)


plot(1, xlim = c(-.5, 31.5), ylim = c(0, .3),
     type = "n", xlab = "Cigarette Packs",
     yaxt = "n", ylab = "", bty = "n",
     main = "colorRamp2 Example")

segments(x0 = c(0, 15, 30),
         y0 = rep(0, 3),
         x1 = c(0, 15, 30),
         y1 = rep(.1, 3),
         lty = 2)

points(x = 0:30,
       y = rep(.1, 31), pch = 16,
       col = smoking.colors(0:30))

text(x = c(0, 15, 30), y = rep(.2, 3),
     labels = c("Blue", "Green", "Red"))

# Create Data
drinks <- round(rnorm(100, mean = 10, sd = 4), 2)
smokes <- drinks + rnorm(100, mean = 5, sd = 2)
risk <- 1 / (1 + exp(-(drinks + smokes) / 20 + rnorm(100, mean = 0, sd = 1)))

# Create color function from colorRamp2
smoking.colors <- circlize::colorRamp2(breaks = c(0, 15, 30),
                                       colors = c("blue", "green", "red"),
                                       transparency = .3)

# Bottom Plot
par(mar = c(4, 4, 5, 1))
plot(x = drinks, 
     y = risk, 
     col = smoking.colors(smokes),
     pch = 16, cex = 1.2, main = "Plot of (Made-up) Data",
     xlab = "Drinks", ylab = "Risk")

mtext(text = "Point color indicates smoking rate", line = .5, side = 3)

# Store the colors of google as a vector:
google.col <- c(
  rgb(19, 72, 206, maxColorValue = 255),    # Google blue
  rgb(206, 45, 35, maxColorValue = 255),    # Google red
  rgb(253, 172, 10, maxColorValue = 255),   # Google yellow
  rgb(18, 140, 70, maxColorValue = 255))    # Google green

# Print the result
google.col

# Use Google colors in a plot
plot(1, 
     xlim = c(0, 7), 
     ylim = c(0, 1),
     type = "n", 
     main = "Using colors stolen from a webpage")

points(x = 1:6, 
       y = rep(.4, 6),
       pch = 16,
       col = google.col[c(1, 2, 3, 1, 4, 2)],
       cex = 4)

text(x = 1:6, 
     y = rep(.7, 6),
     labels = c("G", "O", "O", "G", "L", "E"), 
     col = google.col[c(1, 2, 3, 1, 4, 2)],
     cex = 3)

## 12.2 Plot margins
#use par(mar) to change margin sizes

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

##12.3 Arranging plots with par(mfrow) and layout()
# Set up 3x3 plotting matrix
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

#layout matrix tells R in which otder to create plots
layout.matrix <- matrix(c(0, 2, 3, 1), nrow = 2, ncol = 2)
layout.matrix

layout(mat = layout.matrix,
       heights = c(1, 2), # Heights of the two rows
       widths = c(2, 2)) # Widths of the two columns

layout.show(3)

# Set plot layout
layout(mat = matrix(c(2, 1, 0, 3), 
                    nrow = 2, 
                    ncol = 2),
       heights = c(1, 2),    # Heights of the two rows
       widths = c(2, 1))     # Widths of the two columns

# Plot 1: Scatterplot
par(mar = c(5, 4, 0, 0))
plot(x = pirates$height, 
     y = pirates$weight,
     xlab = "height", 
     ylab = "weight", 
     pch = 16, 
     col = yarrr::piratepal("pony", trans = .7))

# Plot 2: Top (height) boxplot
par(mar = c(0, 4, 0, 0))
boxplot(pirates$height, xaxt = "n",
        yaxt = "n", bty = "n", yaxt = "n",
        col = "white", frame = FALSE, horizontal = TRUE)

# Plot 3: Right (weight) boxplot
par(mar = c(5, 0, 0, 0))
boxplot(pirates$weight, xaxt = "n",
        yaxt = "n", bty = "n", yaxt = "n",
        col = "white", frame = F)


## 12.4 Additional plotting parameters
par(bg = gray(.9)) # Create a light gray background
hist(x = rnorm(100), col = "skyblue")

# More complex example
parrot.data <- data.frame(
  "ship" = c("Drunken\nMonkeys", "Slippery\nSnails", "Don't Ask\nDon't Tell", "The Beliebers"),
  "Green" = c(200, 150, 100, 175),
  "Blue " = c(150, 125, 180, 242))

# Set background color and plot margins
par(bg = rgb(61, 55, 72, maxColorValue = 255),
    mar = c(6, 6, 4, 3))

plot(1, xlab = "", ylab = "", xaxt = "n",
     yaxt = "n", main = "", bty = "n", type = "n",
     ylim = c(0, 250), xlim = c(.25, 5.25))

# Add gridlines
abline(h = seq(0, 250, 50), 
       lty = 3, 
       col = gray(.95), lwd = 1)

# y-axis labels
mtext(text = seq(50, 250, 50),
      side = 2, at = seq(50, 250, 50),
      las = 1, line = 1, col = gray(.95))

# ship labels
mtext(text = parrot.data$ship,
      side = 1, at = 1:4, las = 1,
      line = 1, col = gray(.95))

# Blue bars
rect(xleft = 1:4 - .35 - .04 / 2,
     ybottom = rep(0, 4),
     xright = 1:4 - .04 / 2,
     ytop = parrot.data$Blue,
     col = "lightskyblue1", border = NA)

# Green bars
rect(xleft = 1:4 + .04 / 2,
     ybottom = rep(0, 4),
     xright = 1:4 + .35 + .04 / 2,
     ytop = parrot.data$Green,
     col = "lightgreen", border = NA)

legend(4.5, 250, c("Blue", "Green"),
       col = c("lightskyblue1", "lightgreen"), pch = rep(15, 2),
       bty = "n", pt.cex = 1.5, text.col = "white")

# Additional margin text
mtext("Number of Green and Blue parrots on 4 ships", 
      side = 3, cex = 1.5, col = "white")
mtext("Parrots", side = 2, col = "white", line = 3.5)
mtext("Drunken survey on 22 May 2015", side = 1,
      at = 0, adj = 0, line = 3, font = 3, col = "white")
