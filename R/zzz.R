# Allows conflicts. For more information, see library() and
# conflicts() in [R] base.
.conflicts.OK <- TRUE


## .First.lib <- function(libname, pkgname) {
.onAttach <- function(libname, pkgname) { 
  pkg <- Package(pkgname);
  assign(pkgname, pkg, pos=getPosition(pkg));

  packageStartupMessage(getName(pkg), " v", getVersion(pkg), 
      " (", getDate(pkg), ")", " successfully loaded. See ?", 
      pkgname, " for help.\n", sep="");

  # Setup the cache root path, possibly by prompting the user.
  setupCacheRootPath();
}


############################################################################
# HISTORY: 
# 2005-12-09
# o Created.
############################################################################
