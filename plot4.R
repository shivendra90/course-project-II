library(dplyr)
library(ggplot2)
library(data.table)

#load the datasets
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

##Extract data for all coal related sources from the NEI dataset; rename the SCC codes
anthracite = NEI[which(NEI$SCC > 10100100 & NEI$SCC < 10100103),]
anthracite$SCC = gsub('.*', 'Anthracite', anthracite$SCC)

bituminous = NEI[which(NEI$SCC > 10100200 & NEI$SCC < 10100219),]
bituminous$SCC = gsub('.*', 'Bituminous', bituminous$SCC)

subbituminous = NEI[which(NEI$SCC >10100220 & NEI$SCC < 10100239),]
subbituminous$SCC = gsub('.*', 'Subbituminous', subbituminous$SCC)

lignite = NEI[which(NEI$SCC > 10100239 & NEI$SCC < 10100319),]
lignite$SCC <- gsub('.*', 'Lignite', lignite$SCC)

##Combine the datasets
coal <- rbind(anthracite, bituminous, subbituminous, lignite)

#Plot graphics
png('plot4.png', 800,600)
plot4 <- ggplot(coal, aes(x = year)) 
        + geom_histogram() 
        + facet_wrap(~SCC) 
        + theme_bw(base_family = 'Times', base_size = 12) 
        + labs(x = 'Year', y = 'Emissions', title = 'Emissions by coal type')

dev.off()
#End

dev.off()
