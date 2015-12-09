library(testthat)

context("Validate")


test_that("validate_filename_output -good", {   
  path <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test-data/2015-portland")
  
  invisible_1 <- validate_filename_output("b1_female_a_grip_categories_4.out", path)
  invisible_2 <- validate_filename_output("b1_female_aehplus_gait_grip.out", path)
  invisible_3 <- validate_filename_output("b1_female_aehplus_grip_gait.out", path)
  
  expect_true(invisible_1, "The first file name should be validated correctly.")
  expect_true(invisible_2, "The second file name should be validated correctly.")
  expect_true(invisible_3, "The third file name should be validated correctly.")
})

test_that("validate_filename_output -missing", {   
  path <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test-data/2015-portland")
  expected_error_regex <- "The output file was not found at .+"
  expect_error(
    regexp = expected_error_regex,
    validate_filename_output("no_one_is_here.out", path)
  )
})

test_that("validate_filename_output -bad extension", {   
  path <- base::file.path(devtools::inst(name="IalsaSynthesis"), "test-data/2015-portland")
  expected_error_regex <- "The output file extension `bad` did not match the expected value of `out`."
  expect_error(
    regexp = expected_error_regex,
    validate_filename_output("extension.bad", path)
  )
})
