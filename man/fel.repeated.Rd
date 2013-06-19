\name{fel.repeated}
\alias{fel.repeated}
\alias{summary.ellipsefitlist}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Methods for easily fitting multiple ellipses from repeated measures designs.
}  
\description{
Fit a sinusoidal hysteretic process between an input and an output variable across multiple loops separated by subjects and repeated.
}
\usage{
fel.repeated(x,y=NULL,subjects=NULL,repeated=NULL,subjects.in=NULL,repeated.in=NULL,boot=FALSE,...)
summary.ellipsefitlist(g,N=1000,boot=TRUE,...)


}
\arguments{
  \item{x}{
numeric input vector.
}
  \item{y}{
numeric output vector.
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
an \code{ellipsefitlist} object.
}
   \item{N}{
Number of bootstrap replicates.
}
   \item{boot}{
whether to use bootstrapping to obtain standard errors and less biased parameter estimates.
}
  \item{...}{
extra arguments to either \code{\link{fel}} or \code{\link{summary.ellipsefitlist}.}
}
}
\details{
Fits multiple ellipses with one call, separated by the factors \code{subjects} and \code{repeated}. The arguments \code{subjects.in} and \code{repeated.in} are used to select subsets of the factors \code{subjects} and \code{repeated}.
}
\value{
\code{fel.repeated} returns an object of class \code{ellipsefitlist}.
    \item{models}{Separate model fits for each ellipse, see \code{\link{fel}}.}
    \item{Estimates}{Parameter estimates for all ellipses in matrix form.}
    \item{Std.Errors}{Standard errors for all ellipses in matrix form.}
    \code{summary.ellipsefitlist} returns an object of class \code{ellipsesummarylist} which consists of
    \item{models}{Separate model summaries for each ellipse, see \code{\link{summary.ellipsefit}}.}
    \item{values}{Bootstrapped parameter estimates, standard errors, quantiles, and more for each ellipse.}
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
\code{\link{fel}} for a more general way to fit multiple ellipses, or for fitting just one ellipse. \code{\link{plot.ellipsefit}} for plotting and \code{\link{summary.ellipsefit}} for summarizing and bootstrapping an \code{ellipsefitlist} object.  
}
\examples{
data(EllipseData) 
models <- fel.repeated(EllipseData$X, EllipseData$Y, method = "harmonic2", subjects = EllipseData$subjects,subjects.in=c("A","C"),repeated=EllipseData$repeated)
models

summodels <- summary(models,N=1000,seed=25)
##Or alternatively
summodels=fel.repeated(EllipseData$X, EllipseData$Y,method = "harmonic2", subjects =
EllipseData$subjects,subjects.in=c("A","C"),repeated=EllipseData$repeated,boot=TRUE,N=1000,seed=25)

summodels
summodels$Boot.Estimates
summodels$Boot.Std.Errors
summodels$models["A",1]
par(mfrow=c(2,2))
plot(models)
par(mfrow=c(1,1))

##Can write results to a file. First set your directory from the file tab.
##write.table(summodels$Boot.Estimates,"Hys.eg.bootvalues.txt")
}
\keyword{ models }

