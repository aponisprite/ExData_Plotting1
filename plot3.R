# Load data
d <- read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"))

# Get just the 2 days we care about and free up memory
d2 <- rbind(d[d$Date == "1/2/2007",], d[d$Date == "2/2/2007",])
rm(d)

# Create a date/time field
d2$Date <- as.Date(d2$Date, "%d/%m/%Y")
d2$DateTime <- paste(d2$Date, d2$Time)
d2$DateTime <- as.POSIXct(strptime(d2$DateTime, "%Y-%m-%d %H:%M:%S"))

# Create and save a red histogram of Global Active Power
png(filename="plot3.png", width=480, height=480)
par(mar=c(5,5,4,2))
plot(d2$DateTime, d2$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(d2$DateTime, d2$Sub_metering_1, col="black")
lines(d2$DateTime, d2$Sub_metering_2, col="red")
lines(d2$DateTime, d2$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c("solid", "solid", "solid"))
dev.off()