library(dplyr)
library(data.table)

NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

baltimore = NEI[NEI$fips == '24510']

sumations.baltimore = baltimore[,.(Emissions = sum(Emissions)), by = year]

png('plot2.png', 800,600)
plot.space <- c(0,4)
plot(sumations.baltimore$year, summations.baltimore$Emissions, type = 'l', xlab = 'Year', 
     ylab = 'Emissions (tons)', main = 'Emissions in Baltimore city (1999-2008)', col = 'red')
lines(summations.baltimore$Emissions, col = 'red')

dev.off()