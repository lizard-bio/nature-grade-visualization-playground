library(ggplot2)
# install_biolizard_fonts()

line_plot <- ggplot(data = data.frame(x = 1:9, y = 1:9, c = rep(1:3, each = 3)), aes(x = x, y = y)) +
  geom_point(aes(color = c),size=3) +
  geom_line(aes(group = c)) +
  lizard_style()

test_that("lizard_style works", {
  vdiffr::expect_doppelganger("simple line plot", line_plot)
})
