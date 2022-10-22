
##reading the data

library(dplyr)

dataset<-read.csv("household_power_consumption.txt", sep = ";")

datasetDateFormated <-dataset%>%
  mutate(DateFormated = strptime(Date,format = "%d/%m/%Y"))%>%
  mutate(TimeFormated = strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"))

datasetFilter<- filter(datasetDateFormated, DateFormated=="2007-02-01" | DateFormated=="2007-02-02")

rm(dataset, datasetDateFormated)

##creating plot 4


png(file="plot4.png", width = 480, height = 480)

par(mar=c(4,4,2,2))
par(mfrow=c(2,2))

with(datasetFilter, 
     plot(TimeFormated,Global_active_power, type="l", 
          xlab="", 
          ylab="Globla Active Power (kilowatts)"))

with(datasetFilter, 
     plot(TimeFormated,Voltage, type="l", 
          xlab="Datetime", 
          ylab="Voltage"))

##creating plot 3

with(datasetFilter, 
     plot(TimeFormated,datasetFilter$Sub_metering_1, type="n", 
          xlab="", 
          ylab="Energy sub metering"))

lines(datasetFilter$TimeFormated,datasetFilter$Sub_metering_1, type="l")

lines(datasetFilter$TimeFormated,datasetFilter$Sub_metering_2, type="l",
      col="red")

lines(datasetFilter$TimeFormated,datasetFilter$Sub_metering_3, type="l",
      col="blue")

legend("topright",col = c("black","red","blue"), pch = c("-","-","-"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##plot 4

with(datasetFilter, 
     plot(TimeFormated,Global_reactive_power, type="l", 
          xlab="Datetime", 
          ylab="Global_reactive_power"))

dev.off()


