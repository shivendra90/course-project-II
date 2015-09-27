library(dplyr)
library(ggplot2)
library(data.table)

#Load datasets
NEI = readRDS('summarySCC_PM25.rds')
SCC = readRDS('Source_Classification_Code.rds')

#Plot some graphics
png('plot3.png', 800,600)
plot3 <- ggplot(NEI, aes(x = year)) 
          + geom_histogram(color = 'red', alpha = 0.4) 
          + facet_wrap(~type) + theme_bw(base_family = 'Times', base_size = 14) 
          + labs(x = 'Year', y = 'Emissions', title = 'Emissions (tons) by type')

dev.off()
#End
