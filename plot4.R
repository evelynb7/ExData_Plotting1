################################################################################

## Exploratory Data Analysis Assignment 1
## Evelyn B.
## 1 July 2016

## Assignement Requirements:
#  Reconstruct a set of plots, all of which should be constructed using the 
#  base plotting system.

## Script Summary:
#  1. plot4.R plots a 2X2 set of charts.
#  2. Function calls are made to zipDownload() and subsetDF() in helper_functions.R
#  3. Executing plot4(x) will generate plot4.png in the working directory, 
#     where "x" is the user-defined working directory.
#  4. If "x" is not set, plot4.png is generated in the default working directory.

################################################################################

plot4 <- function(workingdir = getwd())
{
  setwd(workingdir)
  
  if(!file.exists("helper_functions.R"))
  {
    stop(paste("helper_functions.R not found in", workingdir))
  }
  source("helper_functions.R")
  
  zipDownload()
  
  plotDT <- subsetDF()
  
  png(file = "plot4.png", width = 480, height = 480)
  
  # Create a 2X2 matrix that will be filled by row
  par(mfrow = c(2, 2))
  
  
  ## Start plotting  ######################################################
  
  ## Plot Global Active Power vs. DateTime at [1,1]
  with(plotDT, plot(DateTime, Global_active_power,
                    type = "l",
                    xlab = "",
                    ylab = "Global Active Power"))
  
  ## Plot Voltage vs. DateTime at [1,2]
  with(plotDT, plot(DateTime, Voltage,
                    type = "l",
                    xlab = "datetime",
                    ylab = "Voltage"))
  
  ## Plot Energy sub metering vs. DateTime at [2,1]
  with(plotDT, plot(DateTime, Sub_metering_1,
                    type = "l",
                    xlab = "",
                    ylab = "Energy sub metering"))
  
  with(plotDT, lines(DateTime, Sub_metering_2, 
                     type = "l", 
                     col = "red"))
  
  with(plotDT, lines(DateTime, Sub_metering_3, 
                     type = "l", 
                     col = "blue"))
  
  legend("topright", cex = 0.9, bty = "n",
         lty = c(1, 1, 1), 
         col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Plot Global_reactive_power vs. DateTime at [2,2]
  with(plotDT, plot(DateTime, Global_reactive_power,
                    type = "l",
                    xlab = "datetime"))
  
  ## End plotting  ########################################################
  
  dev.off()
  
  cat("plot4.png is generated in", workingdir)
}