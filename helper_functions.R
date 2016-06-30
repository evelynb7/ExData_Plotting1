################################################################################

## Exploratory Data Analysis Assignment 1
## Evelyn B.
## 1 July 2016

## Assignement Requirements:
#  Reconstruct a set of plots, all of which should be constructed using the 
#  base plotting system.

## Script Summary:
#  This file contains a set of helper functions common to the four scripts:
#  plot1.R, plot2.R, plot3.R, plot4.R
#  Each of these scripts will generate their respective 480px x 480px plots 
#  in png format.

#  The helper functions contained here are:
#  1. zipDownload - downloads/unzips the data set household_power_consumption.zip"
#  2. subsetDF    - extracts and tidies up data for dates between 
#                   2007-02-01 and 2007-02-02

################################################################################

## Define data source and file names

fileURL   <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filename  <- "household_power_consumption.zip"
filetxt   <- "household_power_consumption.txt"

## Function to download zip file

zipDownload <- function()
{
  if(!file.exists(filename))
  {
    download.file(url = fileURL, destfile = filename)
  }
  unzip(filename)
  
}

## Function to read data from txt into R; returns data frame

subsetDF <- function()
{
  mydata            <- read.table(filetxt, header = TRUE, sep = ";", skip = 66637, nrows = 2880, stringsAsFactors = FALSE)
  mynames           <- read.table(filetxt, sep = ";", nrows = 1, stringsAsFactors = FALSE)
  colnames(mydata)  <- mynames
  mydata$Date       <- strptime(mydata$Date, "%d/%m/%Y")
  # New column DateTime (concatenated Date and Time variables)
  mydata$DateTime   <- as.POSIXlt(paste(mydata$Date, mydata$Time))
  
  return(mydata)
}