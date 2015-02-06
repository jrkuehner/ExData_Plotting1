#### zip file has been extracted and lines corresponding to the dates
#### 2007-02-01 and 2007-02.02 have been pasted in file hpc.txt
#### set colClasses of columns, read the file
colCl = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc = read.table ("./hpc.txt", sep = ";", colClasses = colCl)

#### transform "time" into "datetime" like in plot2.R
hpc$V2 = as.POSIXct(paste(hpc$V1, hpc$V2), format = "%d/%m/%Y%T")


#### open device
png(filename = "plot4.png")

#### layout 2 x 2 plots
par(mfrow = c(2,2))

#### plot "Global Active Power", "Voltage"
####      "Sub metering"         "Global Reactive Power"
#### in layout
with(hpc, {
	   plot(V2, V3, type = "l", xlab = "", ylab = "Global Active Power")
	   plot(V2, V5, type = "l", xlab = "datetime", ylab = "Voltage")

	   plot(V2, V7, type = "l", xlab = "", ylab = "Energy sub metering")
	   lines(V2, V8, col = "red")
	   lines(V2, V9, col = "blue")
	   legend("topright", lty = 1, col = c("black", "red", "blue"),
                  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
	   plot(V2, V4, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

#### close device
dev.off()
