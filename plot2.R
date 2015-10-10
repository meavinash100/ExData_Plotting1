#Project 1 of Exploratory Data Analysis
#Creation of Plot 2

#Reading the data file (assuming the file is in the working directory)

electricitydata <- read.csv("household_power_consumption.txt", 
                            sep = ";",
                            stringsAsFactors = FALSE,
                            na = "?")

#Subsetting data only for first 2 days of Feb 2007
datasubset <- subset(electricitydata, electricitydata$Date %in% c("1/2/2007","2/2/2007"))

#Plot logic for Plot 2
#Comverting the variable to numeric and date manipulation
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)
datasubset$Time <- strptime(paste(datasubset$Date, datasubset$Time), "%d/%m/%Y %H:%M:%S")


plot(datasubset$Time, datasubset$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

#Creating a png file
dev.copy(png, file = "plot2.png",
         width = 480,
         height = 480)
dev.off()