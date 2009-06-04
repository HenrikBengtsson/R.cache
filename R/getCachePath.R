#########################################################################/**
# @RdocDefault getCachePath
#
# @title "Gets the path to the file cache directory"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{dirs}{A @character @vector constituting the path to the
#      cache subdirectory to be used.  If @NULL, the root path
#      is used.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns the path as a @character string.
# }
#
# \details{
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
setMethodS3("getCachePath", "default", function(dirs=NULL, ...) {
  # Get path from options
  subname <- paste(dirs, collapse="/");
  name <- paste("R.cache:cachePath", subname, sep=":");
  path <- getOption(name);

  # If not, use root path
  if (is.null(path)) {
    rootPath <- getCacheRootPath();
    path <- paste(c(rootPath, dirs), collapse=.Platform$file.sep);
  } else if (!isAbsolutePath(path)) {
    rootPath <- getCacheRootPath();
    path <- file.path(rootPath, path);
  }

  # Create missing directory?
  if (!isDirectory(path)) {
    mkdirs(path);
    if (!isDirectory(path))
      throw("Could not create cache directory: ", path);
  }

  path;
})




############################################################################
# HISTORY:
# 2007-01-24
# o Created.
############################################################################
