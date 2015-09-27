library(dplyr)
library(data.table)

#Load datasets
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

#Subset for Baltimore city
baltimore = NEI[NEI$fips == '24510']

#Get the summations by year for Baltimore
sumations.baltimore = baltimore[,.(Emissions = sum(Emissions)), by = year]

#Plot graphics
png('plot2.png', 800,600)
plot.space <- c(0,4)
plot(sumations.baltimore$year, summations.baltimore$Emissions, type = 'l', xlab = 'Year', 
     ylab = 'Emissions (tons)', main = 'Emissions in Baltimore city (1999-2008)', col = 'red')
lines(summations.baltimore$Emissions, col = 'red')

dev.off()
#End
