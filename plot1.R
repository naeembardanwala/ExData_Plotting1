#load test and train data
testData  <- read.table("./household_power_consumption.txt",   header = TRUE)

setwd("~/RWorks/ExploratoryAnalysis")
#load
dsPowerFull <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

dsPowerFull$Date <- as.Date(dsPowerFull$Date, format = "%d/%m/%Y")

#Subsetting ny condition 
dsPower <- subset(dsPowerFull, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

#plot
with(dsPower, hist(Global_active_power, main = "Global Active Power", 
                   xlab = "Global Active Power (kilowatts)", col = "Red"))

# copy to PNG
dev.copy(png, file = "plot1.png", height = 480, width=480)
# device off
dev.off()