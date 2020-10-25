##Read Data###
consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")

### Create sub-group
names(consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Consumption_Per_Month <- subset(consumption, Date=="1/2/2007" | Date =="2/2/2007")

#convert to numeric data
convert_Data <- strptime(paste(Consumption_Per_Month$Date, Consumption_Per_Month$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(Consumption_Per_Month$Global_active_power)
subMetering1 <- as.numeric(Consumption_Per_Month$Sub_metering_1)
subMetering2 <- as.numeric(Consumption_Per_Month$Sub_metering_2)
subMetering3 <- as.numeric(Consumption_Per_Month$Sub_metering_3)

#Create Plot

png("plot3.png", width=480, height=480)
plot(convert_Data, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(convert_Data, subMetering2, type="l", col="red")
lines(convert_Data, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

##close Device
dev.off()