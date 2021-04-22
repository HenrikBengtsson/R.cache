library(R.cache)

findOSCachePath <- R.cache:::findOSCachePath
getOS <- R.cache:::getOS
message("findOSCachePath() ...")

oses <- getOS()
if (isTRUE(as.logical(Sys.getenv("R_CHECK_FULL", "TRUE")))) {
  oses <- c("unix", "windows", "macos")
}

for (os in oses) {
  message("Operating system: ", sQuote(os))
  message("- getOS(): ", sQuote(getOS()))

  ## Fake the OS?
  fake_os <- (os != getOS())
  if (fake_os) {
    if (os == "windows") {
      Sys.setenv(LOCALAPPDATA = normalizePath("~/AppData/Local", mustWork = FALSE))
    }
  }

  path <- findOSCachePath(os)
  message("- findOSCachePath(): ", sQuote(path))
  
  if (getRversion() >= "4.0.0") {
    R_user_dir <- tools::R_user_dir
    path_R <- local({
      if (fake_os) {
        if (os == "macos") {
          tracer <- quote(Sys.info <- function() c(sysname = "Darwin"))
        } else {
          tracer <- quote(.Platform <- list(OS.type = os))
        }
        trace(R_user_dir, tracer = tracer)
        on.exit(untrace(R_user_dir))
      }
      R_user_dir("R.cache", which = "cache")
    })
    
    message("- R_user_dir('R.cache', which = 'cache'): ", sQuote(path_R))
    path_R <- normalizePath(path_R, mustWork = FALSE)
    message("- Normalized version: ", sQuote(path_R))
    res <- identical(path, path_R)
    message("- Identical to findOSCachePath(): ", res)
    if (!res) {
      message("- findOSCachePath() differ from R_user_dir(): ",
              sQuote(path), " != ", sQuote(path_R))
    }    
  }
} ## for (os ...)

message("findOSCachePath() ... done")
