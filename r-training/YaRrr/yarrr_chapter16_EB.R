# Chapter 16: Custom Functions

library(yarrr)
# Create a function called piratehist
piratehist <- function(x, ...) {
  
  # Create a customized histogram  
  hist(x,
       col = gray(.5, .2),
       border = "white",
       yaxt = "n",
       ylab = "",
       ...)
  
  # Calculate the conf interval
  ci <- t.test(x)$conf.int
  
  # Define and add top-text
  top.text <- paste(
    "Mean = ", round(mean(x), 2),
    " (95% CI [", round(ci[1], 2),
    ", ", round(ci[2], 2), 
    "]), SD = ", round(sd(x), 2), 
    sep = "")
  
  mtext(top.text, side = 3)
}
# Create a pirate histogram!
piratehist(pirates$age,
           xlab = "Age",
           main = "Pirates' Ages")

#16.2 Custom function structure
# the 4 attributes
# 1. Name: What is the name of your function? 
#   You can give it any valid object name. 
#   However, be careful not to use names of
#   existing functions or R might get confused.

# 2. Arguments: What are the inputs to the function? 
#   Does it need a vector of numeric data? Or some text? 
#   You can specify as many inputs as you want.

# 3. Actions: What do you want the function to do with the inputs?
#   Create a plot? Calculate a statistic? Run a regression analysis? 
#   This is where you’ll write all the real R code behind the function.

# 4. Output: What do you want the code to return when it’s finished 
#   with the actions? Should it return a scalar statistic? 
#   A vector of data? A dataframe?


# The basic structure of a function
NAME <- function(ARGUMENTS) {
  
  ACTIONS
  
  return(OUTPUT)}

# Create the function my.mean()
my.mean <- function(x) {   # Single input called x
  
  output <- sum(x) / length(x) # Calculate output
  
  return(output)  # Return output to the user after running the function
  
}

data <- c(3, 1, 6, 4, 2, 8, 4, 2)
my.mean(data)

mean(data)


oh.god.how.much.did.i.spend <- function(grogg,
                                        port,
                                        crabjuice) {
  
  output <- grogg * 1 + port * 3 + crabjuice * 10
  
  return(output)
}

oh.god.how.much.did.i.spend(grogg = 10,
                            port = 3,
                            crabjuice = 0)
oh.god.how.much.did.i.spend(grogg = 0,
                            port = 0,
                            crabjuice = 7)
# Including default values for function arguments
oh.god.how.much.did.i.spend <- function(grogg = 0,
                                        port = 0,
                                        crabjuice = 0) {
  
  output <- grogg * 1 + port * 3 + crabjuice * 10
  
  return(output)
}
oh.god.how.much.did.i.spend(port = 5)

# 16.3 Using if, then statements
is.it.true <- function(x) {
  if(x == TRUE) {print("x was true!")}
  if(x == FALSE) {print("x was false!")}
    }
is.it.true(TRUE)  
is.it.true(FALSE)
is.it.true(10 > 0)
is.it.true(10 < 0)

show.me <- function(x, what) {
  
  if(what == "plot") {
    
    hist(x, yaxt = "n", ylab = "", border = "white", 
         col = "skyblue", xlab = "",
         main = "Ok! I hope you like the plot...")
    
  }
  
  if(what == "stats") {
    
    print(paste("Yarr! The mean of this data be ", 
                round(mean(x), 2),
                " and the standard deviation be ", 
                round(sd(x), 2),
                sep = ""))
    
  }
  
  if(what == "tellmeajoke") {
    
    print("I am a pirate, not your joke monkey.")
    
  }
}
show.me(x = pirates$beard.length, 
        what = "plot")
show.me(x = pirates$beard.length, 
        what = "stats")
show.me(what = "tellmeajoke")


