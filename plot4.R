plot4 <- function() {
  ## This purpose of this function is to create a .png file containing four plots of data as specified for the Selected Data Set contained in SelectedData  
  ## Use the par function to create a plot with multiple graphs 2x2 
  par(mfrow=c(2,2))
  
  ## Global Active power plot
  plot(SelectedData$timestamp,SelectedData$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  
  ## Voltage by Date and Time plot
  plot(SelectedData$timestamp,SelectedData$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  ## Energy sub metering plot
  ## Create the plot for the first sub metering
  plot(SelectedData$timestamp,SelectedData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  ## Add data for second sub metering
  lines(SelectedData$timestamp,SelectedData$Sub_metering_2,col="red")
  ## Add data for third sub metering
  lines(SelectedData$timestamp,SelectedData$Sub_metering_3,col="blue")
  ## Add the legend to the plot
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
  
  ## Create the plot for Global reactive Power by Date and Time 
  plot(SelectedData$timestamp,SelectedData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  ## Copy the plot as a png file called plot4.png to the Working directory. Set the height and width to 480.
  dev.copy(png, file="plot4.png", width=480, height=480)
  ##Shut down the current device
  dev.off()
}
