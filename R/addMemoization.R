#########################################################################/**
# @RdocDefault addMemoization
#
# @title "Creates a copy of an existing function such that its results are memoized"
#
# \description{
#  @get "title".
# }
#
# @synopsis
#
# \arguments{
#   \item{fcn}{A @function (or the name of a function) that should be
#     copied and have memoization added.}
#   \item{...}{Additional arguments for controlling the memoization,
#     i.e. all arguments of @see "memoizedCall" that are not passed
#     to @see "base::do.call".}
# }
#
# \value{
#   Returns a @function.
# }
#
# \details{
#  The new function is setup such that the the memoized call is done
#  in the environment of the caller (the parent frame of the function).
# }
#
# @author
#
# \seealso{
#  The returned function utilized @see "memoizedCall" internally.
# }
#
# @keyword "programming"
# @keyword "IO"
#*/#########################################################################  
setMethodS3("addMemoization", "default", function(fcn, ...) {
  # Argument 'fcn':
  if (is.character(fcn)) {
    if (!exists(fcn, mode="function")) {
      throw("Argument 'fcn' is not an existing function: ", fcn);
    }
    fcn <- get(fcn, mode="function");
  }

  if (!is.function(fcn)) {
    throw("Argument 'fcn' is not a function: ", mode(fcn));
  }


  # Record the argument specific to memoizedCall().
  memArgs <- list(...);

  function(..., envir=parent.frame()) {
    args <- list(fcn, ..., envir=envir);
    args <- c(args, memArgs);
    do.call("memoizedCall", args=args);
  }
}) # addMemoization()


#######################################################################
# HISTORY:
# 2011-02-14
# o Added addMemoization().
#######################################################################
