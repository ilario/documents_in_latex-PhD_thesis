library(rworldmap)
library(RColorBrewer)

a=read.csv("HumanDevelopmentIndex.csv", header=F )
names(a) = c("Country", "HDI")
b=joinCountryData2Map(a, joinCode="NAME", nameJoinColumn="Country", verbose=T)

pdf("world_map-HDI.pdf", width=6, height=2, pointsize=7)
op <- par(mar=c(1,0,2,4))
mapCountryData(b, nameColumnToPlot="HDI", colourPalette=brewer.pal(9, "YlGnBu"), mapTitle="", missingCountryCol="gray", lwd=0.001, numCats=9, xlim=c(-180, 180), ylim=c(-40, 56), addLegend=F, aspect="variable")
graphics.off()
par(op)
