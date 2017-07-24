##### Download Household Power Consumption dataset, unzip and  
##### store in working directory as "household_power_consumption.txt". Dataset link:
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

##Plot2
png(filename = "Plot2.png",width = 480, height = 480)
plot(twoday$DateTime, twoday$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()
