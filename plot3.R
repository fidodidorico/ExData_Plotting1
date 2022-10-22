
##reading the data

library(dplyr)

dataset<-read.csv("household_power_consumption.txt", sep = ";")

datasetDateFormated <-dataset%>%
  mutate(DateFormated = strptime(Date,format = "%d/%m/%Y"))%>%
  mutate(TimeFormated = strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"))

datasetFilter<- filter(datasetDateFormated, DateFormated=="2007-02-01" | DateFormated=="2007-02-02")

rm(dataset, datasetDateFormated)

##creating plot 3

png(file="plot3.png", width = 480, height = 480)

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

dev.off()


