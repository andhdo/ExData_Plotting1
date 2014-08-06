# declare global names

target_zip_folder <- "exdata-data-household_power_consumption"
source_zip_file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
subset_filename <- "_subset_data.csv"
output_figures_folder <- "output_figures"

# download the file & uncompress it
download_raw_package <- function() {
  
  # set the download params
  
  target_zip_filename <- paste0(target_zip_folder,'.zip')
  
  # if extraction folder exists, skip
  if(!file.exists(target_zip_folder)) {
    
    if(!file.exists(target_zip_filename)) {
      download.file(source_zip_file,destfile=target_zip_filename)  
    } 
    unzip(target_zip_filename,exdir=target_zip_folder)
    
  }
  
}

install_required_packages <- function() {
  if(!require("sqldf")) {
    install.packages("sqldf")
  }
  
}

create_output_figures_folder <- function() {
  if(!file.exists(output_figures_folder)) {
    dir.create(output_figures_folder, showWarnings = FALSE)
  }
}

# load the prerrequisites
load_prerequisites <- function() {
  install_required_packages()
  download_raw_package()
  create_output_figures_folder()
}

load_data <- function() {
  
  library(sqldf)
  
  alldataset_filename <- paste0(target_zip_folder,"/", "household_power_consumption.txt")
  
  if(!file.exists(subset_filename)) {
    download_raw_package()
    
    # read the raw dataset
    # read.csv.sql sql = "select * from file where Date = '1/1/2007' or Date = '2/1/2007'"
    all_dataset <- read.csv(alldataset_filename,  sep=";", stringsAsFactors=FALSE, header = TRUE, na.strings = "?")
    
    # calculate the subset
    x_subset <- all_dataset[(all_dataset$Date == "1/2/2007") | (all_dataset$Date == "2/2/2007"),]
    # dim(all_dataset)
    # dim(x_subset)
    x_subset$date_time <- strptime(paste(x_subset$Date, x_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")    
    
    write.csv(x_subset,file=subset_filename)
    
  } else {
    x_subset <- read.csv(file=subset_filename)
  }
  x_subset
}