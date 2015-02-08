## Exploratory Data Analysis
## Project 1, Plot 2
##
## Examine how household energy usage varies over a 2-day period in February, 2007.
## Read dataset and save relevant data to a plot in a PNG file.


## Load data.table package
library(data.table)
## Set columns to read from dataset
selectCol <- c("Date", "Time", "Global_active_power")
## Read only selected columns from dataset and store to a data table
DT <- fread("household_power_consumption.txt", select = selectCol, colClasses="character")
## Create new smaller subset with only the required dates
DT <- DT[DT$Date %in% c("1/2/2007", "2/2/2007"),]
## Convert date and time from data table into the POSIXlt class
dateTime <- strptime(paste(DT$Date,DT$Time), "%d/%m/%Y %H:%M:%S")
## Coerce remaining relevent column from data table subset into numeric
DT$Global_active_power <- as.numeric(DT$Global_active_power)
## Remove possible missing values
DT <- na.omit(DT)
## Open the PNG file device
png(file = "plot2.png", width = 480, height = 480)
## Create base plot
plot(dateTime, DT$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     main = "")
## Close the PNG file device
dev.off()