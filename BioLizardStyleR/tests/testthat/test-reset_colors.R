library(ggplot2)

testthat::test_that("color reset works", {

  line_plot <- ggplot2::ggplot(data = data.frame(x = 1:9, y = 1:9, c = rep(1:3, each = 3)), ggplot2::aes(x = x, y = y)) +
    ggplot2::geom_point(size=3) +
    ggplot2::geom_line(aes(group = c)) +
    lizard_style()
  reset_colors()

  testthat::expect_equal(GeomPoint$default_aes$colour, "black")
  testthat::expect_equal(GeomLine$default_aes$colour, "black")
  testthat::expect_equal(GeomRect$default_aes$fill,  "grey35")
  testthat::expect_equal(GeomPolygon$default_aes$fill, "grey20")
})
