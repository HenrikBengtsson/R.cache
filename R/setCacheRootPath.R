#########################################################################/**
# @RdocDefault setCacheRootPath
#
# @title "Sets the root path to the file cache directory"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{path}{The path.}
#   \item{...}{Not used.}
# }
#
# \value{
#   Returns (invisibly) the old root path.
# }
#
# @author
#
# \seealso{
#  @see "getCacheRootPath".
# }
#
# @keyword "programming"
# @keyword "IO"
#*/#########################################################################
setMethodS3("setCacheRootPath", "default", function(path=NULL, ...) {
  if (is.null(path)) path <- getDefaultCacheRootPath(path)
  path <- as.character(path)

  if (!isDirectory(path)) mkdirs(path, mustWork=TRUE)

  # Add a README.txt file, if missing.
  .addREADME(to=path)

  ovalue <- options("R.cache.rootPath"=path)

  invisible(ovalue)
}) # setCacheRootPath()
