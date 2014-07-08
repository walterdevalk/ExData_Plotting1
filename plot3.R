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


## PLOTTING PART

# dimensions
w <- 480
h <- 480

# set file to write to
png( "plot3.png", width=w, height=h)

Sys.setlocale("LC_TIME", "en_US.UTF-8")  # to get the day abbrivations in English

# actual plot

with( d1, plot( datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="" ))
lines( d1$datetime, d1$Sub_metering_2, col="red")
lines( d1$datetime, d1$Sub_metering_3, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))


# finish
dev.off()
