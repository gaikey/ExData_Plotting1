## Load Data
## Included in Every Plot for Independence but only needs to be run once a session

hpc_all <- read.table(file="household_power_consumption.txt", sep=";", dec=".",header=TRUE,na.strings="?")
hpc <- subset(hpc_all, Date=="1/2/2007" | Date=="2/2/2007")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

## Plot 3

png(file = "plot3.png", width=480, height=480)
plot(hpc$DateTime, hpc$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="n")
lines(hpc$DateTime, hpc$Sub_metering_1, type="l", col="black")
lines(hpc$DateTime, hpc$Sub_metering_2, type="l", col="red")
lines(hpc$DateTime, hpc$Sub_metering_3, type="l", col="blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
