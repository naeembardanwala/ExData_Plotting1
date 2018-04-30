#load test and train data
testData  <- read.table("./household_power_consumption.txt",   header = TRUE)

setwd("~/RWorks/ExploratoryAnalysis")
#load
dsPowerFull <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dsPowerFull$Date <- as.Date(dsPowerFull$Date, format = "%d/%m/%Y")

#Subsetting ny condition 
dsPower <- subset(dsPowerFull, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# format datetime 
dsPower$datetime <- strptime(paste(dsPower$Date, dsPower$Time), "%Y-%m-%d %H:%M:%S")

# Conv
dsPower$datetime <- as.POSIXct(dsPower$datetime)

# specifying variant dependency and scatterplot
with(dsPower,plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = ""))
lines(dsPower$Sub_metering_2 ~ dsPower$datetime, col = "Red")
lines(SdsPower$ub_metering_3 ~ dsPower$datetime, col = "Blue")
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()

