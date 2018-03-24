#########################################################################/**
# @RdocDefault saveCache
#
# @title "Saves data to file cache"
#
# \description{
#  @get "title", which is unique for an optional key object.
# }
#
# @synopsis
#
# \arguments{
#   \item{object}{The object to be saved to file.}
#   \item{key}{An optional object from which a hexadecimal hash
#     code will be generated and appended to the filename.}
#   \item{sources}{Source objects used for comparison of timestamps when
#     cache is loaded later.}
#   \item{suffix}{A @character string to be appended to the end of the
#     filename.}
#   \item{comment}{An optional @character string written in ASCII at the
#     beginning of the file.}
#   \item{pathname}{(Advanced) An optional @character string specifying
#     the pathname to the cache file.  If not specified (default), a unique
#     one is automatically generated from arguments \code{key} and
#     \code{suffix} among other things.}
#   \item{dirs}{A @character @vector constituting the path to the
#      cache subdirectory (of the \emph{cache root directory}
#      as returned by @see "getCacheRootPath") to be used.
#      If @NULL, the path will be the cache root path.}
#   \item{compress}{If @TRUE, the cache file will be saved using
#      gzip compression, otherwise not.}
#   \item{...}{Additional argument passed to @see "base::save".}
# }
#
# \value{
#   Returns (invisible) the pathname of the cache file.
# }
#
# \section{Compression}{
#  The \code{saveCache()} method saves a compressed cache file
#  (with filename extension *.gz) if argument \code{compress} is @TRUE.
#  The @see "loadCache" method locates (via @see "findCache") and
#  loads such cache files as well.
# }
#
# @author
#
# \examples{\dontrun{For an example, see ?loadCache}}
#
# \seealso{
#  For more details on how the hash code is generated etc, @see "loadCache".
# }
#
# @keyword "programming"
# @keyword "IO"
#*/#########################################################################
setMethodS3("saveCache", "default", function(object, key=NULL, sources=NULL, suffix=".Rcache", comment=NULL, pathname=NULL, dirs=NULL, compress=NULL, ...) {
  # Look up base::save() once; '::' adds overhead
  base_save <- base::save

  # Argument 'compress':
  if (is.null(compress)) {
    compress <- getOption("R.cache.compress")
    if (is.null(compress)) {
      compress <- getOption("R.cache::compress")
      if (!is.null(compress)) .Deprecated(msg = "R.cache option 'R.cache::compress' has been renamed to 'R.cache.compress'")
    }
  }
  if (!isTRUE(compress)) compress <- FALSE

  
  ## Skip cache?
  if (!getOption("R.cache.enabled", TRUE)) return(NULL)

  
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Cache file
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (is.null(pathname)) {
    # Generate cache name from basename and hash object.
    pathname <- generateCache(key=key, suffix=suffix, dirs=dirs)
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Save to file connection
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (compress) {
    pathname <- sprintf("%s.gz", pathname)
    fh <- gzfile(pathname, open="wb")
  } else {
    fh <- file(pathname, open="wb")
  }
  on.exit(close(fh))

  ## Prepare to save
  identifier <- "Rcache v0.1.7 (R package R.cache by Henrik Bengtsson)"
  if (nchar(identifier) > 64L)
    throw("Internal error. Identifier is too long: ", identifier)
  tail <- paste(rep(" ", times=64L-nchar(identifier)), collapse="")
  identifier <- paste(identifier, tail, sep="")

  if (is.null(comment))
    comment <- ""

  # If 'sources' is not evaluated, it is a so called promise, which will
  # make all of its calling environments to be save too.
  dummy <- is.null(sources)

  timestamp <- Sys.time()

  tryCatch({
    # Save 'identifier'
    writeChar(con=fh, identifier, nchars=64L)
  
    # Save 'comment'
    writeBin(con=fh, nchar(comment), size=4L)
    writeChar(comment, con=fh, nchars=nchar(comment))
  
    # Save 'sources'
    base_save(file=fh, sources, compress=compress, ...)
  
    # Save 'timestamp'
    base_save(file=fh, timestamp, compress=compress, ...)
  
    # Save 'object'
    base_save(file=fh, object, compress=compress, ...)
  }, error = function(ex) {
    msg <- conditionMessage(ex)
    throw(sprintf("Failed to save to cache (%s). The reason was: %s",
                  sQuote(pathname), ex))

  })

  invisible(pathname)
})
