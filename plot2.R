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

#plot 2: timeline
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(hpc_subset$Time, hpc_subset$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off() 