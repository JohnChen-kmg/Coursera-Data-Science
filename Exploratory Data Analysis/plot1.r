#1, Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission from all
#sources for each of the years 1999, 2002, 2005, and 2008.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data1 <- aggregate(NEI$Emissions,by = list(NEI$year), FUN = sum)
colnames(data1) <- c("year","PM2.5emission")
options("scipen"=100, "digits"=4)
png("plot1.png")
barplot(height = data1$PM2.5emission,names = data1$year,names.arg=c("1999","2002","2005","2008"),
        main = "National PM2.5 Emissions", xlab="year")
dev.off()
