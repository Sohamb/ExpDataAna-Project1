##The plot is created directly in PNG. There is some rendering problem with legend() causing the
##plot to be haphazard.


#Make sure that the dataset is in the working directory.

#Loading the dataset
data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",
                   colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?")

#Subsetting the data
data <- subset(data, data[,1]=="1/2/2007" | data[,1]=="2/2/2007")

#Creating the vector containing the date and time combo
date_time=strptime(paste(data$Date," ",data$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png")
#Allowing the creation of multile plots in single display
par(mfcol=c(2,2))

#The First Plot
plot(date_time,data$Global_active_power,xlab="",type="n", ylab="Global Active Power (kilowatts)")
lines(date_time,data$Global_active_power)

#The Second Plot
plot(date_time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(date_time,data$Sub_metering_1,col="black")
lines(date_time,data$Sub_metering_2,col="red")
lines(date_time,data$Sub_metering_3,col="blue")
legend("topright",pch=NA,col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering2","Sub_metering3"),lwd = 1)

#The Third Plot
plot(date_time,data$Voltage,type="n",xlab="datetime",ylab="Voltage")
lines(date_time,data$Voltage)

#The Fourth Plot
plot(date_time,data$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(date_time,data$Global_reactive_power)

#Creation of the PNG file
#dev.copy(png,'plot4.png')
dev.off()