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


findOSCachePath_0.14.0 <- function(os = getOS()) {
  root <- switch(os,
    windows = getWindowsLocalAppData(),
    macos = file.path("~", "Library", "Caches"),
    unix = Sys.getenv("XDG_CACHE_HOME", file.path("~", ".cache")),
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

  do.call(file.path, args = as.list(path))
}

findOSCachePath_0.15.0 <- if (getRversion() >= "4.0.0") {
  function(os = getOS()) {
    ## os != getOS() only happens during package testing, for the
    ## purpose of emulating running on another operating system
    ## than the host operating system (= getOS()).
    if (os != getOS()) {
      if (os == "macos") {
        tracer <- quote(Sys.info <- function() c(sysname = "Darwin"))
      } else {
        tracer <- quote(.Platform <- list(OS.type = os))
      }
      message("- trace(tools::R_user_dir, tracer = tracer) ...")
      trace(tools::R_user_dir, tracer = tracer)
      message("- trace(tools::R_user_dir, tracer = tracer) ... done")
      on.exit(untrace(tools::R_user_dir))
    }
    
    tools::R_user_dir(.packageName, which = "cache")
  }
} else function(os = getOS()) {
  path <- Sys.getenv("R_USER_CACHE_DIR", NA_character_)
  if (is.na(path)) path <- Sys.getenv("XDG_CACHE_HOME", NA_character_)
  if (is.na(path)) {
    path <- switch(os,
      windows = file.path(Sys.getenv("LOCALAPPDATA"), "R", "cache"),
      macos   = file.path("~", "Library", "Caches", "org.R-project.R"),
      unix    = file.path("~", ".cache")
    )
  }
  file.path(path, "R", .packageName)
}


#' @importFrom utils file_test menu
findOSCachePath <- function(os = getOS(), action = c("query", "error", "warn", "remove", "move", "ignore")) {
  rm_folder_if_empty <- function(path) {
    if (!file_test("-d", path)) return(FALSE)
    content <- dir(path = path, all.files = TRUE)
    content <- setdiff(content, c(".", ".."))
    has_README <- ("README.md" %in% content)
    if (has_README) content <- setdiff(content, "README.md")
    if (length(content) > 0) return(TRUE)
    unlink(path, recursive = has_README)
    file_test("-d", path)
  }

#  message("findOSCachePath() ...")
#  on.exit(message("findOSCachePath() ... done"))

  action <- match.arg(action)
  
  if (action == "query") {
    ## Cannot query user?
    if (!interactive() || isTRUE(getOption("R.cache.onLoad", FALSE))) {
      action <- "ignore"
    }
  }

  path <- findOSCachePath_0.15.0(os = os)
  path <- normalizePath(path, mustWork = FALSE)

  ## Is there another, old cache folder? Can we migrate it?
  if (action != "ignore") {
    path_old <- findOSCachePath_0.14.0(os = os)
    path_old <- normalizePath(path_old, mustWork = FALSE)
    exists_old <- rm_folder_if_empty(path_old)
    exists <- rm_folder_if_empty(path)
    if (path != path_old && exists_old) {
      if (action == "query") {
        choices <- c(
          "Abort",
          "Ignore old R.cache folder",
          "Remove old R.cache folder",
          if (!exists) "Try to move it to the new location"
        )
        repeat {
          ans <- menu(choices, title = "What to do with old non-empty R.cache folder?")
          if (ans != 0L) break
        }
        action <- c("error", "warn", "remove", "move")[ans]
      }
      if (action == "remove") {
        if (exists_old) {
          unlink(path_old, recursive = TRUE)
          exists_old <- file_test("-d", path_old)
          if (exists_old) {
            stop("Failed to remove all of folder: ", sQuote(path_old))
          }
        }
      } else if (action == "move") {
        ## Can we move the whole folder as-is?
        if (!exists) {
          file.rename(path_old, path)
          exists <- file_test("-d", path)
          exists_old <- file_test("-d", path_old)
          if (!exists || exists_old) {
            stop(sprintf("Failed to move folder: %s (%s) -> %s (%s)",
                 sQuote(path_old), if (exists_old) "still exists" else "gone",
                 sQuote(path), if (exists) "exists" else "missing"))
          }
        } else {
          action <- "error"
        }
      }
      
      if (action %in% c("error", "warn")) {
        msg <- sprintf("There is an non-empty old-style R.cache folder that is no longer used. To reuse its content, move files and subfolders from %s to %s", sQuote(path_old), sQuote(path))
        if (action == "error") stop(msg)
        warning(msg, immediate. = TRUE)
      }
    }
  } ## if (action != "ignore")
  
  path
}

getOSCacheRootPath <- local({
  os_cache_path <- NULL
  function() {
    if (is.null(os_cache_path)) os_cache_path <<- findOSCachePath()
    os_cache_path
  }
})
