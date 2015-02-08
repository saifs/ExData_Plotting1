## Exploratory Data Analysis
## Project 1, Plot 1
##
## Examine how household energy usage varies over a 2-day period in February, 2007.
## Read dataset and save relevant data to a plot in a PNG file.


## Load data.table package
library(data.table)
## Set columns to read from dataset
selectCol <- c("Date","Global_active_power")
## Read only selected columns from dataset and store to a data table
DT <- fread("household_power_consumption.txt", select = selectCol, colClasses="character")
## Create new smaller subset with only the required dates
DT <- DT[DT$Date %in% c("1/2/2007", "2/2/2007"),]
## Coerce remaining relevent column from data table subset into numeric
DT$Global_active_power <- as.numeric(DT$Global_active_power)
## Remove possible missing values
DT <- na.omit(DT)
## Open the PNG file device
png(file = "plot1.png", width = 480, height = 480)
## Create base plot
hist(DT$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
## Close the PNG file device
dev.off()