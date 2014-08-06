plot2 <- function() {
  
  # be sure to load the files and precomputations
  source("load_data.R")
  load_prerequisites()
  
  # get the specific data to plot
  x_subset <- load_data()
  
  # calculate target filename & open DC
  target_file <- paste0 (output_figures_folder,"/","plot2.png")
  png(filename=target_file, width=480,height=480,units="px")
  
  # execute target file (verify the dateformat)
  x_subset$date_time2 <- as.POSIXct(strptime(paste(x_subset$Date,x_subset$Time), "%d/%m/%Y %H:%M:%S"))
  
  plot( x_subset$date_time2, x_subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  # Turn off deviceContext
  dev.off()
  
}