plot1 <- function(file) {
  
  power <- read.table(file, header=T, sep=";")
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")
  
  Data_used <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]
  
  Data_used$Global_active_power <- as.numeric(as.character(Data_used$Global_active_power))
  
  hist(Data_used$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())
}

plot1('D:/R_programming/Exploratory/household_power_consumption.txt')
