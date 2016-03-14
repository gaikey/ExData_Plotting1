## Load Data
## Included in Every Plot for Independence but only needs to be run once a session

hpc_all <- read.table(file="household_power_consumption.txt", sep=";", dec=".",header=TRUE,na.strings="?")
hpc <- subset(hpc_all, Date=="1/2/2007" | Date=="2/2/2007")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")


## Plot 1

png(file = "plot1.png", width=480, height=480)
hist(hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()