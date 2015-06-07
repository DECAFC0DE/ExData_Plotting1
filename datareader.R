#'This file contains a single function that reads in the 
#'household power data as provided for Project 1.
#' @author Pankaj L. Ahire (pankajahire@gmail.com)

#' @method getData
#' @description Gets the household power dataset as described by Project 1.
#'
#' @param dataFilename A string (could be a path parseable by read.csv) for the data
#' file name.
#' @return A data frame of observations only from 2007-02-01 till 2007-02-02.
#' Also consolidates the Date and Time column to a single column called theDateTime whose
#' class is POSIXlt.
#' @example
#' hhData <- getData("../household_power_consumption.txt")

getData <- function(dataFilename) {
  #Read the CSV file. We know the separator is ; and NA is represented as ?
  #Also explicitly assigning character class to Date and Time columns.
  hhPowerData <- read.csv(dataFilename, header = TRUE, sep=";",
                          quote="", na.strings="?",
                          colClasses=c("Date"="character", "Time"="character"))
  
  #Before we do anything -- lets reduce the dataset to only the 
  #interested dates, so all future operations are easier.
  #Note that the comparison is safe here; even though perhaps
  #needlessly using as.Date; as time isn't considered yet.
  hhPowerData <- subset(hhPowerData, as.Date(Date,"%d/%m/%Y") >= as.Date("2007-02-01") &
                          as.Date(Date,"%d/%m/%Y") <= as.Date("2007-02-02"))
  
  #Create a new column from Date and Time and convert it to DateTime properly.
  hhPowerData$theDateTime <- strptime(paste(hhPowerData$Date, hhPowerData$Time), "%d/%m/%Y %H:%M:%S")
  
  #Because this dataset is huge, lets drop Date and Time columns
  #Achieve this without needless copying by just assigning list(NULL)
  hhPowerData[,c("Date", "Time")] <- list(NULL)
  
  #Return the sanitized data frame.
  hhPowerData
}