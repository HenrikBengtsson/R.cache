library("R.cache")
setupCacheRootPath <- R.cache:::setupCacheRootPath

oopts <- options()

tmpdir <- tempdir()
setCacheRootPath(path=tmpdir)

print(getCacheRootPath())

setupCacheRootPath(defaultPath=tmpdir)
path <- getCacheRootPath(NULL)
print(path)
stopifnot(identical(path, tmpdir))

options("R.cache.rootPath"=NULL)
print(getCacheRootPath())

path <- getCacheRootPath(NULL)
print(path)
stopifnot(is.null(path))
setupCacheRootPath(defaultPath=tmpdir)

path <- getCacheRootPath(NULL)
print(path)
stopifnot(identical(path, tmpdir))

## Reset
options(oopts)
