library(data.table)
library(lubridate)
library(dplyr)
setwd("D:\\Aprendizaje Coursera\\Exploratory Analisys in R")
base<-fread("household_power_consumption.txt", 
            dec = ".", na.strings="?",
            header = T, sep = ";")

Sys.setlocale("LC_TIME", "English")
base$Date=dmy(base$Date)
base = base %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")

#changing format of Date and Time
base$datetime<-ymd_hms(paste(base$Date, base$Time))

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

#top lef plot
with(base, plot(datetime,Global_active_power,
                type = "l", ylab = "Global Active Power (kilowatts)"))

#top rigth plot
with(base, plot(datetime,Voltage,
                type = "l", ylab = "Voltage"))

#bottom lef plot

with(base, plot(datetime,Sub_metering_1,
                type = "l", ylab = "Energy sub metering"))

with(base, lines(datetime,Sub_metering_2, col="red"))
with(base, lines(datetime,Sub_metering_3, col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1, lwd=2.5, col=c("black", "red", "blue"))

#bottom rigth plot
with(base, plot(datetime,Global_reactive_power,
                type = "l", ylab = "Global_reactive_power"))

dev.off()
