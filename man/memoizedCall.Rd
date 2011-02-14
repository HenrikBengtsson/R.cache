%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  memoizedCall.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{memoizedCall}
\alias{memoizedCall.default}
\alias{memoizedCall}

\title{Calls a function with memoization}

\description{
 Calls a function with memoization, that is, caches the results to be retrieved if
 the function is called again with the exact same arguments.
}

\usage{\method{memoizedCall}{default}(what, ..., envir=parent.frame(), force=FALSE, sources=NULL, dirs=NULL, verbose=FALSE)}

\arguments{
  \item{what}{The \code{\link[base]{function}} to be called, or a \code{\link[base]{character}} string
    specifying the name of the function to be called,
    cf. \code{\link[base]{do.call}}().}
  \item{...}{Arguments passed to the function.}
  \item{envir}{The \code{\link[base]{environment}} in which the function is evaluated.}
  \item{force}{If \code{\link[base:logical]{TRUE}}, any cached results are ignored, otherwise not.}
  \item{sources, dirs}{Optional arguments passed to
    \code{\link{loadCache}}() and \code{\link{saveCache}}().}
  \item{verbose}{If \code{\link[base:logical]{TRUE}}, verbose statements are outputted.}
}

\value{
  Returns the result of the function call.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
 Internally, \code{\link{loadCache}}() is used to load memoized results,
 if available.  If not available, then \code{\link{do.call}}() is used to
 evaluate the function call,
 and \code{\link{saveCache}}() is used to save the results to cache.
}



\keyword{programming}
\keyword{IO}
