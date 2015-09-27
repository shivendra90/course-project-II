library(data.table)
library(dplyr)
library(lattice)
library(ggplot2)

#Load the dataset
NEI = readRDS('summarySCC_PM25.rds')
SCC = readRDS('Source_Classification_Code.rds')
NEI = data.table(NEI)
SCC = data.table(SCC)

#Arrange the dataset so the sum of all PM25 values are dsiplayed according to year
summations = NEI[,.(Emissions = sum(Emissions)), by = year]

##Plot some graphics
png('plot1.png', 800,600)
plot1 = plot(summations$year, summations$Emissions, type = 'l', main = 'Measuring emissions', 
             xlab = 'Year', ylab = 'Emissions')
dev.off()

##End