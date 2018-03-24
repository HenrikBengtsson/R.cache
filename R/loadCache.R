#########################################################################/**
# @RdocDefault loadCache
#
# @title "Loads data from file cache"
#
# \description{
#  @get "title", which is unique for an optional key object.
# }
#
# @synopsis
#
# \arguments{
#   \item{key}{An optional object from which a hexadecimal hash
#     code will be generated and appended to the filename.}
#   \item{sources}{Optional source objects.  If the cache object has a
#     timestamp older than one of the source objects, it will be ignored
#     and removed.}
#   \item{suffix}{A @character string to be appended to the end of the
#     filename.}
#   \item{removeOldCache}{If @TRUE and the cache is older than the
#     \code{sources}, the cache file is removed, otherwise not.}
#   \item{pathname}{The pathname to the cache file.  If specified,
#     arguments \code{key} and \code{suffix} are ignored.  Note that
#     this is only needed in order to read a cache file for which
#     the key is unknown, for instance, in order to investigate
#     an unknown cache file.}
#   \item{dirs}{A @character @vector constituting the path to the
#      cache subdirectory (of the \emph{cache root directory}
#      as returned by @see "getCacheRootPath") to be used.
#      If @NULL, the path will be the cache root path.}
#   \item{...}{Not used.}
#   \item{onError}{A @character string specifying what the action is
#      if an exception is thrown.}
# }
#
# \value{
#   Returns an \R object or @NULL, if cache does not exist.
# }
#
# \details{
#   The hash code calculated from the \code{key} object is a
#   32 characters long hexadecimal MD5 hash code.
#   For more details, see @see "getChecksum".
# }
#
# @author
#
# @examples "../incl/loadCache.Rex"
#
# \seealso{
#  @see "saveCache".
# }
#
# @keyword "programming"
# @keyword "IO"
#*/#########################################################################
setMethodS3("loadCache", "default", function(key=NULL, sources=NULL, suffix=".Rcache", removeOldCache=TRUE, pathname=NULL, dirs=NULL, ..., onError=c("warning", "error", "message", "quiet", "print")) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'onError':
  onError <- match.arg(onError)
  if (onError == "print") {
    .Deprecated(msg = "loadCache(..., onError = \"print\") is deprecated and replaced by onError = \"message\"")
  }


  ## Skip cache?
  if (!getOption("R.cache.enabled", TRUE)) return(NULL)


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Find cached file
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (is.null(pathname))
    pathname <- findCache(key=key, suffix=suffix, dirs=dirs)
  if (is.null(pathname))
    return(NULL)

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Try to load cached object from file connection
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (!isFile(pathname))
    return(NULL)

  fh <- gzfile(pathname, open="rb")
  on.exit({
    if (!is.null(fh))
      close(fh)
  })

  tryCatch({
    header <- readCacheHeader(fh)
    if (!is.null(sources))
      header$sources <- sources

    timestamp <- NULL
    attachLocally(header)  # Attaches 'timestamp' (and 'sources')

    if (!is.null(timestamp) && !is.null(sources)) {
      for (sourcePathname in sources) {
        if (!is.character(sources)) {
          warning("No timestamp check of cache was performed. Unsupported type of cache source: ", class(sources)[1])
          break
        }

        if (!file.exists(sourcePathname)) {
          warning("No timestamp check of cache was performed. Source file not found: ", sourcePathname)
          break
        }

        # Is source file newer than cache?
        lastModified <- file.info(sourcePathname)$mtime
        if (lastModified > timestamp) {
          # Remove out-of-date cache file?
          if (removeOldCache) {
            close(fh); fh <- NULL
            file.remove(pathname)
          }
          return(NULL)
        }
      } # for (sourcePathname in sources)
    }

    # 4. Load cached object:
    res <- .baseLoad(con=fh, ...)
    object <- res$object
    res <- NULL # Not needed anymore

    # 5. Update the "last-modified" timestamp of the cache file?
    touch <- getOption("R.cache.touchOnLoad")
    
    ## Backward compatibility
    if (is.null(touch)) {
      touch <- getOption("R.cache::touchOnLoad")
      if (!is.null(touch)) .Deprecated(msg = "R.cache option 'R.cache::touchOnLoad' has been renamed to 'R.cache.touchOnLoad'")
    }
    
    touch <- identical(touch, TRUE)
    if (touch) {
      touchFile(pathname)
    }

    # 6. Return cached object
    return(object)
  }, error = function(ex) {
     if (onError == "warning") {
       warning(ex)
     } else if (onError == "error") {
       stop(ex)
     } else if (onError == "message") {
       message(conditionMessage(ex))
     } else if (onError == "print") {
       print(ex)
     }
  })

  NULL
})
