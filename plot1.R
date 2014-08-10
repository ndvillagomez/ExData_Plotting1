## Make sure to set working directory to unzipped folder 
## for UCI Individual household electric power consumption Data Set
## located at: 
## https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip

## you'll need to make sure to install chron package in R studio

library(chron)
file <-"./ExData_Plotting1/ExData_Plotting1/household_power_consumption.txt"
setClass('myDate')
setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y"))
setClass('myTime')
setAs("character", "myTime", function(from) times(from))
data <- read.table(file, header=TRUE,
        colClasses = c("myDate","myTime", "numeric",
                        "numeric", "numeric", "numeric",
                        "numeric", "numeric", "numeric"),
        sep=";", na.strings="?")
data2<-data[data$Date=="2007-02-01",]
data3<-data[data$Date=="2007-02-02",]
data4<-rbind(data2, data3)
par(cex=0.8)
png(file="plot1.png")
hist(data5$Global_active_power, col="red", 
     xlab="GLobal Active Power (kilowatts", 
     main = "Global Active Power", breaks=12)
dev.off()


