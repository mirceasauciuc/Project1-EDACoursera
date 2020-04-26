
## Creating the first plot in the series of 4 for power consumption ##
library(data.table)

setwd("/Users/mirceasauciuc/Documents/R-Data/Files/Exploratory Data Analysis")

powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = 
            c("Global_active_power")]

powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Changing the dates to only show the following two days
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

## Creating the histogram
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
