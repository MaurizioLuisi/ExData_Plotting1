# Plot 3 Script
# Get Data
home_dir <- c("C:/Data Science - Johns Hopkins University/Exploratory Data Analysis/Week 1")
household_power_consumption <- read.csv(paste(home_dir,"household_power_consumption.txt",sep="/"), sep=";",na.strings = "?")
z_dates <- as.character(household_power_consumption$Date)
z_times <- as.character(household_power_consumption$Time)
z <- paste(z_dates,z_times)
z_date <- strptime(z, "%d/%m/%Y %H:%M:%S")
d_date <- as.Date(z_date)
st <- as.Date("2007-02-01")
en <- as.Date("2007-02-02")
range<-(d_date %in% st)|(d_date %in% en)
HPC <- household_power_consumption[range,]


# Plot 3
par(mar =c(5.1,4.1,2.8,1.1))
plot(z_date[range],as.numeric(HPC$Sub_metering_1),type="l",
     ylab = "Energy sub metering",xlab="", col = "black")
lines(z_date[range],as.numeric(HPC$Sub_metering_2), col = "red")
lines(z_date[range],as.numeric(HPC$Sub_metering_3), col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), 
       col=c("black","red","blue"))
dev.print(png, file =paste(home_dir,"Plot3.png",sep="/"),width=480,height=480)
dev.off()
