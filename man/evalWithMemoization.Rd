%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  evalWithMemoization.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{evalWithMemoization}
\alias{evalWithMemoization}


\title{Evaluates an R expression with memoization}

\description{
 Evaluates an R expression with memoization such that the same objects are assigned to the
 current environment and the same result is returned, if any.
}

\usage{evalWithMemoization(expr, key=NULL, ..., envir=parent.frame(), force=FALSE)}

\arguments{
  \item{expr}{The \code{\link[base]{expression}} to be evaluated.}
  \item{key}{Additional objects to uniquely identify the evaluation.}
  \item{...}{Additional arguments passed to \code{\link{loadCache}}()
    and \code{\link{saveCache}}().}
  \item{envir}{The \code{\link[base]{environment}} in which the expression should
    be evaluated.}
  \item{force}{If \code{\link[base:logical]{TRUE}}, existing cached results are ignored.}
}

\value{
  Returns the value of the evaluated \code{expr} \code{\link[base]{expression}}, if any.
}

\examples{
for (kk in 1:5) {
  printf("Iteration #\%d:\n", kk)
  res <- evalWithMemoization({
    cat("Evaluating expression...")
    a <- 1
    b <- 2
    c <- 4
    Sys.sleep(1)
    cat("done\n")
    b
  })
  print(res)

  # Sanity checks
  stopifnot(a == 1 && b == 2 && c == 4)

  # Clean up
  rm(a, b, c)
} # for (kk ...)


## OUTPUTS:
## Iteration #1:
## Evaluating expression...done
## [1] 2
## Iteration #2:
## [1] 2
## Iteration #3:
## [1] 2
## Iteration #4:
## [1] 2
## Iteration #5:
## [1] 2


############################################################
# WARNING
############################################################
# If the expression being evaluated depends on
# "input" objects, then these must be be specified
# explicitly as "key" objects.
for (ii in 1:2) {
  for (kk in 1:3) {
    printf("Iteration #\%d:\n", kk)
    res <- evalWithMemoization({
      cat("Evaluating expression...")
      a <- kk
      Sys.sleep(1)
      cat("done\n")
      a
    }, key=list(kk=kk))
    print(res)

    # Sanity checks
    stopifnot(a == kk)

    # Clean up
    rm(a)
  } # for (kk ...)
} # for (ii ...)

## OUTPUTS:
## Iteration #1:
## Evaluating expression...done
## [1] 1
## Iteration #2:
## Evaluating expression...done
## [1] 2
## Iteration #3:
## Evaluating expression...done
## [1] 3
## Iteration #1:
## [1] 1
## Iteration #2:
## [1] 2
## Iteration #3:
## [1] 3
}

\author{Henrik Bengtsson (\url{http://www.braju.com/R/})}

\seealso{
 Internally, \code{\link[base]{eval}}() is used to evaluate the expression.
}



\keyword{programming}
\keyword{IO}
