## loading file into R.
FilePath <- "C:\\Users\\sharyatpanahib\\coursera\\R Programming\\household_power_consumption.txt"
data<- read.table(FilePath, sep = ";",header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
data<-subset(data, subset =(data$Date == "2007-02-01" | data$Date == "2007-02-02" ))
library(dplyr)
data<- mutate(data, datetime = paste(as.Date(data$Date), data$Time))
data$datetime <- as.POSIXct(data$datetime)

png(filename = "C:\\Users\\sharyatpanahib\\coursera\\R Programming\\Plot4.png",width = 480, height = 480)
par(mfrow = c(2,2))

plot(data$Global_active_power ~ data$datetime, type = "l", ylab = "Global Active Power", xlab = "")

plot(data$Voltage ~ data$datetime, type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$Sub_metering_1 ~ data$datetime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col= "red")
lines(data$Sub_metering_3 ~ data$datetime, col= "blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Global_reactive_power ~ data$datetime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()