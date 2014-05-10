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
power_subset$"Sub_metering_1"<- as.numeric(as.character(power_subset$"Sub_metering_1"))
power_subset$"Sub_metering_2"<- as.numeric(as.character(power_subset$"Sub_metering_2"))


# open graphics device
png("plot3.png", width=480, height=480)

# draw plot of type "l" [line] for Plot 3
plot(ptime, power_subset$"Sub_metering_1", type="l", 
     ylab="Energy sub metering", xlab="", yaxp=c(0, 30, 3))
lines(ptime, power_subset$"Sub_metering_2", col=2)
lines(ptime, power_subset$"Sub_metering_3", col=4)
legend("topright", lty=1, col = c(1,2,4), 
       legend=c("Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3"))

# close graphics device
dev.off()