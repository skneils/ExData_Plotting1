# Power consumption data file MUST BE IN WORKING DIRECTORY
# read data from file
power<-read.table("household_power_consumption.txt", header=TRUE, sep=';')

# convert "Date" into R's Date format
power$"Date"<-as.Date(power$"Date","%d/%m/%Y")

# take the subset of the power data from the given 2 days
power_subset<-subset(power, ((power$"Date">"2007-01-31") & (power$"Date"<"2007-02-03")))

#create a vector that combines Date and Time
date_and_time <- strptime(paste(power_subset$"Date", power_subset$"Time"), "%Y-%m-%d %H:%M:%S")

# convert factors to numeric values
power_subset$"Global_active_power"<- as.numeric(as.character(power_subset$"Global_active_power"))

# open graphics device
png("plot2.png", width=480, height=480)

# draw plot of type "l" [line] for Plot 2
plot(date_and_time, power_subset$"Global_active_power", type="l",
     ylab="Global Active Power(kilowatts)", xlab="")

# close graphics device
dev.off()