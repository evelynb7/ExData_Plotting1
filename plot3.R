################################################################################

## Exploratory Data Analysis Assignment 1
## Evelyn B.
## 1 July 2016

## Assignement Requirements:
#  Reconstruct a set of plots, all of which should be constructed using the 
#  base plotting system.

## Script Summary:
#  1. plot3.R plots a line chart of Energy sub metering vs. DateTime.
#  2. Function calls are made to zipDownload() and subsetDF() in helper_functions.R
#  3. Executing plot3(x) will generate plot3.png in the working directory, 
#     where "x" is the user-defined working directory.
#  4. If "x" is not set, plot3.png is generated in the default working directory.

################################################################################

plot3 <- function(workingdir = getwd())
{
  setwd(workingdir)
  
  if(!file.exists("helper_functions.R"))
  {
    stop(paste("helper_functions.R not found in", workingdir))
  }
  source("helper_functions.R")
  
  zipDownload()
  
  plotDT <- subsetDF()
  
  png(file = "plot3.png", width = 480, height = 480)
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
  
  legend("topright", 
          cex = 0.75,
          lty = c(1, 1, 1),
          col = c("black", "red", "blue"),
          legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
  
  cat("plot3.png is generated in", workingdir)
}