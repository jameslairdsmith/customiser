#' @export
customiser <- function(file, ...) {

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

  tangle_rmarkdown(file, dest)
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

rmarkdown_simple <- function() {
  system.file("simple-rmarkdown.Rmd", package = "customiser", mustWork = TRUE)
}

rmarkdown_no_overwrite <- function() {
  system.file("no-overwrite.Rmd", package = "customiser", mustWork = TRUE)
}

rmarkdown_allow_overwrite <- function() {
  system.file("allow-overwrite.Rmd", package = "customiser", mustWork = TRUE)
}
