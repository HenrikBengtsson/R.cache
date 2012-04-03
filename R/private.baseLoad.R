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
#  The workaround is to creat a local copy of \code{base::load()} and
#  modify it by dropping the \code{gzcon()} coersion.  This is possible
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
  # Local functions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  body <- deparse(base::load);
  pattern <- "gzcon\\((.*)\\)";
  idx <- grep(pattern, body, fixed=FALSE);
  if (length(idx) != 1) {
    throw("INTERNAL ERROR of .baseLoad(): Please contact the maintainer of R.cache.");
  }
  body[idx] <- gsub(pattern, "\\1", body[idx]);
  modLoad <- eval(parse(text=body));

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Assert correctness of connection
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # After adding support to R.cache for compressed files, all connection
  # are now 'gzfile' connections.  However, in R v2.13.0 and before, 
  # seek() is not supported for 'gzfile' connection, which is needed
  # for the below validation.  Because of this, we skip the validation
  # in R v2.13.0 and before and rely on the internal loadFromConn2()
  # to do the same validation, but with a less informative error message.
  if (getRversion() >= "2.13.1") {
    magic <- readChar(con, nchars=5, useBytes=TRUE);
    if (regexpr("RD[AX]2\n", magic) == -1) {
      if (regexpr("RD[ABX][12]\r", magic) == 1) {
        stop("input has been corrupted, with LF replaced by CR");
      } else {
        stop(gettextf("file '%s' has magic number '%s'\n   Use of save versions prior to 2 is deprecated", summary(file)$description, gsub("[\n\r]*", "", magic)));
      }
    }
  
    # Move back 5 bytes, because loadFromConn2() will validate the
    # magic string once more.
    seek(con, origin="current", where=-5);
  }

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Load object from connection
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  modLoad(con, envir=envir);
} # .baseLoad()


############################################################################
# HISTORY:
# 2012-03-20
# o Added an Rdoc comment explaining the .baseLoad() function.
# o CRAN POLICY: Previously .baseLoad() called .Internal(loadFromConn2(...))
#   which is no longer allowed for CRAN packages.  However, there is
#   still the problem of base::load(con) coercing a file connection via
#   gzcon() and while doing that it also resets the file position, which
#   we do not want.  The workaround is not to do dynamic code computation
#   on base::load() code and create an adjusted just-in-time local version
#   that avoids the gzcon() coercion.
# 2011-10-05
# o BUG FIX: Same bug fix as on 2011-08-31 but now also for R v2.13.0.
# 2011-08-31
# o BUG FIX (for R v2.12.2 and before): After adding support for 
#   compressed files in R.cache v0.5.0, we would get the 'Error in
#   seek.connection(con, origin = "current", where = -5) : whence = "end"
#   is not implemented for gzfile connections' in readCacheHeader()
#   iff running R v2.12.2 or before.
# 2009-10-16
# o BUG FIX: In R v2.10.0 and newer, we would get an error reporting that
#   internal function loadFromConn() does not exists.  That function was
#   used because it would read the stream from the position after the magic
#   string in the connection.  We now use loadFromConn2() which tries to
#   read and validate the magic string.  So, we have to make sure that the
#   connection is positioned where the magic string is.  We do this using
#   seek().  We also note that we could have used loadFromConn2() already
#   since R v2.3.0.  Since this package requires R v2.3.0, we simply drop
#   the old implementation and use this new one.
# o Created.
############################################################################
