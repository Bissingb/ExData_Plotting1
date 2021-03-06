filename <- "./household_power_consumption.txt" 
##Opens the file and sets the class of each column
data <- read.table(filename,header = TRUE,sep = ";",colClasses = c("character", "character", rep("numeric",7)),na = "?")  
##Subsets the data according to the two days we are looking to plot
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]  
##Creates a new column that combines the Date and Time columns into one
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
##Creates the historgram 
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
##Saves the histogram as png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()