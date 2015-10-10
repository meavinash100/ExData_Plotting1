#Project 1 of Exploratory Data Analysis
#Creation of Plot 4

#Reading the data file (assuming the file is in the working directory)

electricitydata <- read.csv("household_power_consumption.txt", 
                            sep = ";",
                            stringsAsFactors = FALSE,
                            na = "?")

#Subsetting data only for first 2 days of Feb 2007
datasubset <- subset(electricitydata, electricitydata$Date %in% c("1/2/2007","2/2/2007"))

#Plot logic for Plot 4
#date manipulation and conversion of character columns to numeric
datasubset$Time <- strptime(paste(datasubset$Date, datasubset$Time), "%d/%m/%Y %H:%M:%S")
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)

#Setting 2 row and 2 column layout
par(mfcol = c(2,2))

#First Plot
plot(datasubset$Time, datasubset$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power",
     xlab = "")

#Second Plot
plot(datasubset$Time, datasubset$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering",
     xlab = "")

lines(datasubset$Time, datasubset$Sub_metering_2, 
      type = "l", 
      ylab = "Energy sub metering",
      xlab = "",
      col = "red")

lines(datasubset$Time, datasubset$Sub_metering_3, 
      type = "l", 
      ylab = "Energy sub metering",
      xlab = "",
      col = "blue")

legend("topright", 
       lty=1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       box.lwd=0)

#Third Plot
plot(datasubset$Time, datasubset$Voltage, 
     type = "l", 
     ylab = "Voltage",
     xlab = "datetime")

#Fourth Plot
plot(datasubset$Time, datasubset$Global_reactive_power, 
     type = "l", 
     ylab = "Global_reactive_power",
     xlab = "datetime")

#Creating a png file
dev.copy(png, file = "plot4.png",
         width = 480,
         height = 480)
dev.off()