setMethodS3("clearCache", "default", function(path=getCachePath(...), prompt=TRUE, ...) {
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Validate arguments
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Argument 'path':
  path <- Arguments$getReadablePath(path, mustExist=TRUE);

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
    if (sum(!removed) > 0)
      cat(" Failed to remove ", sum(!removed), " files.", sep="");
    cat("\n", sep="");
  }


  invisible(files);
})


############################################################################
# HISTORY:
# 2011-04-02
# o BUG FIX: clearCache() would also report on subdirectories.
# 2005-12-09
# o BUG FIX: 'prompt=FALSE' would not clear cache.
# 2005-12-07
# o Created.
############################################################################
