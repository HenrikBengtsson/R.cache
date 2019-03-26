library("R.cache")

options(R.cache.rootPath = NULL)

## -----------------------------------------------
## DEPRECATED & DEFUNCT
## -----------------------------------------------
options("R.cache.path"="foo")
res <- tryCatch(getCacheRootPath(), error = identity)
print(res)
stopifnot(inherits(res, "error"))
options("R.cache.path"=NULL)

Sys.setenv("R_CACHE_PATH"="foo")
res <- tryCatch(getCacheRootPath(), error = identity)
print(res)
stopifnot(inherits(res, "error"))
Sys.setenv("R_CACHE_PATH"="")
