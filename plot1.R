# Load data
d <- read.csv("household_power_consumption.txt", sep=";", na.strings=c("?"))

# Get just the 2 days we care about and free up memory
d2 <- rbind(d[d$Date == "1/2/2007",], d[d$Date == "2/2/2007",])
rm(d)

# Create a date/time field
d2$Date <- as.Date(d2$Date, "%d/%m/%Y")
d2$DateTime <- strptime(paste(d2$Date2, d2$Time), "%Y-%m-%d %H:%M:%S")

# Create and save a red histogram of Global Active Power
png(filename="plot1.png", width=480, height=480)
par(mar=c(7,5,4,2))
hist(d2$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", main="Global Active Power")
dev.off()