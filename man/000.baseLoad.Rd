%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  private.baseLoad.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 \name{.baseLoad}
\alias{.baseLoad}


 \title{Loads an object from a file connection}

 \description{
   Loads an object from a file connection similar to \code{\link[base]{load}}(), but without resetting
   file connections (to position zero).

   \emph{WARNING: This is an internal function that should not be
   called by anything but the internal code of the \pkg{R.cache} package.}
 }

 \usage{.baseLoad(con, envir=parent.frame())}

 \arguments{
   \item{con}{A \code{\link[base:connections]{connection}}.}
   \item{envir}{An \code{\link[base]{environment}} where the loaded object will be stored.}
 }

 \value{
  Returns (invisible) a \code{\link[base]{character}} \code{\link[base]{vector}} of the names of objects
  loaded.
 }

 \details{
  The reason why it is not possible to use \code{\link[base]{load}}() is that
  that resets the file position of the connection before trying to
  load the object.
  The reason why that happens is because when you pass a regular file
  connection to \code{\link[base]{load}}() it gets coerced via \code{\link[base]{gzcon}}(),
  which is the function that resets the file position.

  The workaround is to creat a local copy of \code{base::load()} and
  modify it by dropping the \code{gzcon()} coersion.  This is possible
  because this function, that is \code{.baseLoad()}, is always called
  with a \code{gzfile()} \code{\link[base:connections]{connection}}.
 }

 \seealso{
   This function is used by \code{\link{loadCache}}() and \code{\link{readCacheHeader}}().
 }


\keyword{internal}
