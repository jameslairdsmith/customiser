#' Create your .Rprofile from R Markdown
#'
#' Mainly useful as the "knit:" parameter of an R Markdown file. A document with
#' this option will have its R code made into the contents of the appropriate
#' .Rprofile file for the user's operating system.
#'
#' @param file Character. The R Markdown file from which to extract code.
#' @param ... For future extensions and must be empty.
#' @param quiet Logical. Whether to silence the confirmation message.
#'   `FALSE` by default.
#'
#' @details
#' The function always writes the .Rprofile to R's home directory as determined
#' by `fs::path_home_r()`. If you wish to overwrite this behaviour, you can
#' set the "customiser.r_home" global option to the target directory of your
#' choosing.
#'
#' @return Invisibly, a string with the location of the .Rprofile file being
#'  written to.
#'
#' @examples
#' library(withr)
#' my_rmarkdown_file <- rmarkdown_simple()
#'
#' tmp <- tempdir()
#'
#' with_options(list(customiser.r_home = tmp), {
#'   customiser(my_rmarkdown_file)
#' })
#'
#' file.exists(file.path(tmp, ".Rprofile"))
#' @export
customiser <- function(file, ..., quiet = FALSE) {

  rlang::check_dots_empty()
  dest <- fs::path(r_home(), ".Rprofile")
  params <- rmarkdown::yaml_front_matter(file)

  if(is.null(params$allow_overwrite)) {
    allow_overwrite <- FALSE
  } else {
    allow_overwrite <- params$allow_overwrite
  }

  if(!allow_overwrite && file.exists(dest)) {
    stop("\".Rprofile\" already exists.\n",
         "Do you want to set `allow_overwrite: TRUE`?",
         call. = FALSE)
  }

  out <- tangle_rmarkdown(file, dest)
  if(!quiet) message("Code successfully written to .Rprofile.")
  invisible(out)
}

tangle_rmarkdown <- function(file, dest) {
  tmp <- tempfile()
  file.copy(file, tmp)
  out_location <- knitr::purl(tmp, documentation = 0, quiet = TRUE)
  file.rename(out_location, to = dest)
  dest
}

r_home <- function() {
  custom <- getOption("customiser.r_home")
  if(!is.null(custom)) return(custom)
  fs::path_home_r()
}

#' Example R markdown files
#'
#' Used exclusively for testing, the package comes with a few simple R Markdown
#' files.
#'
#' @return Character path to the example file.
#' @examples
#' rmarkdown_simple()
#' rmarkdown_no_overwrite()
#' rmarkdown_allow_overwrite()
#' @export
rmarkdown_simple <- function() {
  system.file("simple-rmarkdown.Rmd", package = "customiser", mustWork = TRUE)
}

#' @rdname rmarkdown_simple
#' @export
rmarkdown_no_overwrite <- function() {
  system.file("no-overwrite.Rmd", package = "customiser", mustWork = TRUE)
}

#' @rdname rmarkdown_simple
#' @export
rmarkdown_allow_overwrite <- function() {
  system.file("allow-overwrite.Rmd", package = "customiser", mustWork = TRUE)
}
