#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
#in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037").
#Which city has seen greater changes over time in motor vehicle emissions?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle6 <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
scc6.1 <- SCC[vehicle5,]$SCC
nei6 <- NEI[NEI$SCC %in% scc5.1,]
neibalt6 <- nei5[nei5$fips =="24510",]
neila6 <- nei5[nei5$fips =="06037",]
databalt6 <- aggregate(neibalt6$Emissions,by = list(neibalt6$year), FUN = sum)
datala6 <- aggregate(neila6$Emissions,by = list(neila6$year), FUN = sum)
colnames(databalt6) <- c("year","PM2.5emission")
databalt6$city <- c("Baltimore", "Baltimore", "Baltimore", "Baltimore")
colnames(datala6) <- c("year","PM2.5emission")
datala6$city <- c("Los Angeles", "Los Angeles", "Los Angeles", "Los Angeles")
data6 <- rbind(databalt6, datala6)


plot6 <- ggplot(data = data6) +
        geom_bar(aes(x = year,
                     y = PM2.5emission,
                     fill = city,
                     color = city),
                 stat = "identity",position = position_dodge())
plot6 +labs(title= "vhicle emissons changes in Baltimore and Los Angeles")