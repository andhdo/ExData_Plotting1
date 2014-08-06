plot4 <- function() {
  
  # be sure to load the files and precomputations
  source("load_data.R")
  load_prerequisites()
  
  # get the specific data to plot
  x_subset <- load_data()
  
  # calculate target filename & open DC
  target_file <- paste0 (output_figures_folder,"/","plot4.png")
  png(filename=target_file, width=480,height=480,units="px")
  
  # execute target file (verify the dateformat)
  x_subset$date_time2 <- as.POSIXct(strptime(paste(x_subset$Date,x_subset$Time), "%d/%m/%Y %H:%M:%S"))
  
  par(mfrow=c(2,2))
  
  # plot-1
  plot( x_subset$date_time2, x_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  # plot-2
  plot( x_subset$date_time2, x_subset$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  # plot-3
  plot( x=x_subset$date_time2, y=x_subset$Sub_metering_1, type="l", xlab="",ylab="Energy sub meetering")  
  lines(x=x_subset$date_time2, y=x_subset$Sub_metering_2, type="l", col="red")
  lines(x=x_subset$date_time2, y=x_subset$Sub_metering_3, type="l", col="blue")
  
    # add legend
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), pch=2, col=c("black","blue","red"))
  
  # plot-4
  plot( x_subset$date_time2, x_subset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  
    
  # Turn off deviceContext
  dev.off()
  
}