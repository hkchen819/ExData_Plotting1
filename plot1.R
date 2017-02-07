household <- read.table("household_power_consumption.txt", sep = ";", 
                      header = TRUE, stringsAsFactors = FALSE,
                      na.strings = "?")
idx <- with(household, which(Date == "1/2/2007" | Date == "2/2/2007"))
x <- household[idx, ]
png(filename = "plot1.png")
hist(as.numeric(x$Global_active_power), main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
     ylim = c(0, 1200), col = "red")
dev.off()