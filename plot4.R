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
data$datetime <- as.POSIXct(data$datetime)
par(mfrow = c(2, 2))
with(dsPower,
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = ""))
with(dsPower,plot(Voltage ~ datetime, type = "l"))
with(dsPower,plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = ""))
with(dsPower,plot(Global_reactive_power ~ datetime, type = "l"))

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()


