plot2 <- function() {
  ## This purpose of this function is to create a .png file containing a plot of Global Active Power for the Selected Data Set contained in SelectedData  
  ## Create the plot
  plot(SelectData$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  ## Copy the plot as a png file called plot2.png to the Working directory. Set the height and width to 480.
  dev.copy(png, file="plot2.png", width=480, height=480)
  ##Shut down the current device
  dev.off()
}
