#set working directory
setwd("~/RWorks/ExploratoryAnalysis")
#load
dsPowerFull <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dsPowerFull$Date <- as.Date(dsPowerFull$Date, format = "%d/%m/%Y")

#Subsetting condition for 2 dates
dsPower <- subset(dsPowerFull, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# format datetime 
dsPower$datetime <- strptime(paste(dsPower$Date, dsPower$Time), "%Y-%m-%d %H:%M:%S")

# Conv
dsPower$datetime <- as.POSIXct(dsPower$datetime)

#write to device
png(filename="plot4.png",width = 480, height = 480)

par(mfrow = c(2, 2))

#plot1
with(dsPower,
     plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
          xlab = ""))

#plot1
with(dsPower,plot(Voltage ~ datetime, type = "l"))

#plot3

# specifying variant dependency and scatterplot
with(dsPower,plot(Sub_metering_1 ~ datetime, type = "l", 
                  ylab = "Energy sub metering", xlab = ""))
lines(dsPower$Sub_metering_2 ~ dsPower$datetime, col = "Red")
lines(dsPower$Sub_metering_3 ~ dsPower$datetime, col = "Blue")

legend(x="topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("Black","red", "blue")
       ,lty=1.2,cex=1)

#plot4
with(dsPower,plot(Global_reactive_power ~ datetime, type = "l"))


dev.off()


