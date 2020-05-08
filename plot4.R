#Read the data from the text file
data<-read.table("./household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, dec=".",header = TRUE)

#Subset the data to get data only for required dates
sub_data<-subset(data,Date %in% c("1/2/2007","2/2/2007"))

#change the class of required columns to their correct class
sub_data$Global_active_power<-as.numeric(sub_data$Global_active_power)
sub_data$Global_reactive_power<-as.numeric(sub_data$Global_reactive_power)
sub_data$Voltage<-as.numeric(sub_data$Voltage)
sub_data$Sub_metering_1<-as.numeric(sub_data$Sub_metering_1)
sub_data$Sub_metering_2<-as.numeric(sub_data$Sub_metering_2)
sub_data$Sub_metering_3<-as.numeric(sub_data$Sub_metering_3)
sub_data$Date<-as.Date(sub_data$Date,format="%d/%m/%Y")

#Merge date and time into one column
datetime<-paste(as.Date(sub_data$Date),sub_data$Time)
date__time<-as.POSIXct(datetime)
sub_data<-cbind(sub_data,date__time)

#save the plot
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))
with(sub_data,{
        plot(Global_active_power~date__time,type="l",ylab="Global Active Power (kilowatts)",xlab=" " )
        plot(Voltage ~ date__time,type="l",ylab="Voltage(volt)",xlab="")
        plot(sub_data$Sub_metering_1~sub_data$date__time,type="l",ylab="Energy sub metering",xlab="")
        lines(sub_data$Sub_metering_2~sub_data$date__time,col="red")
        lines(sub_data$Sub_metering_3~sub_data$date__time,col="blue")
        legend("topright",col=c("black","red","blue"),lty=1,lwd=2,cex=0.8,bty="n",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(Global_reactive_power~date__time,type="l",ylab="Global Reactive Power (kilowatts)",xlab=" " )
        
})
dev.off()