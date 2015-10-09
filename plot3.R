filename <- "./household_power_consumption.txt" 
##Opens the file and sets the class of each column
data <- read.table(filename,header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")  
##Subsets the data according to the two days we are looking to plot
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]  
##Creates a new column that combines the Date and Time columns into one
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
##Creates the plot
plot(data$Datetime, data$Sub_metering_1, type="l", ylab="Global Active Power (kilowatts)", xlab="")
##Adds the other two lines to the y axis
lines(data$Datetime, data$Sub_metering_2, col='Red')
lines(data$Datetime, data$Sub_metering_3, col='Blue')
##Adds a legend describing each variable on the y axis
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##Saves the plot as a png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()