#16.4 plot.advanced()
plot.advanced <- function (x = rnorm(100),
                           y = rnorm(100),
                           add.mean = FALSE,
                           add.regression = FALSE,
                           p.threshold = .05,
                           add.modeltext = FALSE,
                           ...  # Optional further arguments passed on to plot
) {
  
  # Generate the plot with optional arguments
  #   like main, xlab, ylab, etc.
  plot(x, y, ...)
  
  # Add mean reference lines if add.mean is TRUE
  if(add.mean == TRUE) {
    
    abline(h = mean(y), lty = 2)
    abline(v = mean(x), lty = 2)
  }
  
  # Add regression line if add.regression is TRUE
  if(add.regression == TRUE) {
    
    model <- lm(y ~ x)  # Run regression
    
    p.value <- anova(model)$"Pr(>F)"[1] # Get p-value
    
    # Define line color from model p-value and threshold
    if(p.value < p.threshold) {line.col <- "red"}
    if(p.value >= p.threshold) {line.col <- "black"}
    
    abline(lm(y ~ x), col = line.col, lwd = 2) # Add regression line
    
  }
  
  # Add regression equation text if add.modeltext is TRUE
  if(add.modeltext == TRUE) {
    
    # Run regression
    model <- lm(y ~ x)
    
    # Determine coefficients from model object
    coefficients <- model$coefficients
    a <- round(coefficients[1], 2)
    b <- round(coefficients[2], 2)
    
    # Create text
    model.text <- paste("Regression Equation: ", a, " + ",
                        b, " * x", sep = "")
    
    # Add text to top of plot
    mtext(model.text, side = 3, line = .5, cex = .8)
    
  }
}
plot.advanced(x = pirates$age,
              y = pirates$tchests,
              add.regression = TRUE,
              add.modeltext = TRUE,
              p.threshold = .05,
              main = "plot.advanced()",
              xlab = "Age", ylab = "Treasure Chests Found",
              pch = 16,
              col = gray(.2, .3))
# Show me the code in the transparent() function
transparent


do.stats <- function(mat) {
  
  if(is.matrix(mat) == F) {stop("Argument was not a matrix!")}
  
  # Only run if argument is a matrix!
  print(paste("Thanks for giving me a matrix. The matrix has ", nrow(mat), 
              " rows and ", ncol(mat), 
              " columns. If you did not give me a matrix, the function would have stopped by now!", 
              sep = ""))
  
}
do.stats(mat = "This is a string, not a matrix") 
do.stats(mat = matrix(1:10, nrow = 2, ncol = 5))

oh.god.how.much.did.i.spend <- function(drinks.vec) {
  
  grogg <- drinks.vec[1]
  port <- drinks.vec[2]
  crabjuice <- drinks.vec[3]
  
  output <- grogg * 1 + port * 3 + crabjuice * 10
  
  return(output)
  
}
oh.god.how.much.did.i.spend(c(1, 5, 2))


remove.outliers <- function(x, outlier.def = 2) {
  
  # Test values (only used to test the following code)
  #  x <- c(rep(1, 100), 999)
  #  outlier.def <- 2
  
  is.outlier <- x > (mean(x) + outlier.def * sd(x)) | 
    x < (mean(x) - outlier.def * sd(x))
  
  x.nooutliers <- x[is.outlier == FALSE]
  
  return(x.nooutliers)
  
}
hist.advanced <- function(x, add.ci = TRUE, ...) {
  
  hist(x, # Main Data
       ... # Here is where the additional arguments go
  )
  
  if(add.ci == TRUE) {
    
    ci <- t.test(x)$conf.int # Get 95% CI
    segments(ci[1], 0, ci[2], 0, lwd = 5, col = "red")
    
    mtext(paste("95% CI of Mean = [", round(ci[1], 2), ",",
                round(ci[2], 2), "]"), side = 3, line = 0)
  }
}
hist.advanced(x = rnorm(100), add.ci = TRUE,
              main = "Treasure Chests found",
              xlab = "Number of Chests",
              col = "lightblue")
