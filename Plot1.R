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

#Histo Plot creation
globalactivepower <- as.numeric(subsetpowerdata$Global_active_power) 
png("Plot1.png", width = 480, height = 480)
hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatt)", ylab = "Frequency")
dev.off()

