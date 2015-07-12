#Make sure that the dataset is in the working directory.

#Loading the dataset
data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",
                   colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?")

#Subsetting the data
data <- subset(data, data[,1]=="1/2/2007" | data[,1]=="2/2/2007")

#Creating the vector containing the date and time combo
date_time=strptime(paste(data$Date," ",data$Time), "%d/%m/%Y %H:%M:%S")

#Plotting the graph
plot(date_time,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(date_time,data$Sub_metering_1,col="black")
lines(date_time,data$Sub_metering_2,col="red")
lines(date_time,data$Sub_metering_3,col="blue")
legend("topright",pch=NA,col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering2","Sub_metering3"),lwd=1)


#Creation of the PNG file
dev.copy(png,'plot3.png')
dev.off()