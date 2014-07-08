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
png( "plot2.png", width=w, height=h)

Sys.setlocale("LC_TIME", "en_US.UTF-8")  # to get the day abbrivations in English
d1$days = strptime( d1$Date, format="%a")

# actual plot
with( d1, plot( datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="" ))


# finish
dev.off()
