## connecting and downloading the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- download.file(url, destfile = "dataset.zip")
unzip("dataset.zip") ## the data is stored in: "household_power_consumption.txt

## ONLY read the data required to be plotted: two days 2007-02-01 and 
## 2007-02-02 from the link provided
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")
datasubset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

## converting Date and Time variables between character representations and objects
## of classes "POSIXlt" and "POSIXct" representing calendar dates and times.
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep = ""), 
                     "%d/%m/%Y %H:%M:%S")
submetering1 <- as.numeric(datasubset$Sub_metering_1)
submetering2 <- as.numeric(datasubset$Sub_metering_2)
submetering3 <- as.numeric(datasubset$Sub_metering_3)

## plotting the three meeting readings for the selected days, by plotting the first
## variable, and adding lines to the plot
plot(datetime, submetering1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
title(main = "Energy Sub Metering")
lines(datetime, submetering2, type = "l", col = "red")
lines(datetime, submetering3, type = "l", col = "blue")

## adding the legend to the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

## copying the plot in the png device and closing the device
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
