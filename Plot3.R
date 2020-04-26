#download dataset
if(!file.exists("Wk1project")){dir.create("wk1project")}
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileurl, destfile = "~/DataScience/Exploratory Data Analysis/Wk1project/dataset.zip")

#unzipping the content
nzip("~/DataScience/Exploratory Data Analysis/Wk1project/dataset.zip", exdir = "~/DataScience/Exploratory Data Analysis/Wk1project/Powerdata")

#read dataset
powerdata <- read.table("~/DataScience/Exploratory Data Analysis/Wk1project/Powerdata/household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep = ";")

#subsetting specific date
subsetpowerdata <- powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007"), ]

#Plot2 creation
datetime <- strptime(paste(subsetpowerdata$Date, subsetpowerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalactivepower <- as.numeric(subsetpowerdata$Global_active_power) 
subMetering1 <- as.numeric(subsetpowerdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetpowerdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetpowerdata$Sub_metering_3)
png("Plot3.png", width = 480, height = 480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
