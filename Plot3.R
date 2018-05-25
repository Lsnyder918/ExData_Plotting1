## Plot #3

#write plot to png

png(filename = "Plot3.png", width = 480, height = 480)

#read data

powerConsumption <- read.table("household_power_consumption.txt", skip = 1, sep = ";")

#renaming variables based on instructions

names(powerConsumption) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#subset the power consumption data

power <- subset(powerConsumption, powerConsumption$Date == "1/2/2007" | powerConsumption$Date == "2/2/2007")

#changing the Date and Time variables into objects 

power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power$Time <- strptime(power$Time, format = "%H:%M:%S")
power[1:1440, "Time"] <- format(power[1:1440, "Time"], "2007-02-01 %H:%M:%S")
power[1441:2880, "Time"] <- format(power[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

#create a plot using the plot function

plot(power$Time, power$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")
with(power, lines(Time, as.numeric(as.character(Sub_metering_1))))
with(power, lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))
with(power, lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))

#add a legend

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#turn off graphics device

dev.off()