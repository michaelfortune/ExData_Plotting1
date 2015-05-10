## First test if the data file already exists in the working directory   
if(!file.exists("exdata-data-household_power_consumption.zip")) {
  ## Create a temporary file name using tempfile()
  TmpFile <- tempfile()
  ## Download the zip file from the secure URL supplied to the destination file named TmpFile
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",TmpFile)
  ## Unzip the file into powerfile 
  PowerFile <- unzip(TmpFile)
  ## Delete tmpfile
  unlink(TmpFile)
}
## read data from PowerFile into PowerData
PowerData <- read.table(PowerFile, header=T, sep=";")
## Convert date
PowerData$Date <- as.Date(PowerData$Date, format="%d/%m/%Y")
## Select data from powerdata where date is 01 Feb 2007 or 02 Feb 2007 and assign to SelectData
SelectData <- PowerData[(PowerData$Date=="2007-02-01") | (PowerData$Date=="2007-02-02"),]
## Convert relevant data using the functions as.numeric, as.character and transform
## Household global minute-averaged active power (in kilowatt) 
SelectData$Global_active_power <- as.numeric(as.character(SelectData$Global_active_power))
## Household global minute-averaged reactive power (in kilowatt) 
SelectData$Global_reactive_power <- as.numeric(as.character(SelectData$Global_reactive_power))
## Minute-averaged voltage (in volt)
SelectData$Voltage <- as.numeric(as.character(SelectData$Voltage))
## Format Date and Time as Day/Month/Year Hour:Minutes:Seconds
SelectData <- transform(SelectData, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
## Energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). 
SelectData$Sub_metering_1 <- as.numeric(as.character(SelectData$Sub_metering_1))
## Energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. 
SelectData$Sub_metering_2 <- as.numeric(as.character(SelectData$Sub_metering_2))
## Energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
SelectData$Sub_metering_3 <- as.numeric(as.character(SelectData$Sub_metering_3))

