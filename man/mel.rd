\name{mel}
\alias{mel}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Simulate (Make) an Ellipse
}
\description{
Produces an ellipse based on 1 of 4 possible formulations: 1-Eigenvalues, 2-Hysteresis Coefs, 3-Amplitudes and 4-Algebraic Coefs.
}
\usage{
mel(cx=32,cy=39,rotated.angle=2,semi.major=7,semi.minor=0.23,n.points=24,period=24,sd.x=0,sd.y=0)
mel(method=2,cx=32,cy=39,b.x=6.99,b.y=0.244,retention=0.23,phase.angle=1.57,n.points=24,period=24,sd.x=0,sd.y=0)
mel(method=3,cx=32,cy=39,ampx=6.99,ampy=0.335,lag=2.888,n.points=24,period=24,sd.x=0,sd.y=0)
mel(x2=0.002293,xy=-.06960,y2=0.9976,x=2.567,y=-75.58,int=1432.7,
                 phase.angle=0,n.points=24,period=24,sd.x=0,sd.y=0)
}

\arguments{
  \item{method}{
One of 1,2,3 or 4. If \code{method=1}; \code{semi.major}, \code{semi.minor} and \code{rote.deg} are the elliptical parameters used. If \code{method=2}; \code{b.x}, \code{b.y} and \code{retention} are used instead.
 The third option \code{method=3} uses the easiest to understand parameters \code{ampx}, \code{ampy}, and \code{lag}. If \code{method=4}, coefficients to the variables
 : x^2, xy, y^2, \code{x}, \code{y} and a vector of 1's for \code{int} are used. 
 Default is \code{method=1}.
}
  \item{cx}{
center of input x.
}
  \item{cy}{
center of output y.
}
  \item{phase.angle}{
defines the starting point of the ellipse. Does not change ellipse shape.
}
  \item{rote.deg}{
Theta, angle of rotation. In degrees. Only used if \code{method=1}.
}
  \item{semi.major}{
length of major axis. Only used if \code{method=1}.
}
  \item{semi.minor}{
length of minor axis. Only used if \code{method=1}.
}
  \item{b.x}{
saturation point x coordinate. Only used if \code{method=2}.
}
  \item{b.y}{
saturation point y coordinate. Only used if \code{method=2}.
}
  \item{retention}{
another ellipse parameter used if \code{method=2}. split point, representing vertical distance from center to upper loop trajectory. It is the intersection of the loop and the output axis characterizing the distortion in the response at the average input challenge.}
  \item{ampx}{
The range of the ellipse input values divided by 2. Only used if \code{method=3}.
}
  \item{ampy}{
The range of the ellipse output values divided by 2. Only used if \code{method=3}.
}
  \item{lag}{
The number of points between the location where the input reaches its maximum value and where the output reaches its maximum value.
 Lag is therefore dependent on the value chosen for period. Only used if \code{method=3}. 
}
  \item{n.points}{
number of points on ellipse. Equally spaced around circumference of ellipse/period.
}
  \item{period}{
number of points required to make a full loop around the ellipse.
}
  \item{sd.x}{
optional number specifying a normally distributed standard deviation for x.
}
  \item{sd.y}{
optional number specifying a normally distributed standard deviation for y.
}
}
\details{
All of the four methods can be used to specify a series of points that make up an ellipse. The function \code{mel}
uses parameters to form an ellipse and find derived variables such as area, lag, retention, and coercion. 
Optionally, normally distributed random variation can be introduced in both the x and y directions. The first method is useful alongside the nls, lm and direct fitting methods,
while the second is comparable to the harmonic2 ellipse fitting method. The third method for mel is included because it is the easiest to interpret. Finally the fourth method uses the equation 0=a0+a1*x^2+a2*xy+a3*y^2+a4*x+a5*y to form an ellipse. The "a" parameters here are marked as int, x2, xy, y2, x and y in the function itself.}
\value{
mel returns an object of class \code{ellipsemake}.
  \item{values}{the nine fundamental parameters (cx,cy,rote.deg,semi.major,semi.minor,b.x,b.y,a,phase.angle) of which only four or five are used 
  along with the four derived parameters (area, lag, retention, coercion).}
  \item{method}{the method used.}
  \item{x}{the input x.}
  \item{y}{the output y.}
}
\references{
Yang, F. and A. Parkhurst, Efficient Estimation of Elliptical Hysteresis. (submitted)
}
\author{
Spencer Maynes, Fan Yang, and Anne Parkhurst.
}
\seealso{
\code{\link{fel}} for fitting observations that form an ellipse and creating an \code{ellipsefit} object, \code{\link{plot.ellipsefit}}for plotting an \code{ellipsefit} object.
\code{\link{summary.ellipsefit}} for summarizing an \code{ellipsefit} object, and \code{\link{plot.ellipsesummary}} for plotting an \code{ellipsesummary} object.  
}
\examples{
ellipseA <- mel(method=3,cx=35, cy=39, ampx=7, ampy=2, lag=3, sd.x=0.2,sd.y=0.04)
 ellipseA.fit <- fel(ellipseA$x,ellipseA$y)
  plot(ellipseA.fit,xlab="Input",ylab="Output",main="Simulated Ellipse", putNumber=TRUE)
 boot.ellipseA.fit <- fel(ellipseA$x,ellipseA$y, boot=TRUE, seed=231)
  plot(boot.ellipseA.fit,xlab="Input",ylab="Output",main="Bootstrapped Ellipse",values="ellipse.all")

ellipse.eig <- mel(semi.major=7,semi.minor=4,rote.deg=30)
ellip.eigen.fit <- fel(ellipse.eig$x,ellipse.eig$y)
ellip.eigen.fit$Estimates
plot(ellip.eigen.fit,main="Ellipse from Eigenvalue Parameters",show=c("semi.major","semi.minor","rote.deg"),values="ellipse")
}
\keyword{ models }
