# Plot 2

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
           DateTime = parse_date_time(paste(Date, Time), "Ymd HMS")) %>% 
    filter(Date >= '2007-02-01' & Date <= '2007-02-02')

png("plot2.png", width = 480, height = 480) # Code for exporting graph

# Plot graph
plot(filtered_data$DateTime, 
     filtered_data$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "",
     type = "l")  

dev.off() # Code for exporting graph




