destfile <- "/Users/alexiscarey/OneDrive - Johns Hopkins/Thesis Project/R projects/household_power_consumption.zip"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url, destfile)

data <- unzip(zipfile="/Users/alexiscarey/OneDrive - Johns Hopkins/Thesis Project/R projects/household_power_consumption.zip",exdir="./R projects")

df <- read.table(data, sep = ";", header = T)
df <- mutate(df, Date = as.Date(df$Date, "%d/%m/%Y"))  
df <- mutate(df, Day = wday(df$Date, label = TRUE) )
df <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white")
df$Global_active_power <- as.numeric(df$Global_active_power) 
hist(df$Global_active_power, col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowats)",
     ylim = c(0,1200)
     ) 
dev.off()