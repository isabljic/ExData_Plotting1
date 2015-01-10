setwd("D:/Usuarios/Ivana/Desktop/Ivana/Coursera/Exploratory Data Analysis/Week1/Project1")
hpc <- read.table("household_power_consumption.txt", sep=";", head=TRUE)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

hpc2 <- subset(hpc, Date=="2007-02-01" | Date=="2007-02-02")

hpc2$datetime <- paste(hpc2$Date, hpc2$Time)

hpc2$datetime <- strptime(hpc2$datetime, "%Y-%m-%d %H:%M:%S")

hpc2$Global_active_power <- as.numeric(as.character(hpc2$Global_active_power))

#plot1

png("plot1.png")
hist(hpc2$Global_active_power, col="red", main="Global Active Power", 
xlab="Global Active Power (kilowatts)", breaks=13)

dev.off()
