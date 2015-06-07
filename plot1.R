#'@author Pankaj L. Ahire (pankajahire@gmail.com)

#' @name plot1Histogram
#' @description Creates the "Global Active Power" plot. While abstraction could be made
#' to take arguments and pass in parameters to hist. I tried to deliberately keep this 
#' simple and just for the need. Note that getting data (getData) is abstracted out
#' to a separate file, as the code is shared in all plots and abstraction here does save time.
#' This file triggers this function at the end.
#' @param dataFilename The name of the household power consumption data file. Default path prefilled
#' @param pngFilename Name of the PNG file; plot1.png is default here.
#' @return Nothing. If successful a pngFilename with a histogram will be present.

plot1Histogram <- function(dataFilename = "../household_power_consumption.txt", 
                           pngFilename = "plot1.png") {
  
  source("datareader.R")
  
  ##Now to Produce Plot 1
  #Step 1. Get Data
  hhPowDat <- getData(dataFilename)
  
  #Step 2. Open the png device
  png(file=pngFilename, width=480, height=480, units="px")
  
  #Step 3. The plot.
  hist(hhPowDat$Global_active_power, 
       col="red", 
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)")
  #Step 4. Turn off the device.
  dev.off()
}

### Let's call the function to create plot1.png
plot1Histogram()