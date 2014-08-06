plot1 <- function() {
  
  # be sure to load the files and precomputations
  source("load_data.R")
  load_prerequisites()
  
  # get the specific data to plot
  x_subset <- load_data()
  # calculate target filename & open DC
  target_file <- paste0 (output_figures_folder,"/","plot1.png")
  png(filename=target_file, width=480,height=480,units="px")
  
  # execute target file
  hist(x_subset$Global_active_power,main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
  
  # Turn off deviceContext
  dev.off()
  
}