library(dplyr)
library(ggplot2)

#Load datasets
NEI = readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

##Subset data for California and Baltimore counties
california.onroad = subset(NEI, fips == '06037' & type == 'ON-ROAD')
california.nonroad = subset(NEI, fips == '06037' & type == 'NON-ROAD')
california.motors = rbind(california.onroad, california.nonroad)

baltimore.onroad = subset(NEI, fips == '24510' & type == 'ON-ROAD')
baltimore.nonroad = subset(NEI, fips == '24510' & type == 'NON-ROAD')
baltimore.motors = rbind(baltimore.onroad, baltimore.nonroad)

motors = rbind(california.motors, baltimore.motors)

##Rename the fips codes to respective country names
motors$fips = gsub('06037', 'California', motors$fips)
motors$fips = gsub('24510', 'Baltimore', motors$fips)

##Plot grpahics
png('plot6.png', 800,600)
plot6 <- ggplot(motors, aes(x = year)) +geom_histogram(color = 'blue' ,alpha = 0.6) + facet_wrap(~fips) + theme_light(base_family = 'Times', base_size = 14) + labs(x = 'Year', y = 'Emissions')

dev.off()