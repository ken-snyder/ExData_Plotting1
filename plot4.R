# Exploratory Data Analysis Week 1 assignment.
# Create 4 plots using the Electric Power Consumption data.
# Script 4 of 4

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

# Draw the plot with 4 graphs, 2 x 2

png("plot4.png")
par(mfrow = c(2,2))
# Plot 1
with(pwr_sub, plot(DateTime, Global_active_power, type = "l", 
                   ylab = "Global Active Power (kilowatts)",
                   xlab = ""))

# Plot 2
with(pwr_sub, plot(DateTime, Voltage, type = "l", 
                       ylab = "Voltage",
                       xlab = "DateTime"))

# Plot 3
with(pwr_sub, plot(DateTime, Sub_metering_1, type = "l",
                   col = "black",
                   ylab = "Energy sub metering",
                   xlab = ""))
with(pwr_sub, lines(DateTime, Sub_metering_2, col = "red"))
with(pwr_sub, lines(DateTime, Sub_metering_3, col = "blue"))

# Draw the legend
colors <- c("black", "red", "blue")
legTxt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col = colors, legend = legTxt, lty = "solid", bty = "n")

# Plot 4
with(pwr_sub, plot(DateTime, Global_reactive_power, type = "l",
                   ylab = "Global_reactive_power",
                   xlab = "DateTime"))

dev.off()
