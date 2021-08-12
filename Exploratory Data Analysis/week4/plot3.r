#3.Of the four types of sources indicated by the \color{red}{\verb|type|}
#type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen
#decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in 
#emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this 
#question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

databalt3 <- NEI[NEI$fips =="24510",]
library(ggplot2)
png("plot3.png")
ggplot(databalt3,aes(factor(year),Emissions) ,fill = type) + geom_bar(stat = "identity")+facet_grid(.~ type)
dev.off()