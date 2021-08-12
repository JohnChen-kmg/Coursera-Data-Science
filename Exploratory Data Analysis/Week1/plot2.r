data <- read.table("household_power_consumption.txt", skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power",
                 "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                 "Sub_metering_3")
data1 <- subset(data, data$Date=="1/2/2007" | data$Date =="2/2/2007")


data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Time <- strptime(data1$Time, format="%H:%M:%S")
data1[1:1440,"Time"] <- format(data1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data1[1441:2880,"Time"] <- format(data1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


png("plot2.png", width=480, height=480)
plot(y = data1$Global_active_power, x = data1$Time, type = "l", 
     ylab = "Global Active Power(kilowatts)",
     xlab = "")
dev.off()

