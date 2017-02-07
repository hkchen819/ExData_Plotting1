household <- read.table("household_power_consumption.txt", sep = ";", 
                      header = TRUE, stringsAsFactors = FALSE,
                      na.strings = "?")
idx <- with(household, which(Date == "1/2/2007" | Date == "2/2/2007"))
x <- household[idx, ]
x$Time <- strptime(paste(x$Date, x$Time), format = "%d/%m/%Y %T")

png("plot3.png")
plot(x$Time, x$Sub_metering_1, type = "l", ylab = "Energy sub metering",
     xlab = "")
lines(x$Time, x$Sub_metering_2, type = "l", col = "red")
lines(x$Time, x$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()