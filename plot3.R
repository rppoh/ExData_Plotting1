rm(list=ls())
setwd("C:/R/figures")


# Loading and preprocessing the data
file <- "C:/R/household_power_consumption.txt"
tabAll <- read.table(file, header = T, sep = ";", na.strings = "?")

pwr_cnsmpt <- tabAll[tabAll$Date %in% c("1/2/2007","2/2/2007"),]
rm(tabAll)
pwr_cnsmpt$datetime <- strptime( paste(pwr_cnsmpt$Date, pwr_cnsmpt$Time),
                                 "%d/%m/%Y %H:%M:%S")


### 3

png(filename = "plot3.png", width = 480, height = 480)

plot(pwr_cnsmpt$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xaxt = "n", xlab = "")
lines(pwr_cnsmpt$Sub_metering_2, col = "red")
lines(pwr_cnsmpt$Sub_metering_3, col = "blue")
axis(1, c(1, 1440, 2880), c("Thu","Fri","Sat"))
legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red","blue"))

dev.off()

