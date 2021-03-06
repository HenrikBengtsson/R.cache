%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  generateCache.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{generateCache}
\alias{generateCache.default}
\alias{generateCache}

\title{Generates a cache pathname from a key object}

\description{
 Generates a cache pathname from a key object.
}

\usage{
\method{generateCache}{default}(key, suffix=".Rcache", ...)
}

\arguments{
  \item{key}{A \code{\link[base]{list}} or an \code{\link[base]{environment}} from which a \code{\link[base]{character}} string
    checksum will be calculated and that will constitute the name part
    of the cache filename.}
  \item{suffix}{A \code{\link[base]{character}} string to be appended to the end of the
    filename.}
  \item{...}{Arguments passed to \code{\link{getCachePath}}().}
}

\value{
  Returns the pathname as a \code{\link[base]{character}} string.
}

\author{Henrik Bengtsson}

\seealso{
  \code{\link{findCache}}().
  Internally, the generic function \code{\link{getChecksum}}() is used to
  calculate the checksum of argument \code{key}.
}




\keyword{programming}
\keyword{IO}
\keyword{internal}
