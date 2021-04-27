queryRCmdCheck <- function(...) {
  evidences <- list()

  # Memoization
  evidences[["R_CMD_CHECK"]] <- isTRUE(as.logical(Sys.getenv("R_CMD_CHECK")))

  # Command line arguments
  args <- commandArgs()
  evidences[["vanilla"]] <- is.element("--vanilla", args)

  # Check the working directory; any components containing <pkg>.Rcheck/tests
  evidences[["pwd"]] <- FALSE
  path <- getwd()
  last_path <- ""
  while (path != last_path) {
    last_path <- path
    if (basename(path) == "tests") {
      if (grepl(".+[.]Rcheck$", dirname(path))) {
        evidences[["pwd"]] <- TRUE
	break
      }
    }
    path <- dirname(path)
  }
  
  # Is 'R CMD check' checking examples?
  evidences[["examples"]] <- is.element("CheckExEnv", search())


  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  # Conclusions
  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  if (evidences$R_CMD_CHECK) {
    res <- "R_CMD_CHECK"
  } else if (!evidences[["vanilla"]]) {
    res <- "notRunning"
  } else if (evidences[["examples"]]) {
    res <- "checkingExamples"
  } else if (evidences[["pwd"]]) {
    res <- "checkingTests"
  } else {
    res <- "notRunning"
  }

  # Make it stick
  if (res != "notRunning") {
    Sys.setenv(R_CMD_CHECK = "true")
  }

  attr(res, "evidences") <- evidences

  if (isTRUE(as.logical(Sys.getenv("R_R_CACHE_DEBUG")))) {
    file <- file.path("~", ".cache", "R", sprintf("R.cache-%d.log", Sys.getpid()))
    dir.create(dirname(file), recursive = TRUE, showWarnings = FALSE)
    cat(sprintf("Call: %s\n", paste(commandArgs(), collapse = " ")), file = file, append = TRUE)
    cat(sprintf("PID: %s\n", Sys.getpid()), file = file, append = TRUE)
    cat(sprintf("pwd: %s\n", getwd()), file = file, append = TRUE)
    cat(sprintf("search(): %s\n", paste(sQuote(search()), collapse = ", ")), file = file, append = TRUE)
    cat(sprintf("R_CMD_CHECK: %s\n", sQuote(Sys.getenv("R_CMD_CHECK", NA_character_))), file = file, append = TRUE)
    cat(sprintf("queryRCmdCheck(): %s\n", sQuote(res)), file = file, append = TRUE)
  }

  res
}


inRCmdCheck <- function() (queryRCmdCheck() != "notRunning")
