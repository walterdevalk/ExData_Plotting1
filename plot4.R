## READ THE DATA

# read the data assuming the txt file is located in the current workdir
d <- read.table( "household_power_consumption.txt", stringsAsFactors=F, sep=";", header=T)

## PREPARE THE DATA

# get the date and time
datetime <-  paste( d$Date, d$Time)
d$datetime <- strptime( datetime, "%d/%m/%Y %H:%M:%S")

fdate <- as.POSIXct("2007-02-01 00:00:00")  # from date
tdate <- as.POSIXct("2007-02-02 24:00:00")  # to date

# subset the data between the to dates
d1 <- subset(d, datetime < tdate & datetime >= fdate) 


# dimensions
w <- 480
h <- 480


png( file="plot4.png", width=w, height=h)

# actual plot 1

Sys.setlocale("LC_TIME", "en_US.UTF-8")  # to get the day abbrivations in English


## the mix of four plots
attach( d1)
par( mfrow=c(2,2))

#1 global active power 
with( d1, plot( datetime, Global_active_power, type="l", ylab="Global Active Power", xlab="" ))

#2 voltage 
with( d1, plot( datetime, Voltage, type="l"))

#3 Energy sub
with( d1, plot( datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="" ))
lines( d1$datetime, d1$Sub_metering_2, col="red")
lines( d1$datetime, d1$Sub_metering_3, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#4 global reactive
with( d1, plot( datetime, Global_reactive_power, type="l"))

dev.off()

