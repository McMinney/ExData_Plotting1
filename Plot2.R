setwd("~/Uni/Coursera/Exploratory Data Analysis/Assignment 1")

##Use sql to define the dates to load in to R.
library(sqldf)
mySql <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

##Plot 2
DateTime <- paste(myData$Date, myData$Time)
DT <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
##myData$DT <- DT

plot(DT, myData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

