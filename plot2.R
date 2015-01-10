setwd("D:/Usuarios/Ivana/Desktop/Ivana/Coursera/Exploratory Data Analysis/Week1/Project1")
hpc <- read.table("household_power_consumption.txt", sep=";", head=TRUE)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc2 <- subset(hpc, Date=="2007-02-01" | Date=="2007-02-02")

hpc2$datetime <- paste(hpc2$Date, hpc2$Time)

hpc2$datetime <- strptime(hpc2$datetime, "%Y-%m-%d %H:%M:%S")

hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))

#plot2
Sys.setlocale(category = "LC_TIME", locale = "C")
png("plot2.png")
plot(hpc2$datetime, hpc2$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()
