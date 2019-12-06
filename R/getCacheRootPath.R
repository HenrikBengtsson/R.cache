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
setMethodS3("getCacheRootPath", "default", function(defaultPath=NULL, ...) {
  # Check for option settings
  path <- getOption("R.cache.rootPath", Sys.getenv("R_CACHE_ROOTPATH", ""))
  if (nchar(path) == 0L) path <- NULL
  
  # Backward compatibility
  if (is.null(path)) {
    if (is.null(path)) {
      path <- getOption("R.cache::rootPath")
      if (!is.null(path)) .Defunct(msg = "R.cache option 'R.cache::rootPath' has been renamed to 'R.cache.rootPath'")
    }
    
    if (is.null(path)) {
      path <- getOption("R.cache.path")
      if (!is.null(path)) .Defunct(msg = "R.cache option 'R.cache::path' has been renamed to 'R.cache.rootPath'")
    }

    # Check for system environment settings
    if (is.null(path)) {
      path <- Sys.getenv("R_CACHE_PATH")
      if (nzchar(path)) .Defunct(msg = "R.cache environment variable 'R_CACHE_PATH' is deprecated. Use option 'R.cache.rootPath' instead")
    }

    if (nchar(path) == 0L) {
      path <- NULL
    }

    if (!is.null(path)) {
      warning("Use setCacheRootPath() to set the cache path in R.cache.")
    }
  }

  # Otherwise, use argument 'defaultPath'.
  if (is.null(path)) {
    if (!is.null(defaultPath)) path <- getDefaultCacheRootPath(defaultPath)
  }
  
  path
})


getDefaultCacheRootPath <- function(defaultPath = NULL) {
  if (is.null(defaultPath)) {
    ## BACKWARD COMPATIBILITY: For users that already has a ~/.Rcache folder,
    ## we will use that as the default in order for them not to loose their
    ## existing cache
    defaultPath <- "~/.Rcache"
    if (isDirectory(defaultPath)) return(defaultPath)
    
    defaultPath <- getOSCacheRootPath()
  }
  defaultPath
}