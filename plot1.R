fulldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
data <- subset(fulldata, Date == "1/2/2007" | Date  == "2/2/2007")
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, format = "%d/%m/%Y")

png("plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()