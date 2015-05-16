plot4 <- function(file) {
  power <- read.table(file, header=T, sep=";")
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  Data_used <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  
  Data_used$Sub_metering_1 <- as.numeric(as.character(Data_used$Sub_metering_1))
  Data_used$Sub_metering_2 <- as.numeric(as.character(Data_used$Sub_metering_2))
  Data_used$Sub_metering_3 <- as.numeric(as.character(Data_used$Sub_metering_3))
  Data_used$Global_active_power <- as.numeric(as.character(Data_used$Global_active_power))
  Data_used$Global_reactive_power <- as.numeric(as.character(Data_used$Global_reactive_power))
  Data_used$Voltage <- as.numeric(as.character(Data_used$Voltage))
  
  Data_used <- transform(Data_used, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  par(mfrow=c(2,2))
  
  ##PLOT 1
  plot(Data_used$timestamp,Data_used$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  ##PLOT 2
  plot(Data_used$timestamp,Data_used$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ##PLOT 3
  plot(Data_used$timestamp,Data_used$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(Data_used$timestamp,Data_used$Sub_metering_2,col="red")
  lines(Data_used$timestamp,Data_used$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  #PLOT 4
  plot(Data_used$timestamp,Data_used$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  
  dev.copy(png, file="plot4.png", width=480, height=480)
  dev.off()
  cat("plot4.png has been saved in", getwd())
}

plot4('D:/R_programming/Exploratory/household_power_consumption.txt')