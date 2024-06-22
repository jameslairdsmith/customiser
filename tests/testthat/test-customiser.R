test_that("can convert simple R Markdown file", {
  tmpdir <- withr::local_tempdir()
  withr::local_options(list(customiser.r_home = tmpdir))

  out <- customiser(rmarkdown_simple(), quiet = TRUE)
  expect_true(file.exists(out))
})

test_that("cannot overwrite existing file by default", {
  tmpdir <- withr::local_tempdir()
  withr::local_options(list(customiser.r_home = tmpdir))
  withr::local_dir(tmpdir)
  file <- fs::file_touch(".Rprofile")
  expect_snapshot_error(customiser(rmarkdown_simple(), quiet = TRUE))
})

test_that("cannot overwrite existing file if disallowed", {
  tmpdir <- withr::local_tempdir()
  withr::local_options(list(customiser.r_home = tmpdir))
  withr::local_dir(tmpdir)
  file <- fs::file_touch(".Rprofile")
  expect_snapshot_error(customiser(rmarkdown_no_overwrite(), quiet = TRUE))
})

test_that("can overwrite existing file if allowed", {
  tmpdir <- withr::local_tempdir()
  withr::local_options(list(customiser.r_home = tmpdir))
  withr::local_dir(tmpdir)
  file <- fs::file_touch(".Rprofile")
  out <- customiser(rmarkdown_allow_overwrite(), quiet = TRUE)
  expect_snapshot(readLines(out))
})
