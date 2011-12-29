%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  setCacheRootPath.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{setCacheRootPath}
\alias{setCacheRootPath.default}
\alias{setCacheRootPath}

\title{Sets the root path to the file cache directory}

\description{
 Sets the root path to the file cache directory.
 By default, this function will set it to \code{~/.Rcache/}.
}

\usage{\method{setCacheRootPath}{default}(path="~/.Rcache", ...)}

\arguments{
  \item{path}{The path.}
  \item{...}{Not used.}
}

\value{
  Returns (invisibly) the old root path.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
 \code{\link{getCacheRootPath}}().
}



\keyword{programming}
\keyword{IO}
