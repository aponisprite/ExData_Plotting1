# Load data
d <- read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"))

# Get just the 2 days we care about and free up memory
d2 <- rbind(d[d$Date == "1/2/2007",], d[d$Date == "2/2/2007",])
rm(d)

# Create a date/time field
d2$Date <- as.Date(d2$Date, "%d/%m/%Y")
d2$DateTime <- paste(d2$Date, d2$Time)
d2$DateTime <- as.POSIXct(strptime(d2$DateTime, "%Y-%m-%d %H:%M:%S"))

# Create and save an x-y line plot of time vs. Global active power
png(filename="plot2.png", width=480, height=480)
par(mar=c(5,5,4,2))
plot(d2$DateTime, d2$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(d2$DateTime, d2$Global_active_power)
dev.off()