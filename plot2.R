plot2 <- function(file) {
  power <- read.table(file, header=T, sep=";")
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  Data_used <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  
  Data_used$Global_active_power <- as.numeric(as.character(Data_used$Global_active_power))
  Data_used <- transform(Data_used, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  plot(Data_used$timestamp,Data_used$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot2.png", width=480, height=480)
  dev.off()
  cat("plot2.png has been saved in", getwd())
}


plot2('D:/R_programming/Exploratory/household_power_consumption.txt')