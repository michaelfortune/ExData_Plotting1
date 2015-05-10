plot1 <- function() {
  ## This purpose of this function is to create a .png file containing a plot of Global Active Power for the Selected Data Set contained in SelectedData  
  ## Create the Histogram
  hist(SelectData$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  ## Copy the Histogram as a png file called plot1.png to the Working directory. Set the height and width to 480.
  dev.copy(png, file="plot1.png", width=480, height=480)
  ##Shut down the current device
  dev.off()
}
