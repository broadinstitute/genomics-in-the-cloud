# plotting.R script loads ggplot and gridExtra libraries and defines functions to plot variant annotations 
library(ggplot2)
install.packages("gridExtra")
library(gridExtra)

require(ggplot2, quietly = TRUE)
require(gridExtra, quietly = TRUE)

get_legend<-function(myggplot){
  tmp <- ggplot_gtable(ggplot_build(myggplot))
  leg <- which(sapply(tmp$grobs, function(x) x$name) == "guide-box")
  legend <- tmp$grobs[[leg]]
  return(legend)
}


# Function for making density plots of a single annotation
makeDensityPlot <- function(dataframe, xvar, split, xmin=min(dataframe[xvar], na.rm=TRUE), xmax=max(dataframe[xvar], na.rm=TRUE), alpha=0.5) {
  
  if(missing(split)) {
    return(ggplot(data=dataframe, aes_string(x=xvar)) + xlim(xmin,xmax) + geom_density() )
  }
  else {
    return(ggplot(data=dataframe, aes_string(x=xvar, fill=split)) + xlim(xmin,xmax) + geom_density(alpha=alpha) )
  }
}

# Function for making scatter plots of two annotations
makeScatterPlot <- function(dataframe, xvar, yvar, split, xmin=min(dataframe[xvar], na.rm=TRUE), xmax=max(dataframe[xvar], na.rm=TRUE), ymin=min(dataframe[yvar], na.rm=TRUE), ymax=max(dataframe[yvar], na.rm=TRUE), ptSize=1, alpha=0.6) {
  if(missing(split)) {
    return(ggplot(data=dataframe) + aes_string(x=xvar, y=yvar) + xlim(xmin,xmax) + ylim(ymin,ymax) + geom_point(size=ptSize, alpha=alpha) )
  }
  else {
    return(ggplot(data=dataframe) + aes_string(x=xvar, y=yvar) + aes_string(color=split) + xlim(xmin,xmax) + ylim(ymin,ymax) + geom_point(size=ptSize, alpha=alpha) )
  }
}

# Function for making scatter plots of two annotations with marginal density plots of each
makeScatterPlotWithMarginalDensity <- function(dataframe, xvar, yvar, split, xmin=min(dataframe[xvar], na.rm=TRUE), xmax=max(dataframe[xvar], na.rm=TRUE), ymin=min(dataframe[yvar], na.rm=TRUE), ymax=max(dataframe[yvar], na.rm=TRUE), ptSize=1, ptAlpha=0.6, fillAlpha=0.5) {
  empty <- ggplot()+geom_point(aes(1,1), colour="white") +
    theme(
      plot.background = element_blank(), 
      panel.grid.major = element_blank(), 
      panel.grid.minor = element_blank(), 
      panel.border = element_blank(), 
      panel.background = element_blank(),
      axis.title.x = element_blank(),
      axis.title.y = element_blank(),
      axis.text.x = element_blank(),
      axis.text.y = element_blank(),
      axis.ticks = element_blank()
    )
  
  if(missing(split)){
    scatter <- ggplot(data=dataframe) + aes_string(x=xvar, y=yvar) + geom_point(size=ptSize, alpha=ptAlpha) + xlim(xmin,xmax) + ylim(ymin,ymax) 
    plot_top <- ggplot(data=dataframe, aes_string(x=xvar)) + geom_density(alpha=fillAlpha) + theme(legend.position="none") + xlim(xmin,xmax) 
    plot_right <- ggplot(data=dataframe, aes_string(x=yvar)) + geom_density(alpha=fillAlpha) + coord_flip() + theme(legend.position="none") + xlim(ymin,ymax) 
  } 
  else{
    scatter <- ggplot(data=dataframe) + aes_string(x=xvar, y=yvar) + geom_point(size=ptSize, alpha=ptAlpha, aes_string(color=split)) + xlim(xmin,xmax) + ylim(ymin,ymax) 
    plot_top <- ggplot(data=dataframe, aes_string(x=xvar, fill=split)) + geom_density(alpha=fillAlpha) + theme(legend.position="none") + xlim(xmin,xmax) 
    plot_right <- ggplot(data=dataframe, aes_string(x=yvar, fill=split)) + geom_density(alpha=fillAlpha) + coord_flip() + theme(legend.position="none") + xlim(ymin,ymax) 
  }
  legend <- get_legend(scatter)
  scatter <- scatter + theme(legend.position="none")
  temp <- grid.arrange(plot_top, legend, scatter, plot_right, ncol=2, nrow=2, widths=c(4,1), heights=c(1,4))
  return(temp)
}