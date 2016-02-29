##Load library
library(plyr)
library(ggplot2)
library(data.table)

##Load Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Convert into data.table
NEI.DT = data.table(NEI)
SCC.DT = data.table(SCC)

##Question 2
#Aggregate Emissions by year and county and filter "24510"

NEI.24510 <- NEI[which(NEI$fips == "24510"), ]

total.emissions.baltimore <- with(NEI.24510, aggregate(Emissions, by = list(year), 
                                                       sum))
colnames(total.emissions.baltimore) <- c("year", "Emissions")

#Open the PNG device

png(filename = "plot2.png", width = 480, height = 480, units = "px")

#Total emissions from PM2.5 on average decreased in the Baltimore City, Maryland from 1999 to 2008

plot(total.emissions.baltimore$year, total.emissions.baltimore$Emissions, type = "b", 
     pch = 18, col = "black", ylab = "Emissions", xlab = "Year", main = "Baltimore Emissions")

dev.off()