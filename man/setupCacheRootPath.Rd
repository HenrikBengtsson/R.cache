%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  setupCacheRootPath.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{setupCacheRootPath}
\alias{setupCacheRootPath.default}
\alias{setupCacheRootPath}

\title{Interactively offers the user to set up the default root path}

\description{
 Interactively offers the user to set up the default root path.
}

\usage{\method{setupCacheRootPath}{default}(defaultPath="~/.Rcache/", ...)}

\arguments{
  \item{defaultPath}{Default root path to set.}
  \item{...}{Not used.}
}

\value{
  Returns (invisibly) the root path,
  or \code{\link[base]{NULL}} if running a non-interactive session.
}

\details{
  If the cache root path is already set, it is used and nothing is done.
  If the "default" root path (\code{defaultPath}) exists, it is used,
  otherwise, if running interactively, the user is asked to approve
  the usage (and creation) of the default root path.
  In all other cases, the cache root path is set to a session-specific
  temporary directory.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
 Internally, \code{\link{setCacheRootPath}}() is used to set the cache root path.
 The \code{\link[base]{interactive}}() function is used to test whether \R is
 running interactively or not.
}




\keyword{programming}
\keyword{IO}
\keyword{internal}
