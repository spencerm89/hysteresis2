directboot <-
function(j=NULL,wr1,wr2,x.pred,y.pred,n,cbb,joint){
  if (is.numeric(cbb)==TRUE) {
    xresid2 <- c(wr1,wr1)
    yresid2 <- c(wr2,wr2)
    k <- n/cbb
    xblocks <- sample(1:n,k,replace=TRUE)
    if (joint==FALSE) yblocks <- sample(1:n,k,replace=TRUE)
    else yblocks <-xblocks
    xressamp <- c(t(outer(xblocks,0:(cbb-1),FUN="+")))
    yressamp <- c(t(outer(yblocks,0:(cbb-1),FUN="+")))
    y.boot<-yresid2[yressamp]+y.pred
    x.boot<-xresid2[xressamp]+x.pred
  }
  else {
    if (joint==FALSE) {
    rx <- sample(wr1,n,replace=TRUE)
    ry <- sample(wr2,n,replace=TRUE) }
    else {
      index <- sample(1:n,n,replace=TRUE)
      rx <- wr1[index]
      ry <- wr2[index]
    }
    x.boot<-rx +  x.pred
    y.boot<-ry +  y.pred
  }
          results <- direct(x.boot,y.boot)   
          z <- c("cx"=cx,"cy"=cy,"theta"=theta,"semi.major"=semi.major,"semi.minor"=semi.minor,"rote.deg"=rotated.angle)
          z
      }
