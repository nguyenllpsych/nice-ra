#Chapter 8 Dataframes and Matrices

# -----------------------------
# Basic dataframe operations
# -----------------------------

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
View(bsale.2)
# Create a dataframe called old.black.bsale containing only data from black boats older than 50 years
old.black.bsale <- subset(bsale, color == "black" & age > 50)

#------------------------------------------------------
#cbind(a,b,c) Combine vectors as columns in a matrix
#rbind(a,b,c) Combine vectors as rows in a matrix
#matrix(x, nrow, ncol, byrow) Create a matrix from a vector x
#data.fram() Create a dataframe from named columns
#---------------------------------------------------------

x <- 1:5
y<- 6:10
z<- 11:15

View(rbind(x,y,z))
View(cbind(x,y,z))

#-----------------------------
matrix(data = 1:10,
       nrow = 2,
       ncol =5,
       byrow = TRUE)
#------------------------------------

Yuyang<- data.frame("index" = c(1,2,3,4,5),
                   "hobby" = c("flying", "fishing", "driving", "wakeboarding", "coocking"),
                   "classes" = c("nsci2021", "psy3103", "psy5993","psy3617","5993vol"),
                   stringsAsFactors = FALSE)
str(Yuyang)

head(Yuyang) #first couple data set
tail(Yuyang) #last couple dataset
nrow(Yuyang) #number of row
ncol(Yuyang) #number of column
dim(Yuyang) #row by column
rownames(Yuyang) 
colnames(Yuyang)
names(Yuyang)
str(Yuyang) #show structure of the dataframe
summary(Yuyang) 

names(Yuyang) #names of columns
Yuyang$classes #show me the row of classes

mean(Yuyang$index) #easy calculation 
table(Yuyang$hobby) #give me the table of the hobby 

#If you want multiple columns by name, no need the &
head(Yuyang[c("hobby", "classes")])

#Adding new column
Yuyang$FavMusic <- c("Taylor Swift", "Drake", "Olivia","Weknd","I do the same")

#Changing name of the colum
names(Yuyang)[names(Yuyang) == "FavMusic"] <- "Favorite Singer"
View(Yuyang)
#--------------------------------------------
#Now we slice the thingy
Yuyang[1,] #give me row 1
Yuyang[,2]
Yuyang[1:5, 2] #1-5 row but colum 2

#we can slicing with logical vectors
Yuyang.Musics <- Yuyang[Yuyang$'Favorite Singer' == "Taylor Swift",]
View(Yuyang.Musics)

#subset()
subset(x = Yuyang,
       subset = hobby == "flying" ||
         classes == "nsci2021")
#---------------------
#with(name of the datafram, the name of the colum followed)

library(help = "datasets")

#-------------------------------------------------------------
#R-might
#1
superHero<- data.frame("Name" = c("Astrid","Lea","Sarina","Remon","Letizia","Babice","Jonas","Wendy","Niveditha","Gioia"),
                    "Sex" = c("F", "F", "F", "M", "F","F","M","F","F","F"),
                    "Age" = c(30,25,25,29,22,22,35,19,32,21),
                    "Superhero" = c("Batman", "Superman", "Batman", "Spiderman","Batman","Antman","Batman","Superman","Maggott","Superman"),
                    "Tatoos" = c(11,15,12,5,65,3,9,13,900,0),
                    stringsAsFactors = FALSE)
View(superHero)

#2
mean(superHero$Age)

#3
mean(superHero$Age[superHero$Sex == "F"])
mean(superHero$Age[superHero$Sex == "M"])

#4
with(superHero,
     max(Tatoos[Sex=="M"]))
#5
with(superHero,
     mean(Sex[Age<32] == "F"))
#6
with(superHero,
     mean(Age[Sex == "F"] < 32))
#7
superHero$tatoos.per.year <- c(superHero$Tatoos / superHero$Age)
View(superHero)

#8 
superHero$Name[superHero$tatoos.per.year == max(superHero$tatoos.per.year)]

#9
with(superHero,
     Name[Superhero == "Superman" & Sex == "F"])
#10
with(superHero,
     median(Tatoos[Age > 20 & Superhero == "Spiderman"]))
