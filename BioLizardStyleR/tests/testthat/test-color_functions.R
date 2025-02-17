library(ggplot2)

data("mtcars")
mtcars$gear <- as.factor(mtcars$gear)
mtcars$carb <- as.factor(mtcars$carb)

# Base plot
testplot_discrete <- ggplot2::ggplot(data = mtcars, ggplot2::aes(x = hp, y = mpg)) +
  ggplot2::geom_point(ggplot2::aes(color = carb, fill = carb), size=3, shape = 21) +
  ggplot2::labs(
    title = "Miles per Gallon vs. Horsepower",
    x = "Horsepower",
    y = "Miles per Gallon"
  )

testplot_continuous <- ggplot2::ggplot(data = mtcars, ggplot2::aes(x = hp, y = mpg, color = mpg, fill = mpg)) +
  ggplot2::geom_point(shape = 21) +
  ggplot2::labs(
    title = "Miles per Gallon vs. gears",
    x = "Horsepower",
    y = "Miles per Gallon",
    color = "Miles per Gallon",
    fill = "Miles per Gallon"
  )

testthat::test_that("biolizard_pal_qualitative works", {
  testthat::expect_length(biolizard_pal_qualitative(1), 1)
  testthat::expect_length(biolizard_pal_qualitative(12), 12)
  testthat::expect_error(biolizard_pal_qualitative(13), regexp = 'number of colors exceeds')
  testthat::expect_error(biolizard_pal_qualitative(0), regexp = "at least 1")
  vdiffr::expect_doppelganger("discrete qualitative", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "qualitative") + scale_fill_biolizard(type = "discrete", scheme = "qualitative"))
  vdiffr::expect_doppelganger("discrete qualitative rev", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "qualitative", reverse=TRUE) + scale_fill_biolizard(type = "discrete", scheme = "qualitative", reverse=TRUE))
})

testthat::test_that("biolizard_pal_paired works", {
  testthat::expect_length(biolizard_pal_paired(1), 1)
  testthat::expect_length(biolizard_pal_paired(10), 10)
  testthat::expect_error(biolizard_pal_paired(13), regexp = 'number of colors exceeds')
  testthat::expect_error(biolizard_pal_paired(0), regexp = "at least 1")
  vdiffr::expect_doppelganger("discrete paired", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "paired") + scale_fill_biolizard(type = "discrete", scheme = "paired"))
  vdiffr::expect_doppelganger("discrete paired rev", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "paired", reverse=TRUE) + scale_fill_biolizard(type = "discrete", scheme = "paired", reverse=TRUE))
})

testthat::test_that("biolizard_pal_hue works", {
  testthat::expect_length(biolizard_pal_hue(1), 1)
  testthat::expect_length(biolizard_pal_hue(100), 100)
  vdiffr::expect_doppelganger("discrete hue", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "hues") + scale_fill_biolizard(type = "discrete", scheme = "hues"))
  vdiffr::expect_doppelganger("discrete hue rev", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "hues", reverse=TRUE) + scale_fill_biolizard(type = "discrete", scheme = "hues", reverse=TRUE))
})

testthat::test_that("biolizard_pal_l_viridis works", {
  testthat::expect_length(biolizard_pal_l_viridis(1), 1)
  testthat::expect_length(biolizard_pal_l_viridis(20), 20)
  testthat::expect_error(biolizard_pal_l_viridis(0), regexp = "at least 1")
  vdiffr::expect_doppelganger("continuous l_viridis", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "l_viridis") +  scale_fill_biolizard(type = "continuous", scheme = "l_viridis"))
  vdiffr::expect_doppelganger("continuous l_viridis rev", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "l_viridis", reverse=TRUE) +  scale_fill_biolizard(type = "continuous", scheme = "l_viridis", reverse=TRUE))
  vdiffr::expect_doppelganger("continuous l_viridis", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "l_viridis") +  scale_fill_biolizard(type = "continuous", scheme = "l_viridis"))
  vdiffr::expect_doppelganger("continuous l_viridis rev", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "l_viridis", reverse=TRUE) +  scale_fill_biolizard(type = "continuous", scheme = "l_viridis", reverse=TRUE))
})

testthat::test_that("biolizard_pal_sequential works", {
  testthat::expect_length(biolizard_pal_sequential(1), 1)
  testthat::expect_length(biolizard_pal_sequential(20), 20)
  testthat::expect_error(biolizard_pal_sequential(0), regexp = "at least 1")
  vdiffr::expect_doppelganger("discrete sequential", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "greens") + scale_fill_biolizard(type = "discrete", scheme = "greens"))
  vdiffr::expect_doppelganger("discrete sequential rev", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "greens", reverse=TRUE) + scale_fill_biolizard(type = "discrete", scheme = "greens", reverse=TRUE))
  vdiffr::expect_doppelganger("continuous sequential", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "greens") +  scale_fill_biolizard(type = "continuous", scheme = "greens"))
  vdiffr::expect_doppelganger("continuous sequential rev", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "greens", reverse=TRUE) +  scale_fill_biolizard(type = "continuous", scheme = "greens", reverse=TRUE))
})

testthat::test_that("biolizard_pal_divergent works", {
  testthat::expect_length(biolizard_pal_divergent(20), 20)
  testthat::expect_error(biolizard_pal_divergent(1), regexp = "at least 2")
  vdiffr::expect_doppelganger("discrete divergent", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "divergent") + scale_fill_biolizard(type = "discrete", scheme = "divergent"))
  vdiffr::expect_doppelganger("discrete divergent rev", testplot_discrete + scale_color_biolizard(type = "discrete", scheme = "divergent", reverse=TRUE) + scale_fill_biolizard(type = "discrete", scheme = "divergent", reverse=TRUE))
  vdiffr::expect_doppelganger("continuous divergent", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "divergent") + scale_fill_biolizard(type = "continuous", scheme = "divergent"))
  vdiffr::expect_doppelganger("continuous divergent rev", testplot_continuous + scale_color_biolizard(type = "continuous", scheme = "divergent", reverse=TRUE) + scale_fill_biolizard(type = "continuous", scheme = "divergent", reverse=TRUE))
})
