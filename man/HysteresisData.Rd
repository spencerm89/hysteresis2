\name{HysteresisData}
\alias{HysteresisData}
\docType{data}
\title{
Simulated Loop Data for 6 Loops with period=24, n=5 and m=3
}
\description{
6 loops created by mloop. With loop parameters n=5 and m=3. All 6 loops are centered around the origin with a phase angle of pi/2 and differ by subject in terms of their retention and saturation point. Errors in both the input and the output are given a standard deviation of 0.1 for all loops. Used in the help page for \code{\link{floop.repeated}}.
}
\usage{data(HysteresisData)}
\format{
  A data frame with 144 observations on the following 4 variables.
  \describe{
    \item{\code{X}}{a numeric vector}
    \item{\code{Y}}{a numeric vector}
     \item{\code{subjects}}{subject, one of "A", "B", or "C".}
    \item{\code{repeated}}{which replication within subject. Either 1 or 2.}
  }
}
\examples{
##Created using
set.seed(1)
loop1 <- mloop(n=5,m=3, retention = 0.4, b.x = 0.6, b.y = 0.8, cx = 0, cy = 0, 
    sd.x = 0.1, sd.y = 0.1, period = 24, n.points = 48, phase.angle = pi/2)
loop2 <- mloop(n=5,m=3, retention = 0.8, b.x = 0.6, b.y = 0.8, cx = 0, cy = 0, 
    sd.x = 0.1, sd.y = 0.1, period = 24, n.points = 48, phase.angle = pi/2)
loop3 <- mloop(n=5,m=3, retention = 0.4, b.x = 1, b.y = 0.8, cx = 0, cy = 0, 
    sd.x = 0.1, sd.y = 0.1, period = 24, n.points = 48, phase.angle = pi/2)
X <- c(loop1$x, loop2$x, loop3$x)
Y <- c(loop1$y, loop2$y, loop3$y)
subjects <- c(rep("A", length(loop1$x)), rep("B", length(loop2$x)), rep("C", 
    length(loop3$x)))  
    repeated <- rep(c(1,2),each=24,times=3)  
    
##Use
    
data(HysteresisData)
models <- floop.repeated(HysteresisData$X, HysteresisData$Y, n=5,m=3, subjects = HysteresisData$subjects,subjects.in=c("A","C"),repeated=HysteresisData$repeated)
models
summodels<-summary(models)
summodels
summodels$models["A",1]
par(mfrow=c(2,3))
plot(models)
}
\keyword{datasets}
