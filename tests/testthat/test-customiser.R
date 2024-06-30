test_that("can convert simple R Markdown file", {
  tmpdir <- tempdir()
  withr::local_options(list(customiser.r_home = tmpdir))

  out <- customiser(rmarkdown_simple(), quiet = TRUE)
  withr::defer(unlink(out))
  expect_true(file.exists(out))
})

test_that("can pass in dots", {
  tmpdir <- tempdir()
  withr::local_options(list(customiser.r_home = tmpdir))

  out <- customiser(rmarkdown_simple(), encoding = "utf8", quiet = TRUE)
  withr::defer(unlink(out))
  expect_true(file.exists(out))
})

test_that("cannot overwrite existing file by default", {
  tmpdir <- tempdir()
  withr::local_options(list(customiser.r_home = tmpdir))
  withr::local_dir(tmpdir)
  file <- fs::file_touch(".Rprofile")
  expect_snapshot_error(customiser(rmarkdown_simple(), quiet = TRUE))
})

test_that("cannot overwrite existing file if disallowed", {
  tmpdir <- tempdir()
  withr::local_options(list(customiser.r_home = tmpdir))
  withr::local_dir(tmpdir)
  file <- fs::file_touch(".Rprofile")
  expect_snapshot_error(customiser(rmarkdown_no_overwrite(), quiet = TRUE))
})

test_that("can overwrite existing file if allowed", {
  tmpdir <- tempdir()
  withr::local_options(list(customiser.r_home = tmpdir))
  withr::local_dir(tmpdir)
  file <- fs::file_touch(".Rprofile")
  out <- customiser(rmarkdown_allow_overwrite(), quiet = TRUE)
  expect_snapshot(readLines(out))
})
