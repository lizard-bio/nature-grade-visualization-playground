test_that("font installation works", {
  expect_no_error(install_biolizard_fonts())
  expect_no_error(install_biolizard_fonts(clearDataBase = TRUE))
  expect_error(install_biolizard_fonts(pattern = "12345679"), regexp = "No matching fonts found")
})
