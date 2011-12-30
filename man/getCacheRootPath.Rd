%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  getCacheRootPath.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{getCacheRootPath}
\alias{getCacheRootPath.default}
\alias{getCacheRootPath}

\title{Gets the root path to the file cache directory}

\description{
 Gets the root path to the file cache directory.
}

\usage{\method{getCacheRootPath}{default}(defaultPath="~/.Rcache", ...)}

\arguments{
  \item{defaultPath}{The default path, if no user-specified directory
    has been given.}
  \item{...}{Not used.}
}

\value{
  Returns the path as a \code{\link[base]{character}} string.
}

\examples{
  print(getCacheRootPath())
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
 Too set the directory where cache files are stored,
 see \code{\link{setCacheRootPath}}().
}



\keyword{programming}
\keyword{IO}
