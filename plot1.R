#Reading the data from source file from working directory
hpc<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Converting Date column into Date format
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")

#Subsetting the data between dates Feb 1 to Feb 2
hpc<-subset(hpc,hpc$Date>=("2007-02-01") & hpc$Date < ("2007-02-03"))

#Creating png device
png("plot1.png")

#Plotting histogram
hist(hpc$Global_active_power,main="Global Active Power", xlab="Global Active Power (killowats)",col="red")

#Shuting off the png device
dev.off()