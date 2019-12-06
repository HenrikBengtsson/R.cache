###########################################################################/** 
# @eval "{.baseLoad <<- R.cache:::.baseLoad; ''}"
# @RdocFunction ".baseLoad"
#
# @title "Loads an object from a file connection"
#
# \description{
#   @get "title" similar to @see "base::load", but without resetting 
#   file connections (to position zero).
#
#   \emph{WARNING: This is an internal function that should not be
#   called by anything but the internal code of the \pkg{R.cache} package.}
# }
#
# @synopsis
#
# \arguments{
#   \item{con}{A @connection.}
#   \item{envir}{An @environment where the loaded object will be stored.}
# }
#
# \value{
#  Returns (invisible) a @character @vector of the names of objects
#  loaded.
# }
#
# \details{
#  The reason why it is not possible to use @see "base::load" is that
#  that resets the file position of the connection before trying to
#  load the object.
#  The reason why that happens is because when you pass a regular file
#  connection to @see "base::load" it gets coerced via @see "base::gzcon",
#  which is the function that resets the file position.
# 
#  The workaround is to create a local copy of \code{base::load()} and
#  modify it by dropping the \code{gzcon()} coercion.  This is possible
#  because this function, that is \code{.baseLoad()}, is always called
#  with a \code{gzfile()} @connection.
# }
#
# \seealso{
#   This function is used by @see "loadCache" and @see "readCacheHeader".
# }
#
# @keyword internal
#*/###########################################################################
.baseLoad <- function(con, envir=parent.frame()) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Assert correctness of connection
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  magic <- readChar(con, nchars=5, useBytes=TRUE)
  if (regexpr("RD[AX][2-9]\n", magic) == -1L) {
    if (regexpr("RD[ABX][1-9]\r", magic) == 1L) {
      stop("input has been corrupted, with LF replaced by CR")
    } else {
      stop(gettextf("file '%s' has magic number '%s'\n   Use of save versions prior to 2 is deprecated", summary(file)$description, gsub("[\n\r]*", "", magic)))
    }
  }
  
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Load object from connection
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  res <- readRDS(con)
} # .baseLoad()
