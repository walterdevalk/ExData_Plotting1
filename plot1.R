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
png( "plot1.png", width=w, height=h)

# actual plot
hist( as.numeric(d1$Global_active_power), main="Global Active Power", col='red', xlab="Global Active Power (kilowatts)")

# finish
dev.off()


