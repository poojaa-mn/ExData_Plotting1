#Read the data from the text file
data<-read.table("./household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, dec=".",header = TRUE)

#Subset the data to get data only for required dates
sub_data<-subset(data,Date %in% c("1/2/2007","2/2/2007"))

#change the class of required columns to their correct class
sub_data$Date<-as.Date(sub_data$Date,format="%d/%m/%Y")
sub_data$Global_active_power<-as.numeric(sub_data$Global_active_power)

#Merge date and time into one column
datetime<-paste(as.Date(sub_data$Date),sub_data$Time)
date__time<-as.POSIXct(datetime)
sub_data<-cbind(sub_data,date__time)

#save the plot
png("plot2.png",width=480,height=480)
plot(sub_data$Global_active_power~sub_data$date__time ,type="l",ylab="Global Active Power (kilowatts)",xlab=" " )
dev.off()