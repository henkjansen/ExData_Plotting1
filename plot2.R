dataset <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors=FALSE)

# add DateTime column with date and time
dataset$DateTime <- strptime(paste(dataset$Date, dataset$Time), "%d/%m/%Y %H:%M:%S")

# convert Date column to Date type
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

# select dates 2007-2-1 and 2007-2-2
dataset <- dataset[dataset$Date == as.Date("2007-2-1") | dataset$Date == as.Date("2007-2-2"),]

# convert column Global_active_power to numeric
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

# plot
png("plot2.png")

plot(dataset$DateTime, dataset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")

dev.off()
