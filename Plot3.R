#Readind and subsetting
household <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")
dim(household)
House1 <- subset(household, household$Date=="1/2/2007" | household$Date =="2/2/2007")

# Date and Time
House1$Date <- as.Date(House1$Date, format="%d/%m/%Y")
House1$Time <- strptime(House1$Time, format="%H:%M:%S")
House1[1:1440,"Time"] <- format(House1[1:1440,"Time"],"2007-02-01 %H:%M:%S")
House1[1441:2880,"Time"] <- format(House1[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# Plot 3
plot(House1$Time,House1$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(House1,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(House1,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(House1,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")

# Saving as PNG
dev.copy(png,filename="~/Desktop/plot3.png", width = 480, height = 480)
dev.off()
