#########################################################################/**
# @RdocDefault getCachePath
#
# @title "Gets the path to the file cache directory"
#
# \description{
#  @get "title".
#  If missing, the directory is created.
# }
#
# @synopsis
#
# \arguments{
#   \item{dirs}{A @character @vector constituting the path to the
#      cache subdirectory (of the \emph{cache root directory}
#      as returned by @see "getCacheRootPath") to be used.
#      If @NULL, the path will be the cache root path.}
#   \item{path, rootPath}{(Advanced) @character strings specifying the
#      explicit/default cache path and root cache path.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns the path as a @character string.
# }
#
# @author
#
# \seealso{
#   @see "setCachePath".
# }
#
# @keyword "programming"
# @keyword "IO"
# @keyword "internal"
#*/#########################################################################
setMethodS3("getCachePath", "default", function(dirs=NULL, path=NULL, rootPath=getCacheRootPath(), ...) {
  # Get path where to store cache file
  if (is.null(path)) {
    # (1) Get/make default path
    # (a) Get path from options
    subname <- paste(dirs, collapse="/")
    name <- paste("R.cache:cachePath", subname, sep=":")
    path <- getOption(name)

    # (b) If not availble, make on
    path <- paste(c(rootPath, dirs), collapse=.Platform$file.sep)
  } else if (!isAbsolutePath(path)) {
    # (2) Get/make default path
    path <- file.path(rootPath, path)
  }

  # Create missing directory?
  if (!isDirectory(path)) {
    mkdirs(path, mustWork=TRUE)

    # Add a README.txt file, if missing.
    .addREADME(to=rootPath)
  }

  path
}) # getCachePath()
