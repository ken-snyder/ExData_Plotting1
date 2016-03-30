# Exploratory Data Analysis Week 1 assignment.
# Create 4 plots using the Electric Power Consumption data.
# Script 1 of 4

library(data.table)
library(dplyr)
pwr_dt <- as.data.table(read.table("household_power_consumption.txt", 
                                   sep = ";", 
                                   header = TRUE,
                                   na.strings = "?", 
                                   stringsAsFactors = FALSE))

pwr_dt[,DateTime := as.Date(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
pwr_subset <- filter(pwr_dt, DateTime >= as.Date("2007-02-01 00:00:00"), 
                    DateTime < as.Date("2007-02-03 00:00:00"))
rm("pwr_dt")

png("plot1.png")
hist(pwr_subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
