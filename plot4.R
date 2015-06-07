#'@author Pankaj L. Ahire (pankajahire@gmail.com)

#' @name plot4MultipleGraphs
#' @description Creates plot 4, multiple sub plots. 
#' This file triggers this function at the end.
#' @param dataFilename The name of the household power consumption data file. Default path prefilled
#' @param pngFilename Name of the PNG file; plot4.png is default here.
#' @return Nothing. If successful a pngFilename with the plot will be present.

plot4MultipleGraphs <- function(dataFilename = "../household_power_consumption.txt", 
                        pngFilename = "plot4.png") {
  
  source("datareader.R")
  
  ##Now to Produce Plot 4
  #Step 1. Get Data
  hhPowDat <- getData(dataFilename)
  
  #Step 2. Open the png device
  png(file=pngFilename, width=480, height=480, units="px")
  
  #Step 3. The plot.
  par(mfrow=c(2,2))
  with(hhPowDat, {
  #SubPlot 1 - Top Left (same as Plot 2)
    par(fig=c(0,0.5,0.5,1), new=TRUE)
    plot(theDateTime,Global_active_power,
         type="l", xlab="", ylab="Global Active Power")  
  #SubPlot 2 - Top Right
  par(fig=c(0.5,1,0.5,1), new=TRUE)
    plot(theDateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")  
  #SubPlot 3 - Bottom Left
  par(fig=c(0,0.5,0,0.5), new=TRUE) 
  plot(theDateTime,Sub_metering_1, col="black", type="l",
       xlab="",
       ylab="Energy sub metering")
   
   lines(theDateTime,Sub_metering_2,col="red", type="l")
   lines(theDateTime,Sub_metering_3,col="blue", type="l")
   legend("topright", lty=1, col=c("black", "red", "blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #SubPlot 4 - Bottom Right
  par(fig=c(0.5,1,0,0.5), new=TRUE)
  plot(theDateTime, Global_reactive_power, xlab="datetime", type="l")
  })
  #Step 4. Turn off the device.
  dev.off()
  
  #Step 5. Let's cleanup
  rm(hhPowDat)
}

### Let's call the function to create plot3.png
plot4MultipleGraphs()