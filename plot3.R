# Plot 3

# Import relevant libraries 
library('dplyr')
library('lubridate')

# Read data
data <- read.table('household_power_consumption.txt', header = T, sep = ";", stringsAsFactors = F)

# Some data cleaning 
# type conversion
filtered_data <- data %>%
    mutate(Date = as.Date(Date, "%d/%m/%Y"),
           Global_active_power = as.numeric(Global_active_power),
           DateTime = parse_date_time(paste(Date, Time), "Ymd HMS"),
           Sub_metering_1 = as.numeric(Sub_metering_1),
           Sub_metering_2 = as.numeric(Sub_metering_2),
           Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
    filter(Date >= '2007-02-01' & Date <= '2007-02-02')


png("plot3.png", width = 480, height = 480) # Code for exporting graph

plot(filtered_data$DateTime,
     filtered_data$Sub_metering_1, 
     ylab = "Energy sub metering", 
     xlab = "",
     type = "l")

lines(filtered_data$DateTime, filtered_data$Sub_metering_3, type = "l", col = "blue") # inserts additional lines
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, type = "l", col = "red")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), # inserts legend
       col=c("black", "red", "blue"), lty = 1, cex = 0.8)

dev.off() # Code for exporting graph

