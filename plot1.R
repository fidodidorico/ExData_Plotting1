
##reading the data

library(dplyr)

dataset<-read.csv("household_power_consumption.txt", sep = ";")

datasetDateFormated <-dataset%>%
  mutate(DateFormated = strptime(Date,format = "%d/%m/%Y"))%>%
  mutate(TimeFormated = sub(strptime(Time, format="%H:%M:%S")))

datasetFilter<- filter(datasetDateFormated, DateFormated=="2007-02-01" | DateFormated=="2007-02-02")

rm(dataset, datasetDateFormated)

##creating plot 1

png(file="plot1.png", width = 480, height = 480)

hist(as.numeric(datasetFilter$Global_active_power), 
     col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()


