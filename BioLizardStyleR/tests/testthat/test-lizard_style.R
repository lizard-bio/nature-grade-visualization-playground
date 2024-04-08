library(ggplot2)
# install_biolizard_fonts()

#lineplot
line_plot <- ggplot(data = data.frame(x = 1:9, y = 1:9, c = rep(1:3, each = 3)), aes(x = x, y = y)) +
  geom_point(size=3) +
  geom_line(aes(group = c)) +
  geom_hline(yintercept = 5) +
  lizard_style()

#barplot
bar_plot <- ggplot(data.frame(x=1:10, y=1:10), aes(x=x, y=y)) +
  geom_col() +
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
poly_plot <- ggplot(datapoly, aes(x = x, y = y)) +
  geom_polygon(aes(group = id)) +
  lizard_style()

#boxplot
box_plot <- ggplot(data = data.frame(y = 1:9, c = as_factor(rep(1:3, each = 3))), aes(x = c, y = y)) +
  geom_boxplot() +
  lizard_style()

test_that("lizard_style works", {
  vdiffr::expect_doppelganger("simple line plot", line_plot)
  vdiffr::expect_doppelganger("simple bar plot", bar_plot)
  vdiffr::expect_doppelganger("simple polygon plot", poly_plot)
  vdiffr::expect_doppelganger("simple boxplot", box_plot)
})

