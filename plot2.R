
##reading the data

library(dplyr)

dataset<-read.csv("household_power_consumption.txt", sep = ";")

datasetDateFormated <-dataset%>%
  mutate(DateFormated = strptime(Date,format = "%d/%m/%Y"))%>%
  mutate(TimeFormated = strptime(paste(Date,Time),format = "%d/%m/%Y %H:%M:%S"))

datasetFilter<- filter(datasetDateFormated, DateFormated=="2007-02-01" | DateFormated=="2007-02-02")

rm(dataset, datasetDateFormated)

##creating plot 2

png(file="plot2.png", width = 480, height = 480)

with(datasetFilter, 
     plot(TimeFormated,Global_active_power, type="l", 
          xlab="", 
          ylab="Globla Active Power (kilowatts)"))

dev.off()


