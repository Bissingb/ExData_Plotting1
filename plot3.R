filename <- "./household_power_consumption.txt"
data <- read.table(filename,header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
plot(data$Datetime, data$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Datetime, data$Sub_metering_2, col='Red')
lines(data$Datetime, data$Sub_metering_3, col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()