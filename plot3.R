#Read data file
data <- read.csv("household_power_consumption.txt",sep=";",dec=".",header=TRUE,stringsAsFactors=FALSE)
#Subset data based on date range we need for this
sdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
#Convert the character to numeric value
gApower <- as.numeric(sdata$Global_active_power)
subMeter1 <- as.numeric(sdata$Sub_metering_1)
subMeter2 <- as.numeric(sdata$Sub_metering_2)
subMeter3 <- as.numeric(sdata$Sub_metering_3)
#Concatenate date and time for plot
dateAndtime <- strptime(paste(sdata$Date, sdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Specify device and size of the png
png("plot3.png", width=480, height=480)
#Plot the data
plot(dateAndtime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
#Add additional lines to the graph
lines(dateAndtime, subMeter2, type="l", col="red")
lines(dateAndtime, subMeter3, type="l", col="blue")
#Add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#Close the device
dev.off()
