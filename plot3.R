plot3 <- function(file) {
  power <- read.table(file, header=T, sep=";")
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  Data_used <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  
  Data_used$Sub_metering_1 <- as.numeric(as.character(Data_used$Sub_metering_1))
  Data_used$Sub_metering_2 <- as.numeric(as.character(Data_used$Sub_metering_2))
  Data_used$Sub_metering_3 <- as.numeric(as.character(Data_used$Sub_metering_3))
  
  Data_used <- transform(Data_used, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(Data_used$timestamp,Data_used$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Data_used$timestamp,Data_used$Sub_metering_2,col="red")
  lines(Data_used$timestamp,Data_used$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("plot3.png has been saved in", getwd())
}

plot3('D:/R_programming/Exploratory/household_power_consumption.txt')