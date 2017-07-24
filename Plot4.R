##### Download Household Power Consumption dataset, unzip and  
##### store in working directory as "household_power_consumption.txt". 
##### Dataset link:
##### https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


Lines <- readLines("./household_power_consumption.txt")
twodayLines <- grep("^1\\/2\\/2007|^2\\/2\\/2007", Lines)  

twoday <- read.table(text=Lines[twodayLines], na.strings = "?",sep=";",  
                    col.names = c("Date", "Time", "Global_active_power", 
                                  "Global_reactive_power", "Voltage", 
                                  "Global_intensity", "Sub_metering_1", 
                                  "Sub_metering_2", "Sub_metering_3") )
  
twoday$Time<-as.character(twoday$Time)                                                                             
twoday$DateTime <- paste(twoday$Date, twoday$Time)
twoday$DateTime <- strptime(twoday$DateTime, format="%d/%m/%Y %H:%M:%S")

##Plot4
png(filename = "Plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(2,1,1,1))
plot(twoday$DateTime, twoday$Global_active_power, ylab="Global Active Power", xlab="", type="l")
plot(twoday$DateTime, twoday$Voltage, ylab="Voltage", xlab="datetime", type="l")
plot(twoday$DateTime, twoday$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")

points(twoday$DateTime, twoday$Sub_metering_2, type="l", col="red")
points(twoday$DateTime, twoday$Sub_metering_3, type="l", col="blue")

legend("topright", pch ="-" , col=c("black", "red", "blue"), legend = 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(twoday$DateTime, twoday$Global_reactive_power, 
     ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()