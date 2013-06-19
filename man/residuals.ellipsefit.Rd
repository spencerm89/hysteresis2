\name{residuals.ellipsefit}
\alias{residuals.ellipsefit}
\alias{residuals.ellipsesummary}
\alias{residuals.fittedloop}
\alias{residuals.loopsummary}
\alias{residuals.ellipsefitlist}
\alias{residuals.ellipsesummarylist}
\alias{residuals.fittedlooplist}
\alias{residuals.loopsummarylist}
\alias{rstudent.ellipsefit}
\alias{rstudent.ellipsesummary}
\alias{rstudent.fittedloop}
\alias{rstudent.loopsummary}
\alias{rstudent.ellipsefitlist}
\alias{rstudent.ellipsesummarylist}
\alias{rstudent.fittedlooplist}
\alias{rstudent.loopsummarylist}
\alias{fitted.ellipsefit}
\alias{fitted.ellipsesummary}
\alias{fitted.fittedloop}
\alias{fitted.loopsummary}
\alias{fitted.ellipsefitlist}
\alias{fitted.ellipsesummarylist}
\alias{fitted.fittedlooplist}
\alias{fitted.loopsummarylist}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Extract input, output, geometric and algebraic residuals and fitted values from fitted loops or ellipses. 
}
\usage{
residuals(g)
rstudent(g)
fitted(g)
}
\arguments{
  \item{g}{
an object created by \code{\link{fel}} or \code{\link{floop}}.
}
}
\details{
Geometric residuals are based on the straight line distance between predicted and true values along an x,y cartesian plane, and algebraic residuals are based on the method used to calculate the \code{ellipsefit} object. If method="harmonic2" (which is always the case if this is a \code{fittedloop} object) or if bootstrapping has occurred then there are no algebraic residuals, and \code{residuals.ellipsefit} replaces these with the geometric residuals.

Studentization for the \code{rstudent} function is performed as if method="harmonic2" regardless of the method used for fitting the ellipse/loop. Therefore, unless method="harmonic2" and no bootstrapping is performed, these are pseudo-studentized residuals, not true studentized residuals. This is internal scaling studentization.
}
\value{
  \item{input}{a numeric vector. Observed input - fitted input for residuals.}
  \item{output}{a numeric vector. Observed output - fitted output for residuals.}
  \item{geometric}{a numeric vector. Not available with rstudent. See details.}
  \item{algebraic}{a numeric vector. Not available with rstudent or when the 'harmonic2' method is used. See details.}
}
\references{
Yang, F. and A. Parkhurst, Estimating Elliptical Hysteresis: A Comparison of Analytic Methods. (submitted)
}
\author{
Spencer Maynes, Fan Yang, and Anne Parkhurst.
}
\seealso{
\code{\link{fel}}, \code{\link{floop}}, \code{\link{summary.ellipsefit}} and \code{\link{summary.fittedloop}}.
}
\examples{
ellipse1 <- mel(sd.x=0.2,sd.y=0.04)
ellipse1.fit <- fel(ellipse1$x,ellipse1$y)
resid(ellipse1.fit)
fitted(ellipse1.fit)
ellipseresid<-resid(ellipse1.fit)
plot(ellipse1.fit,main="Simulated Ellipse")
scatterplotMatrix(cbind(ellipseresid$input,ellipseresid$output,fitted(ellipse1.fit)$input,fitted(ellipse1.fit)$output),smooth=FALSE,var.labels=c("Input Resid", "Output Resid", "Fitted Input", "Fitted Output"))
scatterplotMatrix(cbind(ellipseresid$geometric,fitted(ellipse1.fit)$input,fitted(ellipse1.fit)$output),smooth=FALSE,var.labels=c("Geometric Resid", "Fitted Input", " Fitted Output"))
qqnorm(ellipseresid$output)
qqline(ellipseresid[,"output"],col="red")

##For multiple loops/ellipses
data(HysteresisData)
models <- floop.repeated(HysteresisData$X, HysteresisData$Y, n=5,m=3, subjects = HysteresisData$subjects,subjects.in=c("A"),repeated=HysteresisData$repeated)
multresids <- residuals(models)
scatterplotMatrix(cbind(multresids$geometric,fitted(models)$input,fitted(models)$output),smooth=FALSE,var.labels=c("Geometric Resid", "Fitted Input", "Fitted Output"),groups=multresids$repeated)

}
\keyword{ models }

