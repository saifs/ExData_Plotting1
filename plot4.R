## Exploratory Data Analysis
## Project 1, Plot 4
##
## Examine how household energy usage varies over a 2-day period in February, 2007.
## Read dataset and save relevant data to a plot in a PNG file.


## Load data.table package
library(data.table)
## Read entire dataset and store to a data table
DT <- fread("household_power_consumption.txt", colClasses="character")
## Create new smaller subset with only the required dates
DT <- DT[DT$Date %in% c("1/2/2007", "2/2/2007"),]
## Convert date and time from data table into the POSIXlt class
dateTime <- strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S")
## Coerce remaining relevent columns from data table subset into numeric
for (col in 3:9) DT[[col]] <- as.numeric(DT[[col]])
## Remove possible missing values
DT <- na.omit(DT)
## Open the PNG file device
png(file = "plot4.png", width = 480, height = 480)
## Set 4 plots into a single device
par(mfrow = c(2, 2))
## Create base plots
plot(dateTime, DT$Global_active_power,
     type = "l",
     ylab = "Global Active Power",
     xlab = "",
     main = "")
plot(dateTime, DT$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime",
     main = "")
plot(dateTime, DT$Sub_metering_1,
     type = "l",
     ylab = "Energy sub metering",
     xlab = "",
     main = "")
lines(dateTime, DT$Sub_metering_2, col = "red")
lines(dateTime, DT$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, bty = "n", cex= 0.9, col=c("black", "red", "blue"))
plot(dateTime, DT$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime",
     main = "")
## Close the PNG file device
dev.off()