rm(list=ls())
setwd("C:/R/figures")


# Loading and preprocessing the data
file <- "C:/R/household_power_consumption.txt"
tabAll <- read.table(file, header = T, sep = ";", na.strings = "?")

pwr_cnsmpt <- tabAll[tabAll$Date %in% c("1/2/2007","2/2/2007"),]
rm(tabAll)
pwr_cnsmpt$datetime <- strptime( paste(pwr_cnsmpt$Date, pwr_cnsmpt$Time),
                                 "%d/%m/%Y %H:%M:%S")




### 2

png(filename = "plot2.png", width = 480, height = 480)

plot(pwr_cnsmpt$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xaxt = "n", xlab = "")
axis(1, c(1, 1440, 2880), c("Thu","Fri","Sat"))

dev.off()
