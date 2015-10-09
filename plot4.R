filename <- "./household_power_consumption.txt" 
##Opens the file and sets the class of each column
data <- read.table(filename,header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")  
##Subsets the data according to the two days we are looking to plot
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]  
##Creates a new column that combines the Date and Time columns into one
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
##Splts the plot into 4 separate plots
par(mfrow = c(2, 2))
##Creates the 4 plots
plot(data$Datetime, data$Global_active_power, type="l", ylab="Global Active Power", xlab="")
plot(data$Datetime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(data$Datetime, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(data$Datetime, data$Sub_metering_2, col='Red')
lines(data$Datetime, data$Sub_metering_3, col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$Datetime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
##Saves the plot as png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()