#### zip file has been extracted and lines corresponding to the dates
#### 2007-02-01 and 2007-02.02 have been pasted in file hpc.txt
#### set colClasses of columns, read the file
#### transform "time"-variable into "datetime" (same as in plot2.R)

colCl = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc = read.table ("./hpc.txt", sep = ";", colClasses = colCl)
hpc$V2 = as.POSIXct(paste(hpc$V1, hpc$V2), format = "%d/%m/%Y%T")

#### open graphic device
png(filename = "plot3.png")

#### plot "sub metering variables against datetime variable
#### use functions plot() and lines() with appropriate parameters
plot(hpc$V2, hpc$V7, type = "l", xlab = "", ylab = "Energy sub metering")
lines(hpc$V2, hpc$V8, col = "red")
lines(hpc$V2, hpc$V9, col = "blue")

#### make legend
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", 
"Sub_metering_3"))

#### close device
dev.off()
