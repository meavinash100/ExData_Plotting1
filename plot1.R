#Project 1 of Exploratory Data Analysis
#Creation of Plot 1

#Reading the data file (assuming the file is in the working directory)

electricitydata <- read.csv("household_power_consumption.txt", 
                            sep = ";",
                            stringsAsFactors = FALSE,
                            na = "?")

#Subsetting data only for first 2 days of Feb 2007
datasubset <- subset(electricitydata, electricitydata$Date %in% c("1/2/2007","2/2/2007"))

#Plot logic for Plot 1
#Comverting the variable to numeric
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)


hist(datasubset$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", 
     col = "red")

dev.copy(png, file = "plot1.png", 
         width = 480, 
         height = 480)
dev.off()
