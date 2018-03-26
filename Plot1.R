## loading file into R.
FilePath <- "C:\\Users\\sharyatpanahib\\coursera\\R Programming\\household_power_consumption.txt"
data<- read.table(FilePath, sep = ";",header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
data<-subset(data, subset =(data$Date == "2007-02-01" | data$Date == "2007-02-02" ))
png(filename = "C:\\Users\\sharyatpanahib\\coursera\\R Programming\\Plot1.png",width = 480, height = 480)
hist(data$Global_active_power, col = "red", ylim = c(0,1200),xlim = c(0,6), main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()