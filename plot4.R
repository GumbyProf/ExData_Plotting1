#Course project 1
#Make graphs to explain it all.

#Do I need these packages?
library("tidyr", lib.loc="~/R/win-library/3.2")
library("dplyr", lib.loc="~/R/win-library/3.2")

#Download the file, unzip, read into R.
powerURL<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(powerURL, destfile="powerdata.zip")
unzip("powerdata.zip")
powerdata <- read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
#subset the data to key only the two dates of interest
KeyDays<-subset(powerdata, Date == "1/2/2007"|Date == "2/2/2007")
#combine the date and time into a nice column.
NewTime<-paste(KeyDays$Date, KeyDays$Time)
KeyDays$NewTime<-strptime(NewTime, format="%d/%m/%Y %H:%M:%S")

#set up for multiple plots, going down by column
par(mfcol=c(2,2), mar=c(4,4,4,4))

#plot #1 - not needed
#P1Data<-as.numeric(KeyDays$Global_active_power)
#hist(P1Data,col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

#plot #2 - upperleft
plot(KeyDays$NewTime, KeyDays$Global_active_power, type ="l", ylab="Global Active Power", xlab = "")

#plot #3 - lower left
plot(KeyDays$NewTime, KeyDays$Sub_metering_1, type ="l", ylab="Energy sub metering", xlab = "")
      lines(KeyDays$NewTime, KeyDays$Sub_metering_2, type ="l", col="Red")
      lines(KeyDays$NewTime, KeyDays$Sub_metering_3, type ="l", col="BLUE")
      legend("topright", null, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1), col=c("black","blue","red"),  pt.cex=1.3, cex=.3)

#plot #upperright
plot(KeyDays$NewTime, KeyDays$Voltage, ylab="Voltage", type ="l", xlab = "datetime")

#plot #lowerleft
plot(KeyDays$NewTime, KeyDays$Global_reactive_power, type ="l", ylab="Global_reactive_power", xlab = "datetime")


dev.copy(png,"p4.png")
dev.off()
