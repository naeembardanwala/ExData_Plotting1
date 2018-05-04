#Set working directory
setwd("~/RWorks/ExploratoryAnalysis")

#load full data set
dsPowerFull <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dsPowerFull$Date <- as.Date(dsPowerFull$Date, format = "%d/%m/%Y")

#Subsetting condition for 2 dates
dsPower <- subset(dsPowerFull, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

png(filename="plot1.png",width = 480, height = 480)
#plot
with(dsPower, hist(Global_active_power, main = "Global Active Power", 
                   xlab = "Global Active Power (kilowatts)", col = "Red"))

# device off
dev.off()