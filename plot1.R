library(data.table)
library(lubridate)
library(dplyr)
setwd("D:\\Aprendizaje Coursera\\Exploratory Analisys in R")
base<-fread("household_power_consumption.txt", 
            dec = ".", na.strings="?",
            header = T, sep = ";")

base$Date=dmy(base$Date)
base = base %>% filter(Date >= "2007-02-01" & Date <= "2007-02-02")


png("plot1.png", width=480, height=480)
with(base, hist(Global_active_power, col="red",
                xlab="Global Active Power (kilowatts)",
                main="Global Active Power"))

dev.off()

