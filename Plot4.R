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


##Question 4

coal.scc = SCC.DT[grep("Coal", SCC.Level.Three), SCC]

#Aggregate Emissions for the above SCC by year

coal.emissions = NEI.DT[SCC %in% coal.scc, sum(Emissions), by = "year"]
colnames(coal.emissions) <- c("year", "Emissions")

#Open the PNG device

png(filename = "plot4.png", width = 480, height = 480, units = "px")

#Plot emissions per year using ggplot2 plotting system Emissions from coal combustion related sources decreased significantly from 1999-2008.

g = ggplot(coal.emissions, aes(year, Emissions))
g + geom_point(color = "red") + geom_line(color = "green") + labs(x = "Year") + 
  labs(y = expression("Total Emissions, PM"[2.5])) + labs(title = "Emissions from Coal Combustion for the US")

dev.off()