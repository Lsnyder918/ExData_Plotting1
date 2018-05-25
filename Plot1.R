## Plot #1

powerConsumption <- read.table("household_power_consumption.txt", skip = 1, sep = ";")

#renaming variables based on instructions

names(powerConsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#subset the power consumption data

power <- subset(powerConsumption, powerConsumption$Date == "1/2/2007" | powerConsumption$Date == "2/2/2007")

#create a histogram by calling hist function

hist(as.numeric(as.character(power$Global_active_power)), col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")

#write plot to png

png(filename = "Plot1.png", width = 480, height = 480)

#turn off graphics device

dev.off()

