%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  loadCache.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{loadCache}
\alias{loadCache.default}
\alias{loadCache}

\title{Loads data from file cache}

\description{
 Loads data from file cache, which is unique for an optional key object.
}

\usage{\method{loadCache}{default}(key=NULL, sources=NULL, suffix=".Rcache", removeOldCache=TRUE, pathname=NULL, dirs=NULL, ..., onError=c("warning", "print", "quiet", "error"))}

\arguments{
  \item{key}{An optional object from which a hexadecimal hash
    code will be generated and appended to the filename.}
  \item{sources}{Optional source objects.  If the cache object has a
    timestamp older than one of the source objects, it will be ignored
    and removed.}
  \item{suffix}{A \code{\link[base]{character}} string to be appended to the end of the
    filename.}
  \item{removeOldCache}{If \code{\link[base:logical]{TRUE}} and the cache is older than the
    \code{sources}, the cache file is removed, otherwise not.}
  \item{pathname}{The pathname to the cache file.  If specified,
    arguments \code{key} and \code{suffix} are ignored.  Note that
    this is only needed in order to read a cache file for which
    the key is unknown, for instance, in order to investigate
    an unknown cache file.}
  \item{dirs}{A \code{\link[base]{character}} \code{\link[base]{vector}} constituting the path to the
     cache subdirectory (of the \emph{cache root directory}
     as returned by \code{\link{getCacheRootPath}}()) to be used.
     If \code{\link[base]{NULL}}, the path will be the cache root path.}
  \item{...}{Additional argument passed to \code{\link[base]{load}}().}
  \item{onError}{A \code{\link[base]{character}} string specifying what the action is
     if an exception is thrown.}
}

\value{
  Returns an \R object or \code{\link[base]{NULL}}, if cache does not exist.
}

\details{
  The hash code calculated from the \code{key} object is a
  32 characters long hexadecimal MD5 hash code.  For more details,
  see the \emph{digest} package.
}

\section{Requirements}{
 To make use of the \code{key} argument, the \emph{digest} package
 (available on CRAN) must be installed, otherwise an error is generated.
 That package is not required when \code{key==NULL}.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\examples{
simulate <- function(mean, sd) {
  # 1. Try to load cached data, if already generated
  key <- list(mean, sd)
  data <- loadCache(key)
  if (!is.null(data)) {
    cat("Loaded cached data\n")
    return(data);
  }

  # 2. If not available, generate it.
  cat("Generating data from scratch...")
  data <- rnorm(1000, mean=mean, sd=sd)
  Sys.sleep(1)             # Emulate slow algorithm
  cat("ok\n")
  saveCache(data, key=key, comment="simulate()")

  data;
}

data <- simulate(2.3, 3.0)
data <- simulate(2.3, 3.5)
data <- simulate(2.3, 3.0) # Will load cached data

# Clean up
file.remove(findCache(key=list(2.3,3.0)))
file.remove(findCache(key=list(2.3,3.5)))
}

\seealso{
 \code{\link{saveCache}}().
}



\keyword{programming}
\keyword{IO}
