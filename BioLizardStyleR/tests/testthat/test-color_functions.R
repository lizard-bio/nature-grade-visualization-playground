library(ggplot2)

data("mtcars")
mtcars$gear <- as.factor(mtcars$gear)

# Base plot
testplot_discrete <- ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point(aes(color = gear, fill = gear), size=3, shape = 21) +
  labs(
    title = "Miles per Gallon vs. Horsepower",
    x = "Horsepower",
    y = "Miles per Gallon",
    color = "Gears",
    fill = "Gears"
  )

testplot_continuous <- ggplot(data = mtcars, aes(x = hp, y = mpg, color = mpg, fill = mpg)) +
  geom_point(shape = 21) +
  labs(
    title = "Miles per Gallon vs. gears",
    x = "Horsepower",
    y = "Miles per Gallon",
    color = "Miles per Gallon",
    fill = "Miles per Gallon"
  )

test_that("biolizard_pal_qualitative works", {
  expect_length(biolizard_pal_qualitative()(1), 1)
  expect_length(biolizard_pal_qualitative()(12), 12)
  expect_error(biolizard_pal_qualitative()(13), regexp = 'number of colors exceeds')
  expect_error(biolizard_pal_qualitative()(0), regexp = "at least 1")
  vdiffr::expect_doppelganger("discrete qualitative", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "qualitative") + scale_fill_biolizard(type = "discrete", scheme = "qualitative"))
})

test_that("biolizard_pal_sequential works", {
  expect_length(biolizard_pal_sequential()(1), 1)
  expect_length(biolizard_pal_sequential()(20), 20)
  expect_error(biolizard_pal_sequential()(0), regexp = "at least 1")
  vdiffr::expect_doppelganger("discrete sequential", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "sequential") + scale_fill_biolizard(type = "discrete", scheme = "sequential"))
  vdiffr::expect_doppelganger("continuous sequential", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "sequential") +  scale_fill_biolizard(type = "continuous", scheme = "sequential"))
})

test_that("biolizard_pal_divergent works", {
  expect_length(biolizard_pal_divergent()(20), 20)
  expect_error(biolizard_pal_divergent()(1), regexp = "at least 2")
  vdiffr::expect_doppelganger("discrete divergent", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "divergent") + scale_fill_biolizard(type = "discrete", scheme = "divergent"))
  vdiffr::expect_doppelganger("continuous divergent", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "divergent") + scale_fill_biolizard(type = "continuous", scheme = "divergent"))
})
