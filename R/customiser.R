#' @export
customiser <- function(file, ...) {
  dest <- fs::path_home_r(".Rprofile")
  params <- rmarkdown::yaml_front_matter(file)

  allow_overwrite <- if(is.null(params$allow_overwrite)) FALSE else params$allow_overwrite

  if(!allow_overwrite && file.exists(file)) {
    stop(".Rprofile already exists. Do you want to set `allow_overwrite: TRUE`?")
  }

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
