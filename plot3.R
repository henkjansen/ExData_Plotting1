dataset <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors=FALSE)

# add DateTime column with date and time
dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")

# convert Date column to Date type
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

# select dates 2007-2-1 and 2007-2-2
dataset <- dataset[dataset$Date == as.Date("2007-2-1") | dataset$Date == as.Date("2007-2-2"),]

# convert submetering columns to numeric
dataset$Sub_metering_1 <- as.numeric(dataset$Sub_metering_1)
dataset$Sub_metering_2 <- as.numeric(dataset$Sub_metering_2)
dataset$Sub_metering_3 <- as.numeric(dataset$Sub_metering_3)

# plot
png("plot3.png")

plot(dataset$DateTime, dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")

lines(dataset$DateTime, dataset$Sub_metering_2, col="red")

lines(dataset$DateTime, dataset$Sub_metering_3, col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

dev.off()
