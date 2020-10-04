fulldata <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings = "?")
data <- subset(fulldata, Date == "1/2/2007" | Date  == "2/2/2007")
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- strptime(data$Date, format = "%d/%m/%Y")

png("plot4.png")
par(mfrow = c(2,2))

plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$Time, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
points(data$Time, data$Sub_metering_2, type = "l", col = "red")
points(data$Time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, bty = "n")

plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()