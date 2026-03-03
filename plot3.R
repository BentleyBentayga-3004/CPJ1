data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?")

sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

sub$DateTime <- strptime(paste(sub$Date, sub$Time),
                         "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(sub$DateTime, sub$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(sub$DateTime, sub$Sub_metering_2, col = "red")

lines(sub$DateTime, sub$Sub_metering_3, col = "blue")

legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))

dev.off()
