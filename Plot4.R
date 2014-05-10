setwd("~/Uni/Coursera/Exploratory Data Analysis/Assignment 1")

##Use sql to define the dates to load in to R.
library(sqldf)
mySql <- "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myFile <- "household_power_consumption.txt"
myData <- read.csv.sql(myFile, sql=mySql, sep=";")

## Set Par
par(mfrow = c(2,2))

## Plot 1
DateTime <- paste(myData$Date, myData$Time)
DT <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
plot(DT, myData$Global_active_power, type="l", xlab="", ylab="Global Active Power")

## Plot 2
plot(DT, myData$Voltage, type="l", xlab="datetime", ylab="Voltage")

## Plot 3
plot(DT, myData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", )
lines(DT, myData$Sub_metering_2, type = "l", col = "Red")
lines(DT, myData$Sub_metering_3, type = "l", col = "Blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot 4
plot(DT, myData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
