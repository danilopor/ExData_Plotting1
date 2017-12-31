#Readind and subsetting
household <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")
dim(household)
House1 <- subset(household, household$Date=="1/2/2007" | household$Date =="2/2/2007")

# Date and Time
House1$Date <- as.Date(House1$Date, format="%d/%m/%Y")
House1$Time <- strptime(House1$Time, format="%H:%M:%S")
House1[1:1440,"Time"] <- format(House1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
House1[1441:2880,"Time"] <- format(House1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plot 2
plot(House1$Time,as.numeric(as.character(House1$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power and Time")

# Saving as PNG
dev.copy(png,filename="~/Desktop/plot2.png", width = 480, height = 480)
dev.off()
