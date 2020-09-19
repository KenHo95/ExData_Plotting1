# Plot 1

# Import relevant libraries 
library('dplyr')

# Read data
data <- read.table('household_power_consumption.txt', header = T, sep = ";", stringsAsFactors = F)

# Some data cleaning 
# type conversion
filtered_data <- data %>% 
                    mutate(Date = as.Date(Date, "%d/%m/%Y"), 
                           Global_active_power = as.numeric(Global_active_power)) %>% 
                    filter(Date >= '2007-02-01' & Date <= '2007-02-02')


png("plot1.png", width = 480, height = 480) # Code for exporting graph

# Plot graph
hist(filtered_data$Global_active_power,
     ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)",
     main = 'Global Active Power',
     ylim = c(0,1200),
     col = "red"
     )

dev.off() # Code for exporting graph




