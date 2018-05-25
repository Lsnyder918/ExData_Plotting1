## Plot #4

#write plot to png

png(filename = "Plot4.png", width = 480, height = 480)

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

#setting up the composite plot in a 2x2 orientation

par(mfrow = c(2, 2))

#create plots using the plot function 

with(power, {
  #plot 1
  plot(power$Time, as.numeric(as.character(power$Global_active_power)), type = "l", xlab = " ", ylab = "Global Active Power")
  #plot 2
  plot(power$Time, as.numeric(as.character(power$Voltage)), type = "l", xlab = "dateline", ylab = "Voltage")
  #plot 3
  plot(power$Time, power$Sub_metering_1, type = "n", xlab = " ", ylab = "Energy sub metering")
    with(power, lines(Time, as.numeric(as.character(Sub_metering_1))))
    with(power, lines(Time, as.numeric(as.character(Sub_metering_2)), col = "red"))
    with (power, lines(Time, as.numeric(as.character(Sub_metering_3)), col = "blue"))
          legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.6)
  #plot 4
  plot(power$Time, as.numeric(as.character(power$Global_reactive_power)), type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  })

#turn off graphics device

dev.off()