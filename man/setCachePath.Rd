%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  setCachePath.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{setCachePath}
\alias{setCachePath.default}
\alias{setCachePath}

\title{Sets the path to the file cache directory}

\description{
 Sets the path to the file cache directory.
}

\usage{\method{setCachePath}{default}(dirs=NULL, path=NULL, ...)}

\arguments{
  \item{dirs}{A \code{\link[base]{character}} \code{\link[base]{vector}} constituting the path to the
     cache subdirectory of interest.}
  \item{path}{The path to override the path according to the
     \code{dirs} argument.}
  \item{...}{Not used.}
}

\value{
  Returns nothing.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
  \code{\link{getCachePath}}().
}




\keyword{programming}
\keyword{IO}
\keyword{internal}
