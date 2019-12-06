%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  options.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{Options used by R.cache}
\alias{Options used by R.cache}
\title{Options used by R.cache}

 
 \description{
  Below are all \R options specific to the \pkg{R.cache} package.
  \cr
  \emph{WARNING: Note that the names and the default values of
  these options may change in future versions of the package.
  Please use with care until further notice.}
 }

 \section{Options for controlling futures}{
  \describe{
   \item{\option{R.cache.compress}:}{
     If \code{\link[base:logical]{TRUE}}, \code{\link{saveCache}}() will write compressed cache files,
     otherwise not.
     (Default: \code{\link[base:logical]{FALSE}})
   }

   \item{\option{R.cache.enabled}:}{
     If \code{\link[base:logical]{TRUE}}, \code{\link{loadCache}}() is reading from and \code{\link{saveCache}}() is writing
     to the cache, otherwise not.
     (Default: \code{\link[base:logical]{TRUE}})
   }

   \item{\option{R.cache.rootPath}:}{
     A \code{\link[base]{character}} string specifying the default cache root path.
     If not set, environment variable \env{R_CACHE_ROOTPATH} is considered.
   }

   \item{\option{R.cache.touchOnLoad}:}{
     If \code{\link[base:logical]{TRUE}}, \code{\link{loadCache}}() will update the "last-modified" timestamp of
     the cache file (to the current time), otherwise not.
     (Default: \code{\link[base:logical]{FALSE}})
   }
  }
 }

 \keyword{internal}
 \alias{R.cache.options}



\keyword{documentation}
\keyword{programming}
\keyword{IO}
