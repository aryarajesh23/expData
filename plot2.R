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
png("plot2.png")

#Plotting
plot(hpc$Global_active_power~hpc$dateTime,ylab="Global Active Power (killowats)",type='l',xlab="")

#Shuting off the png device
dev.off()