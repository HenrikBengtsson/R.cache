#########################################################################/**
# @RdocDefault memoizedCall
#
# @title "Calls a function with memoization"
#
# \description{
#  @get "title", that is, caches the results to be retrieved if
#  the function is called again with the exact same arguments.
# }
#
# @synopsis
#
# \arguments{
#   \item{what}{The @function to be called, or a @character string 
#     specifying the name of the function to be called, 
#     cf. @see "base::do.call".}
#   \item{...}{Arguments passed to the function.}
#   \item{envir}{The @environment in which the function is evaluated.}
#   \item{force}{If @TRUE, any cached results are ignored, otherwise not.}
#   \item{sources, dirs}{Optional arguments passed to 
#     @see "loadCache" and @see "saveCache".}
#   \item{verbose}{If @TRUE, verbose statements are outputted.}
# }
#
# \value{
#   Returns the result of the function call.
# }
#
# @author
#
# \seealso{
#  Internally, @see "loadCache" is used to load memoized results, 
#  if available.  If not available, then @see "do.call" is used to 
#  evaluate the function call, 
#  and @see "saveCache" is used to save the results to cache.
# }
#
# @keyword "programming"
# @keyword "IO"
#*/#########################################################################  
setMethodS3("memoizedCall", "default", function(what, ..., envir=parent.frame(), force=FALSE, sources=NULL, dirs=NULL, verbose=FALSE) {
  # 1. Look for memoized results
  key <- list(what=what, ...);
  if (!force) {
    res <- loadCache(key=key, dirs=dirs, sources=sources);
    if (!is.null(res)) {
      if (verbose) printf("Returning cached results!\n");
      return(res);
    }
  }

  # 2. Otherwise, call method with arguments
  res <- do.call(what, args=list(...), quote=FALSE, envir=envir);

  # 3. Memoize results
  saveCache(res, key=key, dirs=dirs, sources=sources);

  # 4. Return results
  res;
}) # memoizedCall()



#######################################################################
# HISTORY:
# 2011-02-14
# o Added argument 'sources' to memoizedCall().
# 2011-02-13
# o Created.
#######################################################################
