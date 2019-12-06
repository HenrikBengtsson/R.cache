.assertDigest <- function(onDiff=c("error", "warning", "message"), ...) {
  # Argument 'onDiff':
  onDiff <- match.arg(onDiff)

  # Value to validate against
  d1 <- digest(0)
  # Get the "truth"
  ver <- packageVersion("digest")
  if (ver <= "0.2.3") {
    d0 <- "78a10a7e5929f8c605f71823203c0dc5"
  } else if (ver >= "0.3.0") {
    d0 <- "908d1fd10b357ed0ceaaec823abf81bc"
  } else {
    msg <- sprintf("No assertion rule available for digest v%s. Names of cache files might differ between R version and platforms.", ver)
    warning(msg)
    return()
  }

  # Assert that we get the above results on the current machine.
  if (!identical(d1, d0)) {
    msg <- sprintf("Assertion failed: Detected inconsistency in digest::digest(0) (%s != %s) using digest v%s. The effect of this is that the generated cache files will be named differently on this platform/R version than in another.", d1, d0, ver)
    if (onDiff == "error") {
      throw(msg)
    } else if (onDiff == "warning") {
      warning(msg)
    } else {
      message(msg)
    }
  }
} # .assertDigest()
