plot3 <- function() {
  ## This purpose of this function is to create a .png file containing a plot of the Energy sub Metering for the Selected Data Set contained in SelectedData  
  ## Create the plot for first sub metering
  plot(SelectData$timestamp,SelectData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  ## Add data for second sub metering
  lines(SelectData$timestamp,SelectData$Sub_metering_2,col="red")
  ## Add data for third sub metering
  lines(SelectData$timestamp,SelectData$Sub_metering_3,col="blue")
  ## Add the legend to the plot
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  ## Copy the plot as a png file called plot2.png to the Working directory. Set the height and width to 480.
  dev.copy(png, file="plot3.png", width=480, height=480)
  ##Shut down the current device
  dev.off()
}
plot3()