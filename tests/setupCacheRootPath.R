
options(R.cache.rootPath.ask=FALSE)
Sys.setenv(R_CACHE_ROOTPATH_ASK=FALSE)
R.cache:::setupCacheRootPath()

options(R.cache.rootPath.ask=TRUE)
Sys.setenv(R_CACHE_ROOTPATH_ASK=TRUE)
R.cache:::setupCacheRootPath()


## Cleanup
R.cache::clearCache(recursive=TRUE)
