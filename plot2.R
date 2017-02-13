## read file into data table
filename <- "household_power_consumption.txt"

dt<-read.table(filename, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
narrow_dt<-dt[dt$Date %in% c("1/2/2007","2/2/2007"),]

datetime <- strptime(paste(narrow_dt$Date, narrow_dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(narrow_dt$Global_active_power)

## seting the plot device
png("plot2.png", width=480, height=480)

## running histogram
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


