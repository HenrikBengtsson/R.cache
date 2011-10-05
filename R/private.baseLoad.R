# Same a base::load(), without resetting file connections to
# position zero.  This occurs in base::load() because a gzcon() 
# connection is opened and that automatically resets the position.
.baseLoad <- function(con, envir=parent.frame()) {
  # After adding support to R.cache for compressed files, all connection
  # are now 'gzfile' connections.  However, in R v2.13.0 and before, 
  # seek() is not supported for 'gzfile' connection, which is needed
  # for the below validation.  Because of this, we skip the validation
  # in R v2.13.0 and before and rely on the internal loadFromConn2()
  # to do the same validation, but with a less informative error message.
  if (getRversion() >= "2.13.1") {
    magic <- readChar(con, 5, useBytes=TRUE);
    if (regexpr("RD[AX]2\n", magic) == -1) {
      if (regexpr("RD[ABX][12]\r", magic) == 1) {
        stop("input has been corrupted, with LF replaced by CR");
      } else {
        stop(gettextf("file '%s' has magic number '%s'\n   Use of save versions prior to 2 is deprecated", basename(file), gsub("[\n\r]*", "", magic)));
      }
    }
  
    # Move back 5 bytes, because loadFromConn2() will validate the
    # magic string once more.
    seek(con, origin="current", where=-5);
  }

  .Internal(loadFromConn2(con, envir));
} # .baseLoad()


############################################################################
# HISTORY:
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
