#' @export
customiser <- function(file, ...) {
  dest <- fs::path_home_r(".Rprofile")
  tangle_rmarkdown(file, dest)
}

tangle_rmarkdown <- function(file, dest) {
  tmp <- tempfile()
  file.copy(file, tmp)
  out_location <- knitr::purl(tmp, documentation = 0)
  file.rename(out_location, to = dest)
  dest
}

simple_rmarkdown_file <- function() {
  system.file("simple-rmarkdown.Rmd", package = "customiser")
}
