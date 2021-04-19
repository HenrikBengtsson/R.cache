getOS <- function() {
  if (.Platform[["OS.type"]] == "windows") return("windows")
  if (Sys.info()["sysname"] == "Darwin") return("macos")
  if (.Platform[["OS.type"]] == "unix") return("unix")
  NA_character_
}


## REFERENCES:
## [1] https://docs.microsoft.com/en-us/windows/deployment/usmt/usmt-recognized-environment-variables
getWindowsLocalAppData <- function() {
  ## Env var 'LOCALAPPDATA' should be defined on Windows Vista and later
  path <- Sys.getenv("LOCALAPPDATA", NA_character_)
  if (!is.na(path)) return(path)

  ## We might end up here because we're on Windows XP or for other reasons
  root <- Sys.getenv("USERPROFILE", NA_character_)
  if (is.na(root)) return(NA_character_)  ## Should not happen

  ## Is there an 'AppData/Local' folder?
  path <- file.path(root, "AppData" , "Local")
  if (!is.na(path)) return(path)

  ## Is there an 'Local Settings/Application Data' folder? (Windows XP)
  path <- file.path(root, "Local Settings", "Application Data")
  if (!is.na(path)) return(path)

  ## We shouldn't really end up here, but who knows ...
  NA_character_
}


findOSCachePath <- function(os = getOS()) {
  root <- switch(os,
    windows = file.path(getWindowsLocalAppData(), "R", "cache"),
    macos = file.path("~", "Library", "Caches", "org.R-project.R"),
    unix = Sys.getenv("XDG_CACHE_HOME", "~/.cache"),
    NA_character_
  )

  ## Did we find a OS-specific cache folder?
  if (!is.na(root)) {
    path <- c(root, "R", "R.cache")
  } else {
    ## If not, the fall back to "~/.Rcache", which by the way was the
    ## default in R.cache (<= 0.13.0)
    path <- c("~", ".Rcache")
  }

  path <- do.call(file.path, args = as.list(path))
  path <- normalizePath(path, mustWork = FALSE)

  path
}

getOSCacheRootPath <- local({
  os_cache_path <- NULL
  function() {
    if (is.null(os_cache_path)) os_cache_path <<- findOSCachePath()
    os_cache_path
  }
})
