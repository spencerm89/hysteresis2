\name{floop.repeated}
\alias{floop.repeated}
\alias{summary.fittedlooplist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Methods for easily fitting multiple loops from repeated measures designs.
}  
\description{
Fit a sinusoidal hysteretic process between an input and an output variable across multiple loops separated by subjects and repeated.
}
\usage{
floop.repeated(x,y=NULL,m=1,n=1,subjects=NULL,repeated=NULL,subjects.in=NULL,repeated.in=NULL,boot=FALSE,...)
summary.fittedlooplist(g)
}
\arguments{
  \item{x}{
numeric input vector.
}
  \item{y}{
numeric output vector.
}
  \item{m}{
positive odd integer. Loop shape parameter, see \code{\link{loop.parameters}}.
}
  \item{n}{
positive integer. Loop shape parameter, see \code{\link{loop.parameters}}.
}
  \item{subjects}{
factor of the same length as x that represents experimental units.
}
  \item{repeated}{
factor of the same length as x that represents the repeated measure.
}
  \item{subjects.in}{
a vector of characters, the levels of \code{subjects} to be included. Default is "all".
}
   \item{repeated.in}{
a vector of characters, the levels of \code{repeated} to be included. Default is "all".
}
   \item{g}{
an \code{fittedlooplist} object.
}
   \item{N}{
Number of bootstrap replicates.
}
   \item{boot}{
whether to use bootstrapping to obtain standard errors and less biased parameter estimates.
}
  \item{...}{
extra arguments to either  \code{\link{floop}} or \code{\link{summary.fittedlooplist}}.
}
}
\details{
Fits multiple loops with one call, separated by the factors \code{subjects} and \code{repeated}. The arguments \code{subjects.in} and \code{repeated.in} are used to select subsets of the factors \code{subjects} and \code{repeated}.
}
\value{

 \code{floop.repeated} returns an object of class \code{fittedlooplist}.
    \item{models}{Separate model fits for each loop, see \code{\link{floop}}.}
    \item{Estimates}{Parameter estimates for all loops in matrix form.}
    \item{Std.Errors}{Standard errors for all loops in matrix form.}
    \code{summary.fittedlooplist} returns an object of class \code{loopsummarylist} which consists of
    \item{models}{Separate model summaries for each ellipse, see \code{\link{summary.fittedloop}}.}
    \item{values}{Bootstrapped parameter estimates, standard errors, quantiles, and more for each loop.}
    \item{Boot.Estimates}{Bootstrapped parameter estimates with reduced bias.}
    \item{Boot.Std.Errors}{Standard errors provided by bootstrapping.}
    \item{Delta.Std.Errors}{Standard errors provided by the delta method.}
}
\references{
Yang, F. and A. Parkhurst, Efficient Estimation of Elliptical Hysteresis (submitted)
}
\author{
Spencer Maynes, Fan Yang, and Anne Parkhurst.
}
\seealso{
\code{\link{floop}} and \code{\link{summary.fittedloop}}, also  \code{\link{fel.repeated}} and \code{\link{summary.ellipsefitlist}}. 
}
\examples{
data(HysteresisData)
models <- floop.repeated(HysteresisData$X, HysteresisData$Y, n=5,m=3, subjects = HysteresisData$subjects,subjects.in=c("A","C"),repeated=HysteresisData$repeated)
models
summodels<-summary(models)
summodels
summodels$models["A",1]
par(mfrow=c(2,2))
plot(models)
par(mfrow=c(1,1))

#Alternatively
boot.rep.loop=floop.repeated(HysteresisData$X, HysteresisData$Y, n=5,m=3, subjects = HysteresisData$subjects,subjects.in=c("A","C"),repeated=HysteresisData$repeated,boot=TRUE,seed=123)
boot.rep.loop 
boot.rep.loop$Boot.Estimates  #list Bootstrap Estimates
boot.rep.loop$Boot.Std.Errors #list Bootstrap Standard Errors

##Can write results to a file. First set your directory from the file tab.
##write.table(boot.rep.loop$Boot.Estimates,"Hys.eg.bootvalues.txt")
}
\keyword{ models }

