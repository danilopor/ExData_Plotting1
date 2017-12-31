#Readind and subsetting
household <- read.csv("~/Desktop/household_power_consumption.txt", sep=";")
dim(household)
House1 <- subset(household, household$Date=="1/2/2007" | household$Date =="2/2/2007")

# Plot 1
hist(as.numeric(as.character(House1$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
title(main="Global Active Power")

# Saving as PNG
dev.copy(png,filename="~/Desktop/plot1.png", width = 480, height = 480)
dev.off()
