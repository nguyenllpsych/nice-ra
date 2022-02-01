#CHapter 16 custom functions
library("yarrr")
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

#4 steps: name arguments actions output
# The basic structure of a function
NAME <- function(ARGUMENTS) {
  
  ACTIONS
  
  return(OUTPUT)
  
}

#-----------------
# Create the function my.mean()
my.mean <- function(x) {   # Single input called x
  
  output <- sum(x) / length(x) # Calculate output
  
  return(output)  # Return output to the user after running the function
  
}


#---------------Multiple inpu
oh.god.how.much.did.i.spend <- function(grogg,
                                        port,
                                        crabjuice) {
  
  output <- grogg * 1 + port * 3 + crabjuice * 10
  
  return(output)
}

#-----default value for arguments
# Including default values for function arguments
oh.god.how.much.did.i.spend <- function(grogg = 0,
                                        port = 0,
                                        crabjuice = 0) {
  
  output <- grogg * 1 + port * 3 + crabjuice * 10
  
  return(output)
}

#-------IF THEN function
is.it.true <- function(x) {
  
  if(x == TRUE) {print("x was true!")}
  if(x == FALSE) {print("x was false!")}
  
}






#-------------Advanced function
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
transparent


#----------------------------R might
#1: 
Jacks.Equation <- function(a,
                 b,
                 c) {

  output <- (a * b) - c * 324 + log(a)
  
  return(output)
}
Jacks.Equation(a = 1000, b = 30, c = 7)

#2

standardize.me <- function(c) {
  mean(c)

  output <- (c - mean(c))/sd(c) 
  
  return(output)
}
standardize.me(c(1, 2, 1, 100))
lb =0
up =100


#3
recode.numeric<-function(x,lb,ub){
  if(x<lb){
    x = "NA"
  }
  if(x>ub){
    x = "NA"
  }
  
  return(x)
}
recode.numeric(x = c(5, 3, -5, 4, 3, 97),
               lb = 0,
               ub = 10)
#4
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
plot.advanced(x = diamonds$weight,
              y = diamonds$value,
              add.regression = TRUE,
              add.means = TRUE,
              add.test = TRUE)
