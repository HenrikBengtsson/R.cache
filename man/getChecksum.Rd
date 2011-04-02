%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  getChecksum.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{getChecksum}
\alias{getChecksum.default}
\alias{getChecksum}

\title{Generates a deterministic checksum for an R object}

\description{
 Generates a deterministic checksum for an R object such that (i) if the same object is used again, then
 the same checksum is obtained, and (ii) if another object is used,
 then a different checksum is obtained with extremely high probability.
 In other words, it is highly unlikely that two different objects
 have the same checksum.
}

\usage{\method{getChecksum}{default}(object, ...)}

\arguments{
  \item{object}{The object for which a checksum should be calculated.}
  \item{...}{Not used.}
}

\value{
  Returns checksum represented as a \code{\link[base]{character}} string.
}

\details{
  Because \code{getChecksum()} is a generic function,
  it is possible to provide custom methods for specific
  classes of objects.  This means that, if a certain class
  specifies fields that carry auxillary data, then these
  can be excluded from the checksum calculation.
  For instance, assume that all objects of class 'TimestampedObject'
  contain timestamps specifying when each object was created.
  Then a custom \code{getChecksum()} method for this class can
  first drop the timestamp and then call the default
  \code{getChecksum()} function.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  By default, the \code{\link[digest]{digest}} method is used to calculate
  the checksum.
}




\keyword{programming}
\keyword{IO}
\keyword{internal}
