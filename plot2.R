#Make sure that the dataset is in the working directory.

#Loading the dataset
data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",
                   colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?")

#Subsetting the data
data <- subset(data, data[,1]=="1/2/2007" | data[,1]=="2/2/2007")

#Creating the vector containing the date and time combo
date_time=strptime(paste(data$Date," ",data$Time), "%d/%m/%Y %H:%M:%S")

#Plotting the graph
plot(date_time,data$Global_active_power,xlab="",type="n", ylab="Global Active Power (kilowatts)")
lines(date_time,data$Global_active_power)

#Creation of the PNG file
dev.copy(png,'plot2.png')
dev.off()