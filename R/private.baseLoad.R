# Same a base::load(), without resetting file connections to
# position zero.  This occurs in base::load() because a gzcon() 
# connection is opened and that automatically resets the position.
.baseLoad <- function(con, envir=parent.frame()) {
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

  .Internal(loadFromConn2(con, envir));
} # .baseLoad()


############################################################################
# HISTORY:
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
