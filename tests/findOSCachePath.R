library(R.cache)

findOSCachePath <- R.cache:::findOSCachePath
getOS <- R.cache:::getOS
R_user_dir <- tools::R_user_dir
message("findOSCachePath() ...")

for (os in c("unix", "windows", "macos")) {
  message("Operating system: ", sQuote(os))
  message("- getOS(): ", sQuote(getOS()))

  ## Fake the OS?
  fake_os <- (os != getOS())
  if (fake_os) {
    if (os == "macos") {
      tracer <- quote(Sys.info <- function() c(sysname = "Darwin"))
    } else {
      tracer <- quote(.Platform <- list(OS.type = os))
    }
    if (os == "windows") {
      Sys.setenv(LOCALAPPDATA = normalizePath("~/AppData/Local", mustWork = FALSE))
    }
    trace(R_user_dir, tracer = tracer)
  }

  path <- findOSCachePath(os)
  message("- findOSCachePath(): ", sQuote(path))
  
  if (getRversion() >= "4.0.0") {
    path_R <- R_user_dir("R.cache", which = "cache")
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

  if (fake_os) {
    untrace(getOS)
    untrace(R_user_dir)
  }
} ## for (os ...)

message("findOSCachePath() ... done")

