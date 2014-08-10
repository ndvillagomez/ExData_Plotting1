## Make sure to set working directory to unzipped folder 
## for UCI Individual household electric power consumption Data Set
## located at: 
## https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip

## you'll need to make sure to install chron package in R studio

##library(chron)
file <-"./ExData_Plotting1/ExData_Plotting1/household_power_consumption.txt"
setClass('myDate')
setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))
##setClass('myTime')
##setAs("character", "myTime", function(from) times(from))
data <- read.table(file, header=TRUE,
                   colClasses = c("myDate","character", "numeric",
                                  "numeric", "numeric", "numeric",
                                  "numeric", "numeric", "numeric"),
                   sep=";", na.strings="?")
data2<-data[data$Date=="2007-02-01",]
data3<-data[data$Date=="2007-02-02",]
data4<-rbind(data2, data3)
data4$Date<-strptime(paste(data4$Date,data4$Time), "%Y-%m-%d %H:%M:%S")

png(file="plot4.png")
par(cex=0.2, mfcol=c(2,2), mar=c(4,4,3,3))

plot(data4$Date, data4$Global_active_power, xlab="", ylab="Global Active Power", type="l")

plot(data4$Date, data4$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data4$Date, data4$Sub_metering_1)
lines(data4$Date, data4$Sub_metering_2, col="red")
lines(data4$Date, data4$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), lwd(2.5, 2.5, 2.5), col=c("black", "red", "blue"),bty="n")

plot(data4$Date, data4$Voltage, xlab="datetime", ylab="Voltage", type="l")

plot(data4$Date, data4$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()

