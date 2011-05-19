#########################################################################/**
# @RdocDefault clearCache
#
# @title "Removes all files in a cache file directory"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{path}{A @character string specifying the directory to be cleared.
#     By default, the path is what is returned by @see "getCachePath"
#     which arguments \code{...} are also passed.}
#   \item{...}{Arguments passed to @see "getCachePath", especially
#     argument \code{dirs} to specify subdirectories.}
#   \item{prompt}{If @TRUE, the user will be prompted to confirm that
#     the directory will cleared before files are removed.}
# }
#
# \value{
#   Returns (invisibly) a @character @vector of pathnames of the 
#   files removed.  If no files were removed, @NULL is returned.
# }
#
# @author
#
# \details{
#   If the specified directory does not exists, an exception is thrown.
#   Currently, recursive clearing of subdirectories is 
#   \emph{not} supported.
# }
#
# @keyword "programming"
# @keyword "IO"
#*/#########################################################################  
setMethodS3("clearCache", "default", function(path=getCachePath(...), ..., prompt=TRUE & interactive()) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'path':
  path <- Arguments$getReadablePath(path, mustExist=TRUE);

  # Argument 'dirs':
  dirs <- Arguments$getCharacters(dirs);

  # Argument 'prompt':
  prompt <- Arguments$getLogical(prompt);

  
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Find files to be removed
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  files <- list.files(path=path, all.files=TRUE, full.names=TRUE);
  files <- files[-grep("[/]*[.][.]*$", files)];
  if (length(files) > 0) {
    files <- files[!file.info(files)$isdir];
  }
  nbrOfFiles <- length(files);
  if (nbrOfFiles == 0) {
    if (prompt)
      cat("Nothing to clear. Cache directory is empty: ", path, "\n", sep="");
    return(invisible(NULL));
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Prompt user?
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (prompt) {
    answer <- ".";
    while (!(answer %in% c("y", "n", ""))) {
      cat("Are you really sure you want to delete the ", nbrOfFiles, 
          " files in '", path, "'? [y/N]: ", sep="");
      answer <- tolower(readline());
    }
    if (answer != "y")
      return(invisible(NULL));
  }


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Remove files
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  removed <- file.remove(files);
  files <- files[removed];


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Report results?
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (prompt) {
    cat("Cache cleared. ", sum(removed), " files removed.", sep="");
    if (sum(!removed) > 0) {
      cat(" Failed to remove ", sum(!removed), " files.", sep="");
    }
    cat("\n", sep="");
  }


  invisible(files);
})


############################################################################
# HISTORY:
# 2011-05-19
# o Added Rdoc comments.
# 2011-04-02
# o BUG FIX: clearCache() would also report on subdirectories.
# 2005-12-09
# o BUG FIX: 'prompt=FALSE' would not clear cache.
# 2005-12-07
# o Created.
############################################################################
