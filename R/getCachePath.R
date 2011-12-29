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
#      cache subdirectory (of the \emph{cache root directory} 
#      as returned by @see "getCacheRootPath") to be used. 
#      If @NULL, the path will be the cache root path.}
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
setMethodS3("getCachePath", "default", function(dirs=NULL, ...) {
  # Get path from options
  subname <- paste(dirs, collapse="/");
  name <- paste("R.cache:cachePath", subname, sep=":");
  path <- getOption(name);

  # If not, use cache root path
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
    if (!isDirectory(path)) {
      throw("Could not create cache directory: ", path);
    }

    # Add a README.txt to cache root (expaining what the directory is)
    filename <- "README.txt";
    pathnameD <- file.path(rootPath, filename);
    if (!isFile(pathnameD)) {
      pathnameS <- system.file(".Rcache", filename, package="R.cache");
      file.copy(pathnameS, pathnameD);
    }
  }

  path;
}) # getCachePath()




############################################################################
# HISTORY:
# 2011-12-29
# o Now getCachePath() adds a README.txt file to the root path, iff
#   missing. It explains why the directory structure exists and what
#   created it.
# 2007-01-24
# o Created.
############################################################################
