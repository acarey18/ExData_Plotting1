destfile <- "/Users/alexiscarey/OneDrive - Johns Hopkins/Thesis Project/R projects/household_power_consumption.zip"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, destfile)

data <- unzip(zipfile="/Users/alexiscarey/OneDrive - Johns Hopkins/Thesis Project/R projects/household_power_consumption.zip",exdir="./R projects")

df <- read.table(data, sep = ";", header = T)


df <- mutate(df, Date = as.Date(df$Date, "%d/%m/%Y"))  
df <- mutate(df, Day = wday(df$Date, label = TRUE) )
df <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]
df$Time <-strptime(df$Time,  format = "%H:%M:%S")
df[1:1440,"Time"] <- format(df[1:1440,"Time"],"2007-02-01 %H:%M:%S")
df[1441:2880,"Time"] <- format(df[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
df$Global_active_power <- as.numeric(df$Global_active_power) 
plot(df$Time, df$Global_active_power, type = "l", xlab="",
       ylab="Global Active Power (kilowatts)",
     main =  "")
dev.off()

 