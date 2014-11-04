generatePlot2 <- function(outputFileName="plot2.png"){
  data <- read.table("data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  dataset <- subset(data, as.Date(datetime)=="2007-02-01" | as.Date(datetime)=="2007-02-02")
  png(outputFileName, width=480, height=480)
  with(dataset, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
  dev.off()
}
