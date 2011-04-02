for (kk in 1:5) {
  printf("Iteration #%d:\n", kk)
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
    printf("Iteration #%d:\n", kk)
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
