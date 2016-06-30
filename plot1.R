################################################################################

## Exploratory Data Analysis Assignment 1
## Evelyn B.
## 1 July 2016

## Assignement Requirements:
#  Reconstruct a set of plots, all of which should be constructed using the 
#  base plotting system.

## Script Summary:
#  1. plot1.R plots a histogram of Frequency vs. Global_active_power.
#  2. Function calls are made to zipDownload() and subsetDF() in helper_functions.R
#  3. Executing plot1(x) will generate plot1.png in the working directory, 
#     where "x" is the user-defined working directory.
#  4. If "x" is not set, plot1.png is generated in the default working directory.

################################################################################

plot1 <- function(workingdir = getwd())
{
  setwd(workingdir)
  
  if(!file.exists("helper_functions.R"))
  {
    stop(paste("helper_functions.R not found in", workingdir))
  }
  source("helper_functions.R")
  
  zipDownload()
  
  plotDT <- subsetDF()
  
  png(file = "plot1.png", width = 480, height = 480)
  with(plotDT, hist(Global_active_power, 
                    col = "red", 
                    main = "Global Active Power",
                    xlab = "Global Active Power (kilowatts)"))
  dev.off()
  
  cat("plot1.png is generated in", workingdir)
}
