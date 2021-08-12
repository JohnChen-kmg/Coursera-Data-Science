#5. How have emissions from motor vehicle sources changed from 1999–2008 in 
#Baltimore City?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle5 <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
scc5.1 <- SCC[vehicle5,]$SCC
nei5 <- NEI[NEI$SCC %in% scc5.1,]
neibalt5 <- nei5[nei5$fips =="24510",]
data5 <- aggregate(neibalt5$Emissions,by = list(neibalt5$year), FUN = sum)
colnames(data5) <- c("year","PM2.5emission")

png("plot5.png")
barplot(height = data5$PM2.5emission,names = data5$year,names.arg=c("1999","2002","2005","2008"),
        main = "emissions from motor vehicle sources changed from 1999–2008 in Baltimore City", 
        xlab="year")
dev.off()

