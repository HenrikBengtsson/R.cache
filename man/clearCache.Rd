%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  clearCache.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{clearCache}
\alias{clearCache.default}
\alias{clearCache}

\title{Removes all files in a cache file directory}

\description{
 Removes all files in a cache file directory.
}

\usage{\method{clearCache}{default}(path=getCachePath(...), ..., prompt=TRUE & interactive())}

\arguments{
  \item{path}{A \code{\link[base]{character}} string specifying the directory to be cleared.
    By default, the path is what is returned by \code{\link{getCachePath}}()
    which arguments \code{...} are also passed.}
  \item{...}{Arguments passed to \code{\link{getCachePath}}(), especially
    argument \code{dirs} to specify subdirectories.}
  \item{prompt}{If \code{\link[base:logical]{TRUE}}, the user will be prompted to confirm that
    the directory will cleared before files are removed.}
}

\value{
  Returns (invisibly) a \code{\link[base]{character}} \code{\link[base]{vector}} of pathnames of the
  files removed.  If no files were removed, \code{\link[base]{NULL}} is returned.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\details{
  If the specified directory does not exists, an exception is thrown.
  Currently, recursive clearing of subdirectories is
  \emph{not} supported.
}



\keyword{programming}
\keyword{IO}
