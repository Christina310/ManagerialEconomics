#-------------------------------------------------------------------------------
# AAE 636: Section 2
# Date: September 15, 2023
#-------------------------------------------------------------------------------
# Require package
library(dplyr)
library(writexl)
library(readxl)
#-------------------------------------------------------------------------------
# Your working directory
# dir <- "your working directory"
dir <- "C:/Users/satch/Box/636TA_F23/2023_Material/DIS_091523"
setwd(dir)


#-------------------------------------------------------------------------------
# SECTION 1 
#-------------------------------------------------------------------------------
# Load data
# 2016
load("mtcars_sample.RData")
data <- mtcars_sample
# data <- read.csv("mtcars_sample.csv")
# data <- read_xlsx("mtcars_sample.xlsx", sheet = 1)
# my_data <- read.table("mtcars_sample.csv", header = TRUE, sep = ",")
# my_data <- read.table("mtcars_sample.txt", header = TRUE, sep = "\t") # tab-delimited

#-------------------------------------------------------------------------------
# SECTION 2 
#-------------------------------------------------------------------------------
# How many rows the data frame?
nrow(data)

# How many columns are there?
ncol(data)

# Dimensions?

dim(data)

# What are the column names?
colnames(data)

# Print the first 5 elements of data
head(data, n = 5)

# Print the last 5 elements of data
tail(data, n = 5)

# Get row 1 to 10 and all columns
subset_df <- data[1:10, ]

# Print the first 3 column names
colnames(data)[1:3]

# Subset data frame to get only information on mpg and wt
mpg_df <- subset(data, select = c("mpg","wt"))

# What are the data type of object "data"?
class(data)


#-------------------------------------------------------------------------------
# SECTION 3

# Summary of the data?
summary(data)

# What is the mean of mpg?
mean(data$mpg)

# What is the max of wt?
mean(data$wt)

# Sample mean of weight of cars that have less than 7 cylinders
mean(data$wt[data$cyl <= 7])

# Sample mean sd of weight of cars that have less than 7 cylinders
sd(data$wt[data$cyl <= 7])

# Make a histogram of GDP per Capita
hist(data$wt)

hist(data$wt,
     main="Histogram of Cars Weight",
     xlab="Weight", 
     ylab="Frequency")

# Which model has the largest mpg?
data$model[data$mpg==max(data$mpg)]

# Which model has the largest mpg among cars having 3 years
data$model[data$mpg==max(data$mpg[data$gear==3]) & data$gear==3]

#-------------------------------------------------------------------------------
# SECTION 5
#-------------------------------------------------------------------------------
# Make a scatter plot for mpg and wt
library(ggplot)

p <- ggplot(data=data, aes(x = mpg, 
                    y = wt)) +
  geom_point()


p + labs(title    = "Weight w.r.t mpg", 
         # subtitle = "Color by Year",
         x = "Miles per Gallon",
         y = "Weight")
