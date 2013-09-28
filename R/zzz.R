# Allows conflicts. For more information, see library() and
# conflicts() in [R] base.
.conflicts.OK <- TRUE

.onLoad <- function(libname, pkgname) {
  ns <- getNamespace(pkgname);
  pkg <- Package(pkgname);
  assign(pkgname, pkg, envir=ns);
}

.onAttach <- function(libname, pkgname) {
  # This will make sure print(R.cache) gives the proper output, iff called.
  autoload("print.Object", package="R.oo")

  startupMessage(get(pkgname, envir=getNamespace(pkgname)));

  # Setup the cache root path, possibly by prompting the user.
  setupCacheRootPath();
}


############################################################################
# HISTORY:
# 2005-12-09
# o Created.
############################################################################
