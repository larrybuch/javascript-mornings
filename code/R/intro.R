# FiveThirtyEight "Intro to R" Seminar
# Friday, May 2, 2014

# What is R?

# Overview of RStudio layout: Console, Editor, History, Viewer, etc.

# WHAT IS THIS GREEN TEXT AFTER THE # SYMBOL? COMMENTS! R ignores them

# How to execute commands on (1) Console and (2) Editor

# First things first: what and where is my working directory?

getwd()

setwd("~/Documents/coding-programming/R/basics")  #  Create a folder "538seminar" in your "Documents" folder

list.files()

# Second: how do I get help?

?getwd
help(getwd)
?mean

# Basic R "data types": Numeric, Logical, Character

# Numeric -- a "class" of variables, to use the R terminology 
1 + 1
class(1)
10^2 + 36 # See, R can be used as a calculator

# Logical
1 == 1
1 == 2
class(1 == 1)

# Character class
FiveThirtyEight # BAD: Typing characters without '' issues error
'FiveThirtyEight' # GOOD
name = 'FiveThirtyEight' # We ASSIGN a name & adds to workspace
name 
class(name)

# Vectors
vector = c(3,4,5)  # c() is a FUNCTION, short for 'concatenate"
?c

class(vector)  # It's still 'numeric' but now it's a vector, and is indexed
vector[1]
vector[3]-vector[2]

# There are other variables we'll cover later: matrices, 
# data frame, factors, etc.

## Functions
# Like c(), R has MANY useful functions
max(vector)
min(vector)
mean(vector)
median(vector)
sd(vector)
length(vector)

?rnorm  # rnorm() creates random data according to the Normal distribution 
rnorm(10) # Default is mean = 0, sd = 1
random.data = rnorm(100)
length(random.data)

# Test: use functions from above on random.data

## Basic Plotting
# R has a base plotting package that is UGLY but useful
plot(random.data)
hist(random.data)
barplot(random.data)

plot(random.data, type="l")  # Line plot; default is scatter plot
hist(random.data, col='red') # Change color
barplot(random.data, main='Random Data')  # Add title

## Packages and your library
??MASS
install.packages("MASS")
library(MASS)

# We're going to use the dataset "Cars93" from the MASS package
data(Cars93)
View(Cars93)

## Data Frames
# But what kind of "object" is this? A Data Frame.
class(Cars93)
?data.frame

# As an aside, you can create your own data frames
random.DF = data.frame(1:100, 101:200)
View(random.DF)

# Extremely useful functions: str, head, tail, names, & summary
str(Cars93) ## MY VOTE FOR BEST R FUNCTION
head(Cars93)
tail(Cars93)
names(Cars93)
summary(Cars93)

# Accessing variables in a data frame, use this symbol: $
head(Cars93$MPG.city)
hist(Cars93$MPG.city)

# More extremely useful functions
dim(Cars93)
nrow(Cars93)
ncol(Cars93)

length(Cars93) # Note: on data frames, length() same as ncol()

# Subsetting data frames
# WARNING: THIS CAN BE VERY CONFUSING
summary(Cars93$MPG.city) # Extreme outliers on high side (trucks?)
dim(Cars93)
dim(cars_under30)
cars_under30 = Cars93[Cars93$MPG.city < 30, ]
hist(cars_under30$MPG.city)

# Factor variables and useful functions
class(Cars93$Manufacturer)

table(Cars93$Manufacturer)
unique(Cars93$Manufacturer) 

length(Cars93$Manufacturer)
nrow(Cars93) # Same as the one above, remember?


# More plotting awesomeness
plot(Cars93$MPG.city, Cars93$MPG.highway)
plot(Cars93$Manufacturer, Cars93$MPG.highway)

boxplot(Cars93$Price ~ Cars93$Type)
# Nearly identical to:
plot(Cars93$Price ~ Cars93$Type)

## Reading in outside data

# CSV files
?read.csv
mlb.players = read.csv("mlb_players.csv", header=T)
View(mlb.players)
names(mlb.players)

# Excel files
librarians = read.csv("librarians_by_msa.xlsx") # WON'T WORK

install.packages("gdata")
library(gdata)
?read.xls

librarians = read.xls("librarians-by-msa.xlsx", sheet='msa-data')
# Obviously slower though
View(librarians)

## Statistical analysis ##

# Basic stastical functions
?cor
cor(Cars93$MPG.city, Cars93$MPG.highway)

sd(mlb.players$bat_WAR)
sd(mlb.players$pitch_WAR)

# Regression analysis
# From MLB data, let's ask: what's the relationship between age and performance?
sports.model = lm(total_WAR ~ age, data=mlb.players)
class(sports.model)

# Same thing as
sports.model = lm(mlb.players$total_WAR ~ mlb.players$age)
summary(sports.model) # Notice "overloading" of summary() function

# But age is factor variable in this regression
# That's *NOT* what we want?

class(mlb.players$total_WAR)
class(mlb.players$age)

# Create new column in data frame
mlb.players$age_numeric = as.numeric(mlb.players$age)
class(mlb.players$age_numeric)

# Re-run regression
sports.model2 = lm(total_WAR ~ age_numeric, data=mlb.players)
summary(sports.model2)

# But this is a stupid model. Let's move back to cars
# Question: Do faster cars cost more?

cars.model1 = lm(Cars93$Price ~ Cars93$Horsepower)
summary(cars.model1)

## Better plotting
# Let's graph price and horsepower
# But let's add labels
plot(Cars93$Price, Cars93$Horsepower, main='Price and Horsepower', xlab='Price', ylab='Horsepower')

# There is much better plotting packages out there
install.packages("ggplot2")
library(ggplot2)
qplot(Cars93$Price, Cars93$Horsepower, main='Price and Horsepower')