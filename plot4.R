setwd("D:/Usuarios/Ivana/Desktop/Ivana/Coursera/Exploratory Data Analysis/Week1/Project1")
hpc <- read.table("household_power_consumption.txt", sep=";", head=TRUE)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc2 <- subset(hpc, Date=="2007-02-01" | Date=="2007-02-02")
hpc2$datetime <- paste(hpc2$Date, hpc2$Time)
hpc2$datetime <- strptime(hpc2$datetime, "%Y-%m-%d %H:%M:%S")

hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))
hpc2$Voltage <- as.numeric(as.character(hpc2$Voltage))
hpc2$Global_reactive_power <- as.numeric(as.character(hpc2$Global_reactive_power))

png("plot4.png")
par(mfrow = c(2, 2))
plot(hpc2$datetime, hpc2$Global_active_power, ylab="Global Active Power", xlab="", type="l")
plot(hpc2$datetime, hpc2$Voltage, ylab="Voltage", type="l", xlab="datetime")
plot(hpc2$datetime, hpc2$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(hpc2$datetime, hpc2$Sub_metering_2, col="red")
lines(hpc2$datetime, hpc2$Sub_metering_3, col="blue")
legend("topright", lty = 1, bty="n", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpc2$datetime, hpc2$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")


dev.off()
