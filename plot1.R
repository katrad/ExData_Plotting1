#Read data file
data <- read.csv("household_power_consumption.txt",sep=";",dec=".",header=TRUE,stringsAsFactors=FALSE)
#Subset data based on date range we need for this
sdata <- subset(data,data$Date=="1/2/2007" | data$Date=="2/2/2007")
#Convert the character to numeric value
gApower <- as.numeric(sdata$Global_active_power)
#Specify device and size of the png
png("plot1.png", width=480, height=480)
#Plot the data
hist(gApower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#Close the device
dev.off()
