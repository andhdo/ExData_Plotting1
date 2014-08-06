# declare global names

target_zip_folder <- "exdata-data-household_power_consumption"
source_zip_file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

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
  install.packages("sqldf")
}

load_data <- function() {
  
  library(sqldf)
  
  subset_filename <- "_subset_data.csv"
  alldataset_filename <- paste0(target_zip_folder,"/", "household_power_consumption.txt")
  
  if(!file.exists(subset_filename)) {
    download_raw_package()
    
    # read the raw dataset
    # read.csv.sql sql = "select * from file where Date = '1/1/2007' or Date = '2/1/2007'"
    all_dataset <- read.csv(alldataset_filename,  sep=";", stringsAsFactors=FALSE, header = TRUE, na.strings = "?")
    
    
    # calculate the subset
    
    
  }
}