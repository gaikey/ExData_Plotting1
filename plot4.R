## Load Data
## Included in Every Plot for Independence but only needs to be run once a session

hpc_all <- read.table(file="household_power_consumption.txt", sep=";", dec=".",header=TRUE,na.strings="?")
hpc <- subset(hpc_all, Date=="1/2/2007" | Date=="2/2/2007")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")


## Plot 4

par(mfcol = c(2,2))
par(mar = c(4, 4.1, 2.5, 2.1))
plot(hpc$DateTime, hpc$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
plot(hpc$DateTime, hpc$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
lines(hpc$DateTime, hpc$Sub_metering_1, type="l", col="black")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, col = c("black","red","blue"), inset = 0.075, cex = 0.64, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
plot(hpc$DateTime, hpc$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
plot(hpc$DateTime, hpc$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")
dev.copy(png, file = "plot4.png")
dev.off()