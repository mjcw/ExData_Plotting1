generatePlot3 <- function(outputFileName="plot3.png"){
  data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  dataset <- subset(data, as.Date(datetime)=="2007-02-01" | as.Date(datetime)=="2007-02-02")

  png(outputFileName, width=480, height=480)
  
  # start drawing the plot
  with(dataset, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
  with(dataset, {
    lines(datetime, Sub_metering_1, col="black")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
  })
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty=1)
  
  dev.off()
}

