##Read Data###

consumption <- read.table("household_power_consumption.txt",skip=1,sep=";")

### Create sub-group
names(consumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Consumption_Per_Month <- subset(consumption, Date=="1/2/2007" | Date =="2/2/2007")


#calling the basic plot function
globalActivePower <- as.numeric(Consumption_Per_Month$Global_active_power)
png("plot1.png", width=480, height=480)
##hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
hist(globalActivePower,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
# annotating graph
#title(main="Global Active Power")
dev.off()