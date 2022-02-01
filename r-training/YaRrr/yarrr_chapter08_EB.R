# Chapter 8: Matrices and Dataframes

# Create a dataframe of boat sale data called bsale
bsale <- data.frame(name = c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j"),
                    color = c("black", "green", "pink", "blue", "blue", 
                              "green", "green", "yellow", "black", "black"),
                    age = c(143, 53, 356, 23, 647, 24, 532, 43, 66, 86),
                    price = c(53, 87, 54, 66, 264, 32, 532, 58, 99, 132),
                    cost = c(52, 80, 20, 100, 189, 12, 520, 68, 80, 100),
                    stringsAsFactors = FALSE)   # Don't convert strings to factors!
# Explore the bsale dataset:
head(bsale)     # Show me the first few rows
str(bsale)      # Show me the structure of the data
View(bsale)     # Open the data in a new window
names(bsale)    # What are the names of the columns?
nrow(bsale)     # How many rows are there in the data?

# Calculating statistics from column vectors
mean(bsale$age)       # What was the mean age?
table(bsale$color)    # How many boats were there of each color?
max(bsale$price)      # What was the maximum price?

# Adding new columns
bsale$id <- 1:nrow(bsale)
bsale$age.decades <- bsale$age / 10
bsale$profit <- bsale$price - bsale$cost

# What was the mean price of green boats?
with(bsale, mean(price[color == "green"]))

# What were the names of boats older than 100 years?
with(bsale, name[age > 100])

# What percent of black boats had a positive profit?
with(subset(bsale, color == "black"), mean(profit > 0))

# Save only the price and cost columns in a new dataframe
bsale.2 <- bsale[c("price", "cost")]

# Change the names of the columns to "p" and "c"
names(bsale.2) <- c("p", "c")

# Create a dataframe called old.black.bsale containing only data from black boats older than 50 years
old.black.bsale <- subset(bsale, color == "black" & age > 50)

## 8.1 What are matrices adn dataframes?
# rows = m, columns = n
# Matrix can contain wither character or numberic columns 
# dataframes can contain both numberic and character columns

##8.2 Creating matrices and dataframes
#cbind() and rbind() both create matrices by combiningseveral vectors of the same length.

#cbind() combines vectors as columns and rbind() combines them as rows
x <- 1:5
y <- 6:10
z <- 11:15

# Create a matrix where x, y, and z are columns
cbind(x, y, z)

#x, y, and z are rows
rbind(x, y, z)

#8.2.2 matrix() can either contain numbers or characters 

# Creating a matrix with numeric and character columns will make everything a character:
cbind(c(1, 2, 3, 4, 5), c("a", "b", "c", "d", "e"))

# Has 4 main inputs
#   data- a vector of data 
#   nrow- the number of rows you want in a matrix
#   ncol- the number of columns you want in the matrix 
#   byrow- a logical value indicating whether you want to fill the matrix by rows

# Create a matrix of the integers 1:10 with 5 rows and 2 columns
matrix(data = 1:10, nrow = 5, ncol = 2)

# Now a row with 2 rows and 5 columns
matrix(data = 1:10, nrow = 2, ncol = 5)

#Now with 2 rows and 5 columns, but fill by row instead of columns 
matrix(data = 1:10, nrow = 2, ncol = 5, byrow = TRUE)

#8.2.3 data.frame()
# Works siliarily to cbind()- but need to specify names to each of columns as you deifne them

#create a dataframe of survey data
survey <- data.frame("index" = c(1, 2, 3, 4, 5), "sex" = c("m", "m", "m", "f", "f"),
                     "age" = c(99, 46, 23, 54, 23))
survey

# 8.2.3.1 stringsasFactors = FALSE
##tell R to not convert your string columns to factors, 
#     you need to include the argument stringsAsFactors = FALSE when using functions such as data.frame()
# Show me the structure of the survey dataframe
str(survey)

# Create a dataframe of survey data WITHOUT factors
survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "sex" = c("m", "m", "m", "f", "f"),
                     "age" = c(99, 46, 23, 54, 23),
                     stringsAsFactors = FALSE)
survey
# Look at the structure: no more factors!
str(survey)

##8.3 Matrix and dataframe functions
# head() shows the first few rows
head(ChickWeight)

# tail() shows he last few rows
tail(ChickWeight)

# View() opens the entire dataframe in a new window
View(ChickWeight)

#8.3.2 summary(), str()
# Print summary statistics of ToothGrowth to the console
summary(ToothGrowth)

# Print additional information about ToothGrowth to the console
str(ToothGrowth)

#8.4 Dataframe column names 
# What are the names of columns in the ToothGrowth dataframe?
names(ToothGrowth)

# Return the len column of ToothGrowth
ToothGrowth$len

# What is the mean of the len column of ToothGrowth?
mean(ToothGrowth$len)

# Give me a table of the supp column of ToothGrowth.
table(ToothGrowth$supp)

# Give me the len AND supp columns of ToothGrowth
head(ToothGrowth[c("len", "supp")])

#8.4.1 Adding new columns
# Add new columns using the $ and assignment and <- operators 
#   use df$name notation and assign a new vector of data 
# Create a new dataframe called survey
survey <- data.frame("index" = c(1, 2, 3, 4, 5),
                     "age" = c(24, 25, 42, 56, 22))
survey

#Add new sex column
survey$sex <- c("m", "m", "f", "f", "m")
survey

#8.4.2 Changing column names
# Change name of 1st column of df to "a"
names(df)[1] <- "a"
# Change name of 2nd column of df to "b"
names(df)[2] <- "b"

# Change the name of the first column of survey to "participant.number"
names(survey)[1] <- "participant.number"

# Change the column name from age to age.years
names(survey)[names(survey) == "age"] <- "years"
survey

#8.5 Slicing dataframes
# use two indexing vectors: one for rows and other for columns

# return row 1
df[1, ]

#return column 5
df[ ,5]

# rows 1:5 and column 2
df[1:5, 2]

# Give me the rows 1-6 and column 1 of ToothGrowth
ToothGrowth[1:6, 1]

# Give me rows 1-3 and columns 1 and 3 of ToothGrowth
ToothGrowth[1:3, c(1,3)]

#Want to look at entire 1st row, leave column blank
# Give me the 1st row (and all columns) of ToothGrowth
ToothGrowth[1, ]

# Give me the 2nd column (and all rows) of ToothGrowth
ToothGrowth[, 2]

# Create a new df with only the rows of ToothGrowth
#  where supp equals VC
ToothGrowth.VC <- ToothGrowth[ToothGrowth$supp == "VC", ]

# Create a new df with only the rows of ToothGrowth
#  where supp equals OJ and dose < 1
ToothGrowth.OJ.a <- ToothGrowth[ToothGrowth$supp == "OJ" &
                                  ToothGrowth$dose < 1, ]

#subset()
# Get rows of ToothGrowth where len < 20 AND supp == "OJ" AND dose >= 1
subset(x = ToothGrowth,
       subset = len < 20 &
         supp == "OJ" &
         dose >= 1)

# Get rows of ToothGrowth where len > 30 AND supp == "VC", but only return the len and dose columns
subset(x = ToothGrowth,
       subset = len > 30 & supp == "VC",
       select = c(len, dose))

#8.6 Combining slicing with functions 

# What is the mean tooth length of Guinea pigs given OJ?
# Step 1: Create a subsettted dataframe called oj
oj <- subset(x = ToothGrowth,
             subset = supp == "OJ")

# Step 2: Calculate the mean of the len column from
#  the new subsetted dataset
mean(oj$len)

#OR
# Step 1: Create a subsettted dataframe called oj
oj <- ToothGrowth[ToothGrowth$supp == "OJ",]

# Step 2: Calculate the mean of the len column from
#  the new subsetted dataset
mean(oj$len)

#OR
mean(ToothGrowth$len[ToothGrowth$supp == "OJ"])

health <- data.frame("age" = c(32, 24, 43, 19, 43),
                     "height" = c(1.75, 1.65, 1.50, 1.92, 1.80),
                     "weight" = c(70, 65, 62, 79, 85))
health

#calculate BMI
health$weight / health$height ^ 2

# Save typing by using with()
with(health, height / weight ^ 2)

# Short code that does the same thing
with(health, weight + height / age + 2 * height)

#8.7 Test your Might
# 1. Combine data into single dataframe
superhero.tattoo <- data.frame(name = c("Astrid", "Lea", "Sarina", "Remon", "Letizia", "Babice", "Jonas", "Wendy", "Niveditha", "Gioia"),
                     sex = c("F", "F", "F", "M", "F", "F", "M", "F", "F", "F"),
                     age = c(30, 25, 25, 29, 22, 22, 35, 19, 32, 21),
                     superhero = c("Bat", "Super", "Bat", "Spider", "Bat", "Ant", "Bat", "Super", "Maggott", "Super"),
                     tattoos = c(11, 15, 12, 5, 65, 3, 9, 13, 900, 0))

# 2. median age of the 10 pirates 
median(superhero.tattoo$age)

# 3. mean age of F and M pirates seperately
mean(superhero.tattoo$age[superhero.tattoo$sex == "F"])
mean(superhero.tattoo$age[superhero.tattoo$sex == "M"])

#4. Most tattoos by male pirate
max(superhero.tattoo$tattoos[superhero.tattoo$sex == "M"])

#5. What % under the age of 25 are female
with(superhero.tattoo, mean(sex[age < 25] == "F"))

#6. What % F are under the age of 25
with(superhero.tattoo, mean(age[sex == "F"] < 25))

#7. Add new column: tattoos.per.year
superhero.tattoo$tattoos.per.year <- with(superhero.tattoo, tattoos / age)

#8. Which pirate had the most tattoos per year?
superhero.tattoo$name[superhero.tattoo$tattoos.per.year == max(superhero.tattoo$tattoos.per.year)]

#9. Female pirates who love superman
superhero.tattoo$name[with(superhero.tattoo, sex == "F" & superhero == "Super")]

#10. median number tattoos of pirates over age of 20 who loves spiderman
with(superhero.tattoo, (tattoos[age > 20 & superhero == "Spider"]))
