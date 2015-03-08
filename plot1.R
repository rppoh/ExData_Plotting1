rm(list=ls())
setwd("C:/R/figures")


# Loading and preprocessing the data
file <- "C:/R/household_power_consumption.txt"
tabAll <- read.table(file, header = T, sep = ";", na.strings = "?")

pwr_cnsmpt <- tabAll[tabAll$Date %in% c("1/2/2007","2/2/2007"),]
rm(tabAll)
pwr_cnsmpt$datetime <- strptime( paste(pwr_cnsmpt$Date, pwr_cnsmpt$Time),
                                 "%d/%m/%Y %H:%M:%S")

### 1

png(filename = "plot1.png", width = 480, height = 480)

hist(pwr_cnsmpt$Global_active_power, col = "red", main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()

