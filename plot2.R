################################################################################

## Exploratory Data Analysis Assignment 1
## Evelyn B.
## 1 July 2016

## Assignement Requirements:
#  Reconstruct a set of plots, all of which should be constructed using the 
#  base plotting system.

## Script Summary:
#  1. plot2.R plots a line chart of Global_active_power vs. DateTime.
#  2. Function calls are made to zipDownload() and subsetDF() in helper_functions.R
#  3. Executing plot2(x) will generate plot2.png in the working directory, 
#     where "x" is the user-defined working directory.
#  4. If "x" is not set, plot2.png is generated in the default working directory.

################################################################################

plot2 <- function(workingdir = getwd())
{
  setwd(workingdir)
  
  if(!file.exists("helper_functions.R"))
  {
    stop(paste("helper_functions.R not found in", workingdir))
  }
  source("helper_functions.R")
  
  zipDownload()
  
  plotDT <- subsetDF()
  
  png(file = "plot2.png", width = 480, height = 480)
  with(plotDT, plot(DateTime, Global_active_power,
                    type = "l",
                    xlab = "",
                    ylab = "Global Active Power (kilowatts)"))
  dev.off()
  
  cat("plot2.png is generated in", workingdir)
}
