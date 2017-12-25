## covr: skip=all
.onLoad <- function(libname, pkgname) {
  ns <- getNamespace(pkgname);
  pkg <- Package(pkgname);
  assign(pkgname, pkg, envir=ns);

  # Setup the cache root path, possibly by prompting the user.
  setupCacheRootPath();
}

.onAttach <- function(libname, pkgname) {
  pkg <- get(pkgname, envir=getNamespace(pkgname));
  startupMessage(pkg);
}
