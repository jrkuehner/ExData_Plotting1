#### zip file has been extracted and lines corresponding to the dates
#### 2007-02-01 and 2007-02.02 have been pasted in file hpc.txt
#### set colClasses of columns, read the file
colCl = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc = read.table ("./hpc.txt", sep = ";", colClasses = colCl)

#### paste "date" and "time" columns of data frame
#### use function as.POSIXct() to cast second column to class Date
#### entries will be of format "2007-02-01 12:14:23 CET" (datetime)
hpc$V2 = as.POSIXct(paste(hpc$V1, hpc$V2), format = "%d/%m/%Y%T")

#### open graphic device
png(filename = "plot2.png")

#### plot variable correspondin to "Global Active Power" against
#### column corresponding to "datetime"
#### set x- and y-labels
plot(hpc$V2, hpc$V3, type = "l", xlab = "", ylab = "Global Active Power (kilowatt)")

#### close device
dev.off()
