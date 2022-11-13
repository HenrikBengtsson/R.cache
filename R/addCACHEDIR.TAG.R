.addCACHEDIR.TAG <- function(to = getCacheRootPath(), ...) {
  # Add a CACHEDIR.TAG to cache root per https://bford.info/cachedir/
  filename <- "CACHEDIR.TAG"
  pathnameD <- file.path(to, filename)
  if (!isFile(pathnameD)) {
    pathnameS <- system.file("_Rcache", filename, package="R.cache")
    file.copy(pathnameS, pathnameD)
  }
} # .addCACHEDIR.TAG()
