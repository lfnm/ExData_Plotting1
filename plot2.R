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
globalActivePower <- as.numeric(datasubset$Global_active_power)

## plotting the 2 converted varaibles and adding title
plot(datetime, globalActivePower, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
title(main = "Global Active Power vs Time")

## Copying plot in png device and closing png device
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
