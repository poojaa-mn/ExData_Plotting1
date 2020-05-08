#Read the data from the text file
data<-read.table("./household_power_consumption.txt",sep=";",stringsAsFactors = FALSE, dec=".",header = TRUE)

#Subset the data to get data only for required dates
sub_data<-subset(data,Date=="2007-02-01" | Date == "2007-02-02")

#change the class required columns to their correct class
sub_data$Date<-as.Date(sub_data$Date,format="%d/%m/%Y")
sub_data$Global_active_power<-as.numeric(sub_data$Global_active_power)

#Save the plot
png("plot1.png",width=480,height=480)
hist(sub_data$Global_active_power,col="red",main="Global Active Power",ylim=c(0,1200),xlab="Global Active Power(kilowatts")
dev.off()
