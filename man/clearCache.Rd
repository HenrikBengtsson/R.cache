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

\usage{
\method{clearCache}{default}(path=getCachePath(...), ..., recursive=FALSE, prompt=TRUE & interactive())
}

\arguments{
  \item{path}{A \code{\link[base]{character}} string specifying the directory to be cleared.
    By default, the path is what is returned by \code{\link{getCachePath}}()
    which arguments \code{...} are also passed.}
  \item{...}{Arguments passed to \code{\link{getCachePath}}(), especially
    argument \code{dirs} to specify subdirectories.}
  \item{recursive}{If \code{\link[base:logical]{TRUE}}, subdirectories are also removed, otherwise
    just the files in the specified directory.}
  \item{prompt}{If \code{\link[base:logical]{TRUE}}, the user will be prompted to confirm that
    the directory will cleared before files are removed.}
}

\value{
  Returns (invisibly) a \code{\link[base]{character}} \code{\link[base]{vector}} of pathnames of the
  files removed.  If no files were removed, \code{\link[base]{NULL}} is returned.
}

\author{Henrik Bengtsson}

\details{
  If the specified directory does not exists, an exception is thrown.
}




\keyword{programming}
\keyword{IO}
\keyword{internal}
