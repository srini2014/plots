# read file
elcons <- read.csv("C:/Users/srinivas/Documents/R/exdata_data_household_power_consumption/household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE)

# subset the rows within 2 days 2/1/2007 or 2/2/2007
elconsub <- elcons[elcons$Date %in% c('1/2/2007', '2/2/2007'),]


# paste date and time and add a new column for date time

elconsdf <- transform(elconsub, Date_Time = paste(elconsub$Date,elconsub$Time, sep =" "))

# Convert Date to time format
elconsdf1 <- transform(elconsdf, Date_Time = as.POSIXct(strptime(elconsdf$Date_Time,format = "%d/%m/%Y %H:%M:%S", tz= "")))


# PLOT1: Create a png
plot1 <- png("plot1.png", width=480, height = 480)
#plot1 <- hist(elconsub2$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)",main ="")
plot1 <- hist(elconsdf1$Global_active_power, col = "red", xlab = "Global Active Power (Kilowatts)",main ="Global Active Power")
dev.off()

