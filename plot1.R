#Make sure that the dataset is in the working directory.

#Loading the data set
data <- read.table("household_power_consumption.txt",header = TRUE,sep=";",
colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),na.strings="?")

#Subsetting the data
data <- subset(data, data[,1]=="1/2/2007" | data[,1]=="2/2/2007")



#Plotting the graph
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")

#Creation of the PNG file
dev.copy(png,'plot1.png')
dev.off()
