#Plot1
data<-read.table("household_power_consumption.txt",sep=";",header = TRUE)
data$Global_active_power<-as.numeric(data$Global_active_power)
png(file="plot1.png",width=800,height=600)
hist(as.numeric(data$Global_reactive_power)/1000,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.off()