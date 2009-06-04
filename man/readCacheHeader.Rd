%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  readCacheHeader.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{readCacheHeader}
\alias{readCacheHeader.default}
\alias{readCacheHeader}

\title{Loads data from file cache}

\description{
 Loads data from file cache, which is unique for an optional key object.
}

\usage{\method{readCacheHeader}{default}(file, ...)}

\arguments{
  \item{file}{A filename or a \code{\link[base:connections]{connection}}.}
  \item{...}{Not used.}
}

\value{
  Returns a named \code{\link[base]{list}} structure with element \code{identifier},
  \code{version}, \code{comment} (optional), \code{sources} (optional),
  and \code{timestamp}.
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\examples{

data <- 1:120
key <- list(some=1, vari=2, ables=3)

saveCache(key=key, data, comment="A simple example of a cached object.")

header <- readCacheHeader(findCache(key=key))
print(header)

# Clean up
file.remove(findCache(key=key))
}

\seealso{
 \code{\link{findCache}}().
 \code{\link{loadCache}}().
 \code{\link{saveCache}}().
}



\keyword{programming}
\keyword{IO}
