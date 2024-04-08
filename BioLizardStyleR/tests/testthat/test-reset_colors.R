library(ggplot2)

test_that("color reset works", {

  line_plot <- ggplot(data = data.frame(x = 1:9, y = 1:9, c = rep(1:3, each = 3)), aes(x = x, y = y)) +
    geom_point(size=3) +
    geom_line(aes(group = c)) +
    lizard_style()
  reset_colors()

  expect_equal(GeomPoint$default_aes$colour, "black")
  expect_equal(GeomLine$default_aes$colour, "black")
  expect_equal(GeomRect$default_aes$fill,  "grey35")
  expect_equal(GeomPolygon$default_aes$fill, "grey20")
})
