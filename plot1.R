data <- read.table("household_power_consumption.txt",
                   header = TRUE, sep = ";", na.strings = "?")

sub <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))
sub$DateTime <- strptime(paste(sub$Date, sub$Time),
                         "%d/%m/%Y %H:%M:%S")

png("plot1.png", width = 480, height = 480)
hist(sub$Global_active_power,
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
