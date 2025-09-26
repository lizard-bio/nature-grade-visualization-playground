library(ggplot2)
# install_biolizard_fonts()

#lineplot
line_plot <- ggplot2::ggplot(data = data.frame(x = 1:9, y = 1:9, c = rep(1:3, each = 3)), ggplot2::aes(x = x, y = y)) +
  ggplot2::geom_point(size=3) +
  ggplot2::geom_line(aes(group = c)) +
  ggplot2::geom_hline(yintercept = 5) +
  lizard_style()

# line plot with theme_set
line_plot_theme_set <- function() {
  ggplot2::theme_set(lizard_style())
  p <- ggplot2::ggplot(data = data.frame(x = 1:9, y = 1:9, c = rep(1:3, each = 3)), ggplot2::aes(x = x, y = y)) +
    ggplot2::geom_point(size=3) +
    ggplot2::geom_line(aes(group = c)) +
    ggplot2::geom_hline(yintercept = 5)
  return(p)
}

#barplot
bar_plot <- ggplot2::ggplot(data.frame(x=1:10, y=1:10), ggplot2::aes(x=x, y=y)) +
  ggplot2::geom_col() +
  lizard_style()

#polygon plot
ids <- factor(c("1.1", "2.1", "1.2", "2.2", "1.3", "2.3"))
values <- data.frame(
  id = ids,
  value = c(3, 3.1, 3.1, 3.2, 3.15, 3.5)
)
positions <- data.frame(
  id = rep(ids, each = 4),
  x = c(2, 1, 1.1, 2.2, 1, 0, 0.3, 1.1, 2.2, 1.1, 1.2, 2.5, 1.1, 0.3,
        0.5, 1.2, 2.5, 1.2, 1.3, 2.7, 1.2, 0.5, 0.6, 1.3),
  y = c(-0.5, 0, 1, 0.5, 0, 0.5, 1.5, 1, 0.5, 1, 2.1, 1.7, 1, 1.5,
        2.2, 2.1, 1.7, 2.1, 3.2, 2.8, 2.1, 2.2, 3.3, 3.2)
)

datapoly <- merge(values, positions, by = c("id"))
poly_plot <- ggplot2::ggplot(datapoly, ggplot2::aes(x = x, y = y)) +
  ggplot2::geom_polygon(ggplot2::aes(group = id)) +
  lizard_style()

#boxplot
box_plot <- ggplot2::ggplot(data = data.frame(y = 1:9, c = as.factor(rep(1:3, each = 3))), ggplot2::aes(x = c, y = y)) +
  ggplot2::geom_boxplot() +
  lizard_style()

testthat::test_that("lizard_style works", {
  vdiffr::expect_doppelganger("simple line plot", line_plot)
  vdiffr::expect_doppelganger("simple line plot with theme_set()", line_plot_theme_set())
  vdiffr::expect_doppelganger("simple bar plot", bar_plot)
  vdiffr::expect_doppelganger("simple polygon plot", poly_plot)
  vdiffr::expect_doppelganger("simple boxplot", box_plot)
})

