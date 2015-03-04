dataset <- read.csv("household_power_consumption.txt", sep=';', stringsAsFactors=FALSE)

# convert Date column to Date type
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

# select dates 2007-2-1 and 2007-2-2
dataset <- dataset[dataset$Date == as.Date("2007-2-1") | dataset$Date == as.Date("2007-2-2"),]

# convert column Global_active_power to numeric
dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

png("plot1.png")

hist(dataset$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

axis(1, seq(0, 6, 2))

dev.off()
