household <- read.table("household_power_consumption.txt", sep = ";", 
                      header = TRUE, stringsAsFactors = FALSE,
                      na.strings = "?")
idx <- with(household, which(Date == "1/2/2007" | Date == "2/2/2007"))
x <- household[idx, ]
x$Time <- strptime(paste(x$Date, x$Time), format = "%d/%m/%Y %T")

png("plot4.png")
par(mfrow = c(2, 2))
plot(x$Time, x$Global_active_power, type = "l", xlab = "", 
             ylab = "Global Active Power")
plot(x$Time, x$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(x$Time, x$Sub_metering_1, type = "l", xlab = "",
             ylab = "Energy sub metering")
lines(x$Time, x$Sub_metering_2, type = "l", col = "red")
lines(x$Time, x$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), bty = "n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x$Time, x$Global_reactive_power, type = "l", xlab = "datetime",
             ylab = "Global_reactive_power")
dev.off()