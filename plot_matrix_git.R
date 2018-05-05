plot.matrix<-function(mat,
                      value.min=min(mat,na.rm=TRUE),value.max=max(mat,na.rm=TRUE),
                      color.min="white",color.max="black",color.na="brown"){  
  layout(matrix(c(1,2),1,2),widths=c(0.8,0.2))
  par(mar=c(2,3,3,0.5)) #par(mgp=c(0,0,0),mar=c(4,4,4,0))
  plot.new()
  mat.nrow<-nrow(mat)
  mat.ncol<-ncol(mat)
  plot.window(xlim=c(0.5,mat.ncol+0.5),ylim=c(mat.nrow+0.5,0.5),
              xaxs="i",yaxs="i")
  mat.row<-as.vector(row(mat))
  mat.col<-as.vector(col(mat))
  
  newmat<-(mat-value.min)/(value.max-value.min)
  color.gen<-colorRamp(c(color.min,color.max),space="rgb")
  color.rgb<-color.gen(as.vector(newmat))
  
  na.occurrence<-!complete.cases(color.rgb)
  if(any(na.occurrence))
    color.rgb[na.occurrence,]<-matrix(col2rgb(color.na),nrow=sum(na.occurrence),ncol=3,byrow=TRUE)
  
  rect(xleft=mat.col-0.5,xright=mat.col+0.5,
       ybottom=mat.row-0.5,ytop=mat.row+0.5,col=rgb(color.rgb,max=255),border=NA)
  axis(side=3,at=1:mat.ncol,labels=1:mat.ncol,tick=F)
  axis(side=2,at=1:mat.nrow,labels=1:mat.nrow,tick=F)
  
  n.breaks=20
  color.breaks<-seq(0,1,length.out=n.breaks+1)
  inter.breaks<-(value.max-value.min)/n.breaks
  value.breaks<-seq(value.min,value.max,length.out=n.breaks+1)
  
  
  par(mar=c(2,0.5,3,3)) #par(mgp=c(0,0,0),mar=c(4,0,4,4))
  plot.new()
  plot.window(xlim=c(0,1),ylim=c(value.min,value.max)+c(-inter.breaks,inter.breaks)/2,
              xaxs="i",yaxs="i")
  
  rect(xleft=rep(0,n.breaks+1),xright=rep(1,n.breaks+1),
       ybottom=value.breaks-inter.breaks/2,ytop=value.breaks+inter.breaks/2,
       col=rgb(color.gen(color.breaks),max=255))
  #rasterImage(c(color.max,color.min),xleft=0,xright=1,ybottom=0,ytop=1)
  axis(side=4,tick=F)
}
