#plot2


data<-read.table("household_power_consumption.txt",sep=";",header = TRUE)

data$Global_active_power<-as.numeric(data$Global_active_power)
data$Date<-as.character(data$Date)
data$Date_new<-as.Date(data$Date,format="%d/%m/%Y")
data$Time_new<-strptime(data$Time,format="%H:%M:%S")
data$Time_new<-format(data$Time_new,format="%H:%M:%S")
data$Date_time<-strptime(paste(data$Time_new,data$Date_new),format ="%H:%M:%S %Y-%m-%d" )
data$wk_data<-wday(data$Date_new,label = TRUE)


sub_two_days<-subset(data,Date_new>=as.Date("2007-01-04") & Date_new <=("2007-01-5"))

png(file="plot2.png",width=800,height=600)
with(sub_two_days,plot(Date_time,Global_active_power,type="l",xlab="Week day",ylab="Global Active Power (kilowatts"))
dev.off()

