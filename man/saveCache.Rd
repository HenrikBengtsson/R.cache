%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  saveCache.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{saveCache}
\alias{saveCache.default}
\alias{saveCache}

\title{Saves data to file cache}

\description{
 Saves data to file cache, which is unique for an optional key object.
}

\usage{\method{saveCache}{default}(object, key=NULL, sources=NULL, suffix=".Rcache", comment=NULL, dirs=NULL, compress=getOption("R.cache::compress"), ...)}

\arguments{
  \item{object}{The object to be saved to file.}
  \item{key}{An optional object from which a hexadecimal hash
    code will be generated and appended to the filename.}
  \item{sources}{Source objects used for comparison of timestamps when
    cache is loaded later.}
  \item{suffix}{A \code{\link[base]{character}} string to be appended to the end of the
    filename.}
  \item{comment}{An optional \code{\link[base]{character}} string written in ASCII at the
    beginning of the file.}
  \item{dirs}{A \code{\link[base]{character}} \code{\link[base]{vector}} constituting the path to the
     cache subdirectory (of the \emph{cache root directory}
     as returned by \code{\link{getCacheRootPath}}()) to be used.
     If \code{\link[base]{NULL}}, the path will be the cache root path.}
  \item{compress}{If \code{\link[base:logical]{TRUE}}, the cache file will be saved using
     gzip compression, otherwise not.}
  \item{...}{Additional argument passed to \code{\link[base]{save}}().}
}

\value{
  Returns (invisible) the pathname of the cache file.
}

\section{Requirements}{
 To make use of the \code{key} argument, the \emph{digest} package
 (available on CRAN) must be installed, otherwise an error is generated.
 That package is not required when \code{key==NULL}.
}

\section{Compression}{
 The \code{saveCache()} method saves a compressed cache file
 (with filename extension *.gz) if argument \code{compress} is \code{\link[base:logical]{TRUE}}.
 The \code{\link{loadCache}}() method locates (via \code{\link{findCache}}()) and
 loads such cache files as well.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\examples{\dontrun{For an example, see ?loadCache}}

\seealso{
 For more details on how the hash code is generated etc, \code{\link{loadCache}}().
}



\keyword{programming}
\keyword{IO}
