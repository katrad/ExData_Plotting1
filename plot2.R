#Read data file
data <- read.csv("household_power_consumption.txt",sep=";",dec=".",header=TRUE,stringsAsFactors=FALSE)
#Subset data based on date range we need for this
sdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
#Convert the character to numeric value
gApower <- as.numeric(sdata$Global_active_power)
#Concatenate date and time for plot
dateAndtime <- strptime(paste(sdata$Date, sdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Specify device and size of the png
png("plot2.png", width=480, height=480)
#Plot the data
plot(dateAndtime, gApower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#Close the device
dev.off()
