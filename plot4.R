#plot4

data<-read.table("household_power_consumption.txt",sep=";",header = TRUE)

data$Global_active_power<-as.numeric(data$Global_active_power)
data$Date<-as.character(data$Date)

data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Voltage<-as.numeric(data$Voltage)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)


data$Date_new<-as.Date(data$Date,format="%d/%m/%Y")
data$Time_new<-strptime(data$Time,format="%H:%M:%S")
data$Time_new<-format(data$Time_new,format="%H:%M:%S")
data$Date_time<-strptime(paste(data$Time_new,data$Date_new),format ="%H:%M:%S %Y-%m-%d" )
data$wk_data<-wday(data$Date_new,label = TRUE)

sub_two_days<-subset(data,select=c(Voltage,Global_reactive_power,Date_time,Sub_metering_1,Sub_metering_2,Sub_metering_3,Global_active_power),Date_new>=as.Date("2007-01-04") & Date_new <=("2007-01-5"))

png(file="plot4.png",width=800,height=600)
par(mfrow=c(2,2))
with(sub_two_days,plot(Date_time,Global_active_power,type="l",xlab="Week day",ylab="Global Active Power (kilowatts"))
with(sub_two_days,plot(Date_time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
lines(sub_two_days$Date_time,sub_two_days$Sub_metering_1)
lines(sub_two_days$Date_time,sub_two_days$Sub_metering_2,col="blue")
lines(sub_two_days$Date_time,sub_two_days$Sub_metering_3,col="red")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","blue","red"),lwd=1)

with(sub_two_days,plot(Date_time,Global_reactive_power,type="l",xlab="Week day",ylab="Global Reactive Power"))
with(sub_two_days,plot(Date_time,Voltage,type="l",xlab="Week day",ylab="Voltage"))
dev.off()