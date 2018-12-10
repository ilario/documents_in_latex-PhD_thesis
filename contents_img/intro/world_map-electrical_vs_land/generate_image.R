library(rworldmap)
library(RColorBrewer)

a=read.csv("electrical_vs_land.csv", header=T)
#names(a) = c("Country", )
b=joinCountryData2Map(a, joinCode="NAME", nameJoinColumn="country", verbose=T)

pdf("world_map-electrical_vs_land.pdf", width=6, height=2, pointsize=7)
op <- par(mar=c(1,0,2,4))
mapCountryData(b, nameColumnToPlot="consumption.over.land.area", colourPalette=brewer.pal(9, "YlGnBu"), mapTitle="", missingCountryCol="gray", lwd=0.001, numCats=9, xlim=c(-180, 180), ylim=c(-40, 56), aspect="variable", addLegend=F)

dataCategorised <- b@data[["consumption.over.land.area"]]
cutVector <- rwmGetClassBreaks(dataCategorised, catMethod = "quantiles", numCats = 9, verbose = TRUE)

addMapLegend(colourVector = brewer.pal(9, "YlGnBu"), cutVector = cutVector, legendLabels = "all", labelFontSize = 1, legendWidth = 1, legendShrink = 0.9, legendMar = 5, horizontal = F, tcl = -0.5, mgp = c(3, 1, 0), sigFigs = 1, digits = 3, legendIntervals = "page", plottedData = "", catMethod = "pretty", colourPalette = brewer.pal(9, "YlGnBu"), legendArgs=c(mtext(bquote(bold("kWh y"^"-1"*" km"^"-2")), side=3, adj=0.3, padj=-0.5, cex=1)))
graphics.off()
par(op)
