# read file
elcons <- read.csv("C:/Users/srinivas/Documents/R/exdata_data_household_power_consumption/household_power_consumption.txt",header = TRUE, sep = ";",na.strings = "?",stringsAsFactors = FALSE)

# subset the rows within 2 days 2/1/2007 or 2/2/2007
elconsub <- elcons[elcons$Date %in% c('1/2/2007', '2/2/2007'),]


# paste date and time and add a new column for date time

elconsdf <- transform(elconsub, Date_Time = paste(elconsub$Date,elconsub$Time, sep =" "))

# Convert Date to time format
elconsdf1 <- transform(elconsdf, Date_Time = as.POSIXct(strptime(elconsdf$Date_Time,format = "%d/%m/%Y %H:%M:%S", tz= "")))




#PLOT 3:
plot3 <- png("plot3.png", width=480, height = 480)

with(elconsdf1,plot(Date_Time,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(elconsdf1,lines(Date_Time,Sub_metering_1,col="black"))
with(elconsdf1,lines(Date_Time,Sub_metering_2,col="red"))
with(elconsdf1,lines(Date_Time,Sub_metering_3,col="blue"))
legend("topright",lty=1,col = c("black","red","blue"),legend = (c("Sub_metering_1","Sub_metering_2","Sub_metering_3")))

dev.off()

