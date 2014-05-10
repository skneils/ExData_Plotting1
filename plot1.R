# Power consumption data file MUST BE IN WORKING DIRECTORY
# read data from file
power<-read.table("household_power_consumption.txt", header=TRUE, sep=';')

# convert "Date" into R's Date format
power$"Date"<-as.Date(power$"Date","%d/%m/%Y")

# take the subset of the power data from the given 2 days
power_subset<-subset(power, ((power$"Date">"2007-01-31") & (power$"Date"<"2007-02-03")))

# convert factors to numeric values
power_subset$"Global_active_power"<- as.numeric(as.character(power_subset$"Global_active_power"))

# open graphics device
png("plot1.png", width=480, height=480)

# draw histogram for Plot 1
hist(power_subset$"Global_active_power", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col=2, ylim=c(0,1200))

# close graphics device
dev.off()