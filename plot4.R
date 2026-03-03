data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?")

sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

sub$DateTime <- strptime(paste(sub$Date, sub$Time),
                         "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(sub$DateTime, sub$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

plot(sub$DateTime, sub$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(sub$DateTime, sub$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(sub$DateTime, sub$Sub_metering_2, col = "red")

lines(sub$DateTime, sub$Sub_metering_3, col = "blue")

legend("topright",
       bty = "n",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

plot(sub$DateTime, sub$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
