## loading file into R.
FilePath <- "C:\\Users\\sharyatpanahib\\coursera\\R Programming\\household_power_consumption.txt"
data<- read.table(FilePath, sep = ";",header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
data<-subset(data, subset =(data$Date == "2007-02-01" | data$Date == "2007-02-02" ))
library(dplyr)
data<- mutate(data, datetime = paste(as.Date(data$Date), data$Time))
data$datetime <- as.POSIXct(data$datetime)
png(filename = "C:\\Users\\sharyatpanahib\\coursera\\R Programming\\Plot2.png",width = 480, height = 480)
plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()