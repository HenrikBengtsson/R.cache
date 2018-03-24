#########################################################################/**
# @RdocDefault getCacheRootPath
#
# @title "Gets the root path to the file cache directory"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{defaultPath}{The default path, if no user-specified directory
#     has been given.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns the path as a @character string.
# }
#
# \examples{
#   print(getCacheRootPath())
# }
#
# @author
#
# \seealso{
#  Too set the directory where cache files are stored,
#  see @see "setCacheRootPath".
# }
#
# @keyword "programming"
# @keyword "IO"
#*/#########################################################################
setMethodS3("getCacheRootPath", "default", function(defaultPath="~/.Rcache", ...) {
  # Check for option settings
  path <- getOption("R.cache.rootPath")
  
  # Backward compatibility
  if (is.null(path)) {
    if (is.null(path)) {
      path <- getOption("R.cache::rootPath")
      if (!is.null(path)) .Deprecated(msg = "R.cache option 'R.cache::rootPath' has been renamed to 'R.cache.rootPath'")
    }

    if (is.null(path)) {
      path <- getOption("R.cache.path")
      if (!is.null(path)) .Deprecated(msg = "R.cache option 'R.cache::path' has been renamed to 'R.cache.rootPath'")
    }

    # Check for system environment settings
    if (is.null(path)) {
      path <- Sys.getenv("R_CACHE_PATH")
      if (nzchar(path)) .Deprecated(msg = "R.cache environment variable 'R_CACHE_PATH' is deprecated. Use option 'R.cache.rootPath' instead")
    }

    if (nchar(path) == 0L) {
      path <- NULL
    }

    if (!is.null(path)) {
      warning("Use setCacheRootPath() to set the cache path in R.cache.")
    }
  }

  # Otherwise, use argument 'path'.
  if (is.null(path)) {
    path <- defaultPath
  }

  path
})
