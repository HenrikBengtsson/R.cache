library("R.cache")
oopts <- options()

tmpdir <- tempdir()
setCacheRootPath(path=tmpdir)

print(getCacheRootPath())

options("R.cache::rootPath"=NULL)
print(getCacheRootPath())

options("R.cache.path"="foo")
print(getCacheRootPath())

options("R.cache.path"=NULL)
print(getCacheRootPath())

oenv <- Sys.getenv("R_CACHE_PATH")
Sys.setenv("R_CACHE_PATH"="")
print(getCacheRootPath())

## Cleanup
options(oopts)
args <- list(oenv)
names(args) <- "R_CACHE_PATH"
do.call(Sys.setenv, args)
