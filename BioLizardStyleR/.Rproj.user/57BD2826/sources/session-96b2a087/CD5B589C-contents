#' Biolizard qualitative colors
#'
#' A set of colors primarily chosen for discrete data representation.
#'
#' @export
biolizard_qualitative_colors <- c("#01a086", "#1e2237", "#e9b940", "#3B8EA5","#E9724C", "#F0A4E2")

#' Biolizard qualitative color palette function
#'
#' Provides a function to retrieve a specified number of qualitative colors from the Biolizard palette.
#'
#' @return A function that takes an integer \code{n} and returns a vector of \code{n} colors.
#'
biolizard_pal_qualitative <- function() {
  max_n <- length(biolizard_qualitative_colors)
  function(n) {
    if (n > max_n) {
      stop("n is larger than the maximum number of colors available in the palette")
    }
    biolizard_qualitative_colors[1:n]  # return the selected colors
  }
}


#' Biolizard qualitative color scale
#'
#' @importFrom ggplot2 discrete_scale
#' @export
#'
scale_colour_qualitative_biolizard <- function(...) {
  discrete_scale("colour", "biolizard", biolizard_pal_qualitative(), ...)
}

#' Biolizard qualitative fill scale
#'
#' @importFrom ggplot2 discrete_scale
#' @export
#'
scale_fill_qualitative_biolizard <- function(...) {
  discrete_scale("fill", "biolizard", biolizard_pal_qualitative(), ...)
}

#' Alternative spelling for color scale
#'
#' @rdname scale_colour_qualitative_biolizard
#'
scale_color_qualitative_biolizard <- scale_colour_qualitative_biolizard

#----------------------------------------------

#' Biolizard sequential color palette function
#'
#' Provides a function that returns a specified number of sequential colors using the cividis scale.
#'
#' @return A function that takes an integer \code{n} and returns a vector of \code{n} colors.
#'
biolizard_pal_sequential <- function() {
  function(n) {
    viridisLite::cividis(n)  # return the selected colors
  }
}

#' Biolizard sequential fill scale
#'
#' @importFrom ggplot2 discrete_scale
#' @export
#'
scale_fill_sequential_biolizard <- function(...) {
  discrete_scale("fill","biolizard", biolizard_pal_sequential(),...)
}

#' Biolizard sequential color scale
#'
#' Provides a function for the sequential color scale.
#'
#' @importFrom ggplot2 discrete_scale
#' @export
scale_colour_sequential_biolizard <- function(...){
  discrete_scale("colour","biolizard", biolizard_pal_sequential(),...)
}

#' Alternative spelling for sequential color scale
#'
#' @rdname scale_colour_sequential_biolizard
#' @export
scale_color_sequential_biolizard <- scale_colour_sequential_biolizard

#-------------------------------------------

#' Biolizard gradient fill scale
#'
#' @importFrom ggplot2 scale_fill_gradientn
#' @importFrom viridisLite cividis
#' @export
#'
scale_fill_gradient_biolizard <- function(...) {
  scale_fill_gradientn(colors = viridisLite::cividis(256), ...)
}

#' Biolizard gradient color scale
#'
#' @importFrom ggplot2 scale_color_gradientn
#' @importFrom viridisLite cividis
#' @export
#'
scale_color_gradient_biolizard <- function(...) {
  scale_color_gradientn(colors = viridisLite::cividis(256), ...)
}

#' Alternative spelling for gradient color scale
#'
#' @rdname scale_color_gradient_biolizard
#' @export
scale_colour_gradient_biolizard <- scale_color_gradient_biolizard
