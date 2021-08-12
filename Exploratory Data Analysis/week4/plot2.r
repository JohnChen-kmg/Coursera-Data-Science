#1. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
#(\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

databalt <- NEI[NEI$fips =="24510",]
data2 <- aggregate(databalt$Emissions,by = list(databalt$year), FUN = sum)
colnames(data2) <- c("year","PM2.5emission")
options("scipen"=100, "digits"=4)
png("plot2.png")
barplot(height = data2$PM2.5emission,names = data2$year,names.arg=c("1999","2002","2005","2008"),
        main = "Baltimore City PM2.5 Emissions", xlab="year")
dev.off()