##Exploratory data analysis August 2015 Assignment 1
##Andreas Kuebart

fileURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"Dataset.zip", mode="wb")
unzip("Dataset.zip")
household_power_consumption <- read.csv("C:/Users/AK/Desktop/cloud/SkyDrive/Uni/COursera/Exp Data Ana/Assignment_1/household_power_consumption.txt", sep=";", na.strings="?")
#Subset dates for analysis 2007-02-01 and 2007-02-02
hpc_subset <- subset (household_power_consumption, household_power_consumption$Date == "1/2/2007"| household_power_consumption$Date =="2/2/2007")

#Convert time into POSIXlt and remove [double] date column
hpc_subset$Time<- strptime(paste(hpc_subset$Date,hpc_subset$Time),format="%d/%m/%Y %H:%M:%S")
hpc_subset<-hpc_subset[,-1]

#plot 4: 4 plots in one
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
plot(hpc_subset$Time, hpc_subset$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(hpc_subset$Time, hpc_subset$Voltage, type="l",xlab="datetime",ylab="Voltage")
plot(hpc_subset$Time, hpc_subset$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(hpc_subset$Time,hpc_subset$Sub_metering_2, col="red")
lines(hpc_subset$Time,hpc_subset$Sub_metering_3, col="blue")
legend("topleft",lty=1, col = c("black","blue", "red"), legend = c("Sub metering 1","Sub metering 2", "Sub metering 3"),bty="n")
plot(hpc_subset$Time, hpc_subset$Global_reactive_power, type="l",xlab="datetime",ylab="Global Reactive Power")
dev.off()