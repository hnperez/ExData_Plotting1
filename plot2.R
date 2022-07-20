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

png("plot2.png", width=480, height=480)
Sys.setlocale("LC_TIME", "English")
with(base, plot(datetime,Global_active_power,
                 type = "l",xlab="", 
                ylab = "Global Active Power (kilowatts)"))
dev.off()
