#Reading the data from source file from working directory
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Converting Date column into Date format
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

#Subsetting the data between dates Feb 1 to Feb 2
hpc<-subset(hpc,hpc$Date>=("2007-02-01") & hpc$Date < ("2007-02-03"))

#Merging Date and Time column and adding to table
dateTime<-paste(hpc$Date, hpc$Time)
hpc<-cbind(dateTime, hpc)

#Formating the dateTime column into required POSIXct format
hpc$dateTime<-as.POSIXct(dateTime)

#Creating png device
png("plot4.png")

#Defining parameters for the plot
par(mfrow=c(2,2),mar=c(4,4,4,1))

#Plotting
with(hpc,{
  plot(Global_active_power~dateTime,ylab="Global Active Power (killowats)",type='l',xlab="")
  plot(Voltage~dateTime,ylab="Voltage",type='l')
  plot(Sub_metering_1~dateTime, type="l",ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~dateTime,col='Red')
  lines(Sub_metering_3~dateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~dateTime, type="l") })

#Shuting off the png device
dev.off()