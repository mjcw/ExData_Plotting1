generatePlot1 <- function(outputFileName="plot1.png"){
  # read the data
  data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  dataset <- subset(data, as.Date(datetime)=="2007-02-01" | as.Date(datetime)=="2007-02-02")
  
  # generate plot
  png(outputFileName, width=480, height=480)
  hist(dataset$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
  dev.off()
  
}
