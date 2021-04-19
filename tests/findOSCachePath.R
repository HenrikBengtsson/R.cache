library(R.cache)

findOSCachePath <- R.cache:::findOSCachePath

message("findOSCachePath() ...")

path <- findOSCachePath()
message("- findOSCachePath(): ", sQuote(path))

if (getRversion() >= "4.0.0") {
  path_R <- tools::R_user_dir("R.cache", which = "cache")
  message("- tools::R_user_dir('R.cache', which = 'cache'): ", sQuote(path_R))
  path_R <- normalizePath(path_R, mustWork = FALSE)
  message("- Normalized version: ", sQuote(path_R))
  res <- identical(path, path_R)
  message("- Identical to findOSCachePath(): ", res)
  if (!res) {
    message("- findOSCachePath() differ from tools::R_user_dir(): ",
            sQuote(path), " != ", sQuote(path_R))
  }
}

message("findOSCachePath() ... done")

