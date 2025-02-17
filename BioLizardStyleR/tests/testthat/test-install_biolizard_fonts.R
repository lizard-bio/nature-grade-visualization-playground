testthat::test_that("font installation works", {
  testthat::expect_no_error(install_biolizard_fonts())
  testthat::expect_no_error(install_biolizard_fonts(clearDataBase = TRUE))
  testthat::expect_error(install_biolizard_fonts(pattern = "12345679"), regexp = "No matching fonts found")
})
