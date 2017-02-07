household <- read.table("household_power_consumption.txt", sep = ";", 
                      header = TRUE, stringsAsFactors = FALSE,
                      na.strings = "?")
idx <- with(household, which(Date == "1/2/2007" | Date == "2/2/2007"))
x <- household[idx, ]
png(filename = "plot2.png")
x$Time <- strptime(paste(x$Date, x$Time), format = "%d/%m/%Y %T")
with(x, plot(Time, Global_active_power, type = "l", xlab = "",
             ylab = "Global Active Power (kilowatts)"))
dev.off()