## covr: skip=all
.onLoad <- function(libname, pkgname) {
  ns <- getNamespace(pkgname)
  pkg <- Package(pkgname)
  assign(pkgname, pkg, envir=ns)

  ## Use a temporary root path for 'R CMD check', unless explicitly set
  if (inRCmdCheck()) {
    path <- getOption("R.cache.rootPath", Sys.getenv("R_CACHE_ROOTPATH"))
    if (nchar(path) == 0L) {
      path <- file.path(tempdir(), ".cache", "R", "R.cache")
      options(R.cache.rootPath = path)
    }
  }

  # Setup the cache root path, possibly by prompting the user.
  setupCacheRootPath()
}

.onAttach <- function(libname, pkgname) {
  pkg <- get(pkgname, envir=getNamespace(pkgname))
  startupMessage(pkg)
}
