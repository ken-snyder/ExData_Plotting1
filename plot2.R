# Exploratory Data Analysis Week 1 assignment.
# Create 4 plots using the Electric Power Consumption data.
# Script 2 of 4

library(data.table)
library(dplyr)

# Read the data in and prepare the Date and Time variables
pwr_dt <- fread("household_power_consumption.txt", na.strings = "?")
mydate <- as.data.table(strptime(paste(pwr_dt$Date, pwr_dt$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
colnames(mydate) <- c("DateTime")
pwr_dt <- cbind(pwr_dt, mydate)
pwr_sub <- filter(pwr_dt, DateTime >= as.POSIXlt("2007-02-01 00:00:00"), 
                          DateTime <  as.POSIXlt("2007-02-03 00:00:00"))
rm("pwr_dt")

# Draw the plot
png("plot2.png")
with(pwr_sub, plot(DateTime, Global_active_power, type = "l", 
                       ylab = "Global Active Power (kilowatts)",
                       xlab = ""))
dev.off()
