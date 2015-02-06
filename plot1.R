#### zip file has been extracted and lines corresponding to the dates
#### 2007-02-01 and 2007-02.02 have been pasted in file hpc.txt
#### set colClasses of columns, read the file
colCl = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
hpc = read.table ("./hpc.txt", sep = ";", colClasses = colCl)

#### open png-device
png(filename = "plot1.png")

#### make histogram with column corresponding to "Global Active Power"
#### set color, xlabel and main title
hist(hpc$V3, col = "red", xlab = "Global Active Power (kilowatt)", main = "Histogram of Global Active Power")

#### close device
dev.off()
