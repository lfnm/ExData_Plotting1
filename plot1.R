## connecting and downloading the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- download.file(url, destfile = "dataset.zip")
unzip("dataset.zip") ## the data is stored in: "household_power_consumption.txt

## ONLY read the data required to be plotted: two days 2007-02-01 and 
## 2007-02-02 from the link provided

data <- read.table("household_power_consumption.txt", skip = 1, sep = ";", 
                   na.strings = "?")
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
                 "Sub_metering_3")
datasubset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

## converting the Date variable in datasubset into a "Date" class
dates <- as.Date(datasubset$Date, format = "%d, %m, %Y")

## plotting  a histagram of Frequency vs Global Active Power
hist(datasubset$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

## open, saving and closing the plotting device "png"
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()

