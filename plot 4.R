# Plot 4

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
           Global_reactive_power = as.numeric(Global_reactive_power),
           Voltage = as.numeric(Voltage),
           DateTime = parse_date_time(paste(Date, Time), "Ymd HMS"),
           Sub_metering_1 = as.numeric(Sub_metering_1),
           Sub_metering_2 = as.numeric(Sub_metering_2),
           Sub_metering_3 = as.numeric(Sub_metering_3)) %>%
    filter(Date >= '2007-02-01' & Date <= '2007-02-02')

png("plot4.png", width = 480, height = 480) # Code for exporting graph

par(mfrow = c(2,2)) # sets out formating for multi-plots

# plot 4.1
plot(filtered_data$DateTime, 
     filtered_data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     type = "l") 

# plot 4.2
plot(filtered_data$DateTime,
     filtered_data$Voltage, 
     ylab = "Voltage", 
     xlab = "datetime",
     type = "l")

# plot 4.3
plot(filtered_data$DateTime,
     filtered_data$Sub_metering_1, 
     ylab = "Energy sub metering", 
     xlab = "",
     type = "l")

lines(filtered_data$DateTime, filtered_data$Sub_metering_3, type = "l", col = "blue") # inserts additional lines
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, type = "l", col = "red")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), # inserts legend
       col=c("black", "red", "blue"), lty = 1, cex = 0.8)

# plot 4.4
plot(filtered_data$DateTime,
     filtered_data$Global_reactive_power, 
     ylab = "Global_reactive_power", 
     xlab = "datetime",
     type = "l")

dev.off() # Code for exporting graph







