## Read in the data
power_consumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
## Change date column to proper format
power_consumption$Date <- as.Date(power_consumption$Date, format = "%d/%m/%Y")
## Subset off data to be analyzed
power <- subset(power_consumption, Date == "2007-02-01" | Date == "2007-02-02")
## Make combined date time column and add it to front of data frame
datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%Y-%m-%d %H:%M:%S")
power <- cbind(datetime, power)
## create png file, set margins, make plot and turn graphics device off
png("plot2.png")
par(mar = c(2,4,2,2))
with(power, plot(datetime, (as.numeric(Global_active_power))/500, type = "l", ylab = "Global Active Power (kilowats)", xlab = ""))
dev.off()