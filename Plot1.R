setwd("~/Uni/Coursera/Exploratory Data Analysis/Assignment 1")

##Use sql to define the dates to load in to R.
library(sqldf)
mySql <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

## Plot 1
with(myData, hist(Global_active_power, col = "Red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))





