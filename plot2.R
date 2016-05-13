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

#plot #1
#P1Data<-as.numeric(KeyDays$Global_active_power)
#hist(P1Data,col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")
#dev.copy(png,"p1.png")
#dev.off()

#plot #2
plot(KeyDays$NewTime, KeyDays$Global_active_power, type ="l", ylab="Global Active Power(kilowatts)", xlab = "")
dev.copy(png,"p2.png")
dev.off()
