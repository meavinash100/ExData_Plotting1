#Project 1 of Exploratory Data Analysis
#Creation of Plot 3

#Reading the data file (assuming the file is in the working directory)

electricitydata <- read.csv("household_power_consumption.txt", 
                            sep = ";",
                            stringsAsFactors = FALSE,
                            na = "?")

#Subsetting data only for first 2 days of Feb 2007
datasubset <- subset(electricitydata, electricitydata$Date %in% c("1/2/2007","2/2/2007"))

#Plot logic for Plot 3
#date manipulation
datasubset$Time <- strptime(paste(datasubset$Date, datasubset$Time), "%d/%m/%Y %H:%M:%S")


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
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#Creating a png file
dev.copy(png, file = "plot3.png",
         width = 480,
         height = 480)
dev.off()