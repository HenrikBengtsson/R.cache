# Allows conflicts. For more information, see library() and
# conflicts() in [R] base.
.conflicts.OK <- TRUE


## .First.lib <- function(libname, pkgname) {
.onAttach <- function(libname, pkgname) { 
  pkg <- Package(pkgname);
  assign(pkgname, pkg, pos=getPosition(pkg));

  # This will make sure print(R.cache) gives the proper output, iff called.
  autoload("print.Object", package="R.oo")

  startupMessage(pkg);

  # Setup the cache root path, possibly by prompting the user.
  setupCacheRootPath();
}


############################################################################
# HISTORY: 
# 2005-12-09
# o Created.
############################################################################
