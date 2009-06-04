%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  findCache.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{findCache}
\alias{findCache.default}
\alias{findCache}

\title{Locates a cache file}

\description{
 Locates a cache file from a key object.
}

\usage{\method{findCache}{default}(key=NULL, ...)}

\arguments{
  \item{key}{An optional object from which a hexadecimal hash
    code will be generated and appended to the filename.}
  \item{...}{Additional argument passed to \code{\link{generateCache}}().}
}

\value{
  Returns the pathname as a \code{\link[base]{character}}, or \code{\link[base]{NULL}} if the no cached
  data exists.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
 \code{\link{generateCache}}().
 \code{\link{loadCache}}().
}




\keyword{programming}
\keyword{IO}
\keyword{internal}
