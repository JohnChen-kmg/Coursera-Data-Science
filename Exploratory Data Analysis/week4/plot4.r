#4. Across the United States, how have emissions from coal combustion-related sources
#changed from 1999–2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

comb4 <- grepl("Comb", SCC$SCC.Level.Four, ignore.case = TRUE)
coal4 <- grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE)
coalmb <- (comb4 & coal4)
scc4.1 <- SCC[coalmb,]$SCC
nei4 <- NEI[NEI$SCC %in% scc4.1,]

data4 <- aggregate(nei4$Emissions,by = list(nei4$year), FUN = sum)
colnames(data4) <- c("year","PM2.5emission")
png("plot4")
barplot(height = data4$PM2.5emission,names = data4$year,names.arg=c("1999","2002","2005","2008"),
        main = "emissions from coal combustion-related sources", xlab="year")
dev.off()


