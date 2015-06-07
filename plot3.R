#'@author Pankaj L. Ahire (pankajahire@gmail.com)

#' @name plot3lineXY
#' @description Creates the plot 3, a line plot of Weekday vs. Energy sub metering.
#' Sub_metering_1 is black; Sub_metering_2 in red; and Sub_metering_3 in blue. 
#' While abstraction could be made to take arguments and pass in parameters to plot. 
#' I tried to deliberately keep this simple and just for the need. 
#' Note that getting data (getData) is abstracted out
#' to a separate file, as the code is shared in all plots 
#' and abstraction here does save time.
#' This file triggers this function at the end.
#' @param dataFilename The name of the household power consumption data file. Default path prefilled
#' @param pngFilename Name of the PNG file; plot3.png is default here.
#' @return Nothing. If successful a pngFilename with a histogram will be present.

plot3lineXY <- function(dataFilename = "../household_power_consumption.txt", 
                        pngFilename = "plot3.png") {
  
  source("datareader.R")
  
  ##Now to Produce Plot 1
  #Step 1. Get Data
  hhPowDat <- getData(dataFilename)
  
  #Step 2. Open the png device
  png(file=pngFilename, width=480, height=480, units="px")
  
  #Step 3. The plot.
  plot(hhPowDat$theDateTime,
       hhPowDat$Sub_metering_1,
       col="black",
       type="l",
       xlab="",
       ylab="Energy sub metering")
  lines(hhPowDat$theDateTime,
        hhPowDat$Sub_metering_2,
        col="red")
  lines(hhPowDat$theDateTime,
        hhPowDat$Sub_metering_3,
        col="blue")
  legend("topright", lty=1, col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  #Step 4. Turn off the device.
  dev.off()
}

### Let's call the function to create plot3.png
plot3lineXY()