#'@author Pankaj L. Ahire (pankajahire@gmail.com)

#' @name plot2LineXY
#' @description Creates the plot 2, a line plot of Weekday vs. Global Active Power. 
#' While abstraction could be made to take arguments and pass in parameters to plot. 
#' I tried to deliberately keep this simple and just for the need. 
#' Note that getting data (getData) is abstracted out
#' to a separate file, as the code is shared in all plots 
#' and abstraction here does save time.
#' This file triggers this function at the end.
#' @param dataFilename The name of the household power consumption data file. Default path prefilled
#' @param pngFilename Name of the PNG file; plot2.png is default here.
#' @return Nothing. If successful a pngFilename with a histogram will be present.

plot2LineXY <- function(dataFilename = "../household_power_consumption.txt", 
                           pngFilename = "plot2.png") {
  
  source("datareader.R")
  
  ##Now to Produce Plot 1
  #Step 1. Get Data
  hhPowDat <- getData(dataFilename)
  
  #Step 2. Open the png device
  png(file=pngFilename, width=480, height=480, units="px")
  
  #Step 3. The plot.
  plot(hhPowDat$theDateTime,
       hhPowDat$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  #Step 4. Turn off the device.
  dev.off()
}

### Let's call the function to create plot2.png
plot2LineXY()