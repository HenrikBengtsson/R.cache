#########################################################################/**
# @RdocDocumentation "Options used by R.cache"
#   
# \description{
#  Below are all \R options specific to the \pkg{R.cache} package.
#  \cr
#  \emph{WARNING: Note that the names and the default values of
#  these options may change in future versions of the package.
#  Please use with care until further notice.}
# }
# 
# \section{Options for controlling futures}{
#  \describe{
#   \item{\option{R.cache.compress}:}{
#     If @TRUE, @see saveCache will write compressed cache files,
#     otherwise not.
#     (Default: @FALSE)
#   }
#  
#   \item{\option{R.cache.enabled}:}{
#     If @TRUE, @see loadCache is reading from and @see saveCache is writing
#     to the cache, otherwise not.
#     (Default: @TRUE)
#   }
#  
#   \item{\option{R.cache.rootPath}:}{
#     A @character string specifying the default cache root path.   
#     (Default: \code{"~/.Rcache"})
#   }
#  
#   \item{\option{R.cache.touchOnLoad}:}{
#     If @TRUE, @see loadCache will update the "last-modified" timestamp of
#     the cache file (to the current time), otherwise not.
#     (Default: @FALSE)
#   }
#  }
# }
# 
# \keyword{internal}
# \alias{R.cache.options}
#
# @keyword "programming"
# @keyword "IO"
#*/#########################################################################
NULL
