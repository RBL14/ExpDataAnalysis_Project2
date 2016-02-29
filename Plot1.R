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

## Question 1

#Aggreate emission per year

total.emissions <- with(NEI, aggregate(Emissions, by = list(year), sum))

#Open the PNG device

png(filename = "plot1.png", width = 480, height = 480, units = "px")

#Total emissions from PM2.5 decreased in the United States from 1999 to 2008

plot(total.emissions, type = "b", pch = 18, col = "blaCK", ylab = "Total PM2.5 Emissions (tons)", 
     xlab = "Year", main = "Total Annual Emissions")

dev.off()