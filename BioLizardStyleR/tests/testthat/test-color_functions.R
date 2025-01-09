library(ggplot2)

data("mtcars")
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)

# Base plot
testplot_discrete <- ggplot(data = mtcars, aes(x = hp, y = mpg)) +
  geom_point(aes(color = carb, fill = carb), size=3, shape = 21) +
  labs(
    title = "Miles per Gallon vs. Horsepower",
    x = "Horsepower",
    y = "Miles per Gallon"
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
  expect_length(biolizard_pal_qualitative(1), 1)
  expect_length(biolizard_pal_qualitative(12), 12)
  expect_error(biolizard_pal_qualitative(13), regexp = 'number of colors exceeds')
  expect_error(biolizard_pal_qualitative(0), regexp = "at least 1")
  vdiffr::expect_doppelganger("discrete qualitative", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "qualitative") + scale_fill_biolizard(type = "discrete", scheme = "qualitative"))
  vdiffr::expect_doppelganger("discrete qualitative rev", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "qualitative", reverse=TRUE) + scale_fill_biolizard(type = "discrete", scheme = "qualitative", reverse=TRUE))
})

test_that("biolizard_pal_paired works", {
  expect_length(biolizard_pal_paired(1), 1)
  expect_length(biolizard_pal_paired(10), 10)
  expect_error(biolizard_pal_paired(13), regexp = 'number of colors exceeds')
  expect_error(biolizard_pal_paired(0), regexp = "at least 1")
  vdiffr::expect_doppelganger("discrete paired", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "paired") + scale_fill_biolizard(type = "discrete", scheme = "paired"))
  vdiffr::expect_doppelganger("discrete paired rev", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "paired", reverse=TRUE) + scale_fill_biolizard(type = "discrete", scheme = "paired", reverse=TRUE))
})

test_that("biolizard_pal_sequential works", {
  expect_length(biolizard_pal_sequential(1), 1)
  expect_length(biolizard_pal_sequential(20), 20)
  expect_error(biolizard_pal_sequential(0), regexp = "at least 1")
  vdiffr::expect_doppelganger("discrete sequential", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "sequential") + scale_fill_biolizard(type = "discrete", scheme = "sequential"))
  vdiffr::expect_doppelganger("discrete sequential rev", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "sequential", reverse=TRUE) + scale_fill_biolizard(type = "discrete", scheme = "sequential", reverse=TRUE))
  vdiffr::expect_doppelganger("continuous sequential", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "sequential") +  scale_fill_biolizard(type = "continuous", scheme = "sequential"))
  vdiffr::expect_doppelganger("continuous sequential rev", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "sequential", reverse=TRUE) +  scale_fill_biolizard(type = "continuous", scheme = "sequential", reverse=TRUE))
})

test_that("biolizard_pal_divergent works", {
  expect_length(biolizard_pal_divergent(20), 20)
  expect_error(biolizard_pal_divergent(1), regexp = "at least 2")
  vdiffr::expect_doppelganger("discrete divergent", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "divergent") + scale_fill_biolizard(type = "discrete", scheme = "divergent"))
  vdiffr::expect_doppelganger("discrete divergent rev", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "divergent", reverse=TRUE) + scale_fill_biolizard(type = "discrete", scheme = "divergent", reverse=TRUE))
  vdiffr::expect_doppelganger("continuous divergent", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "divergent") + scale_fill_biolizard(type = "continuous", scheme = "divergent"))
  vdiffr::expect_doppelganger("continuous divergent rev", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "divergent", reverse=TRUE) + scale_fill_biolizard(type = "continuous", scheme = "divergent", reverse=TRUE))
})
