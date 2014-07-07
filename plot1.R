w <- 480
h <- 480

# pdf( file=plot1.png, width=w, heigth=h)

d <- read.table( "household_power_consumption.txt", stringsAsFactors=F, sep=";", header=T)

datetime <-  paste( d$Date, d$Time)
d$datetime <- strptime( datetime, "%d/%m/%Y %H:%M:%S")

fdate <- as.POSIXct("2007-02-01 00:00:00")  # from date
tdate <- as.POSIXct("2007-02-02 23:59:59")  # to date

# subset the data
d1 <- subset(d, datetime <= tdate & datetime >= fdate) 




