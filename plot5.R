library(dplyr)
library(data.tabe)
library(ggplot2)

##Load datasets
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

##Subset NEI dataset for onroad and non-raod types
baltimore.onroad = subset(NEI, fips == '24510' & type == 'ON-ROAD')
baltimore.nonroad = subset(NEI, fips == '24510' & type == 'NON-ROAD')

#combine the two datasets
baltimore.motors = rbind(baltimore.onroad, baltimore.nonroad)

#Plot graphics
png('plot5.png', 800,600)
plot5 <- ggplot(baltimore.motors, aes(x = year)) 
        + geom_histogram(color = 'steelblue', alpha = 0.6) 
        + facet_wrap(~type) 
        + theme_grey(base_family = 'Times', base_size = 14) 
        + labs(x = 'Year', y = 'Emissions by motor vehicles', titles = 'Emissions by vehicle types')

dev.off()
#End
