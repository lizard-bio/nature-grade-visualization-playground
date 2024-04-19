# ---- BIOLIZARD COLOR SCALES ----

# The qualitative palette function is inspired from the Economist color scales theme available under GPL-2 License.

# Internal functions and definitions
# biolizard_qualitative_palette <- c("#01a086", "#1e2237", "#e9b940","#00C2F9", "#FF5AAF","#FF6E3A","#00FCCF",
#                                    "#8400CD" ,"#E20134","#008DF9", "#FFB2FD","#A40122")

biolizard_qualitative_palette <- c("#01a086", "#1e2237", "#e9b940","#105144", "#6CC7B7", "#233E60", "#666666", "#D6D6D6")

# the three main colors

#' Biolizard green
#' @export
blz_green <- "#01a086"

#' Biolizard dark blue
#' @export
blz_blue <- "#1e2237"

#' Biolizard yellow
#' @export
blz_yellow <- "#e9b940"

# color palette functions

#' Biolizard qualitative 8-color palette
#'
#' @examples
#' biolizard_pal_qualitative(8)
#' biolizard_pal_qualitative(4, reverse = TRUE)
#'
#' @param n Integer, number of colors. Maximum 8.
#' @param reverse Boolean, if TRUE, reverse the order of the colors
#' @seealso \code{\link{biolizard_pal_sequential}} \code{\link{biolizard_pal_divergent}}
#' @export
#'
biolizard_pal_qualitative <- function(n, reverse = FALSE) {
  colors <- biolizard_qualitative_palette
  max_n <- length(biolizard_qualitative_palette)
  if (n < 1) {
    stop("The requested number of colors must be at least 1.")
  } else if (n > max_n) {
    stop("The requested number of colors exceeds the available colors in the palette. Maximum colors:", max_n)
  }
  if (reverse) {
    return(rev(colors[1:n]))
  } else {
  return(colors[1:n])
  }
}

#' Biolizard sequential palette
#'
#' @examples
#' biolizard_pal_sequential(10)
#' biolizard_pal_sequential(4, reverse = TRUE)
#'
#' @param n Integer, number of colors.
#' @param reverse Boolean, if TRUE, reverse the order of the colors
#' @importFrom colorspace sequential_hcl
#' @seealso \code{\link{biolizard_pal_qualitative}} \code{\link{biolizard_pal_divergent}}
#' @export
#'
biolizard_pal_sequential <- function(n, reverse = FALSE) {
  if (n < 1) {
    stop("The requested number of colors must be at least 1.")
  }
  colors <- sequential_hcl(n, h = 170, c = c(0, 75, 40), l = c(90, 35), power = 1)
  if (reverse) {
    return(rev(colors))
  } else {
    return(colors)
  }
}

#' Biolizard divergent palette
#'
#' @examples
#' biolizard_pal_divergent(10)
#' biolizard_pal_divergent(4, reverse = TRUE)
#'
#' @param n Integer, number of colors.
#' @param reverse Boolean, if TRUE, reverse the order of the colors
#' @importFrom colorspace diverging_hcl
#' @seealso \code{\link{biolizard_pal_qualitative}} \code{\link{biolizard_pal_sequential}}
#' @export
#'
biolizard_pal_divergent <- function(n, reverse = FALSE) {
  if (n < 2) {
    stop("The requested number of colors must be at least 2.")
  }
  colors <- diverging_hcl(n, h = c(291, 170), c = 80, l = c(35, 95), power = 1)
  if (reverse) {
    return(rev(colors))
  } else {
    return(colors)
  }
}

#' Biolizard Color Scale
#'
#' @description
#' Use this function to incorporate the Biolizard palettes as a color scale into a ggplot object.
#'
#' The function supports three schemes:
#'
#' \itemize{
#'   \item \strong{qualitative}: Tailored to be inclusive and friendly for those with Deuteranopia.
#'   \item \strong{sequential}: Use this for ordered values. Represents underlying values using a sequence of increasing luminance. The hue is derived from the Biolizard green, using gradients in the HCL-spectrum for perceptual uniformity. Chroma follows a triangular progression for easier differentiation of the high-end values.
#'   \item \strong{divergent}: Use this for values with a natural midpoint. Codes values by a triangular luminance sequence with different hues on each arm of the palette. Crafted using hues 291 and 170, making it accessible for all major forms of color blindness.
#' }
#'
#' @section Application:
#' Add the \code{scale_color_biolizard()} or \code{scale_fill_biolizard()} function to your ggplot chain to apply the respective color or fill palette.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' data("mtcars")
#' mtcars$gear <- as.factor(mtcars$gear)
#' testplot <- ggplot(data = mtcars, aes(x = hp, y = mpg)) +
#'  geom_point(aes(color = gear),size=3) +
#'  labs(title = "Miles per Gallon vs. Horsepower",
#'       x = "Horsepower",
#'       y = "Miles per Gallon",
#'       color = "Gears")
#'  testplot +  scale_color_biolizard(type='discrete',scheme='qualitative')
#' }
#'
#' @param type Character, either 'discrete' or 'continuous'.
#' @param scheme Character, either 'qualitative', 'sequential', or 'divergent'.
#' @param reverse Boolean, if TRUE, reverse the order of the colors in the palette.
#' @param ... Additional arguments passed on to the underlying ggplot2 scale functions. For more details on these arguments, refer to the standard ggplot2 scales documentation. For discrete type, refer to the documentation of \code{\link[ggplot2]{discrete_scale}}. For continuous type, refer to the documentation of \code{\link[ggplot2]{scale_fill_gradientn}}. Two useful examples for continuous maps are trans='reverse' or limits=c(-1,1).
#' @importFrom ggplot2 scale_color_gradientn discrete_scale
#' @importFrom colorspace sequential_hcl diverging_hcl
#' @seealso \code{\link{scale_fill_biolizard}}
#' @export
scale_color_biolizard <- function(type = "discrete", scheme = "qualitative", reverse = FALSE, ...) {
  if(type == "discrete") {
    switch(scheme,
           qualitative = discrete_scale("colour", palette = function(n) biolizard_pal_qualitative(n, reverse), ...),
           sequential = discrete_scale("colour", palette = function(n) biolizard_pal_sequential(n, reverse), ...),
           divergent = discrete_scale("colour", palette = function(n) biolizard_pal_divergent(n, reverse), ...)
    )
  } else if(type == "continuous") {
    switch(scheme,
           sequential = scale_color_gradientn(colors = rev(sequential_hcl(256, h = 170, c = c(40, 75, 0), l = c(35, 90), power = 1)), ...),
           divergent = scale_color_gradientn(colors = diverging_hcl(256, h = c(291, 170), c = 80, l = c(35, 95), power = 1), ...)
    )
  } else {
    stop("Invalid type provided. Acceptable values are 'discrete' or 'continuous'.")
  }
}

#' @rdname scale_color_biolizard
#' @export
scale_colour_biolizard <- scale_color_biolizard

#' Biolizard Fill Scale
#'
#' @description
#' Use this function to incorporate the Biolizard palettes as a fill scale into a ggplot object.
#'
#' The function supports three schemes:
#'
#' \itemize{
#'   \item \strong{qualitative}: Tailored to be inclusive and friendly for those with Deuteranopia.
#'   \item \strong{sequential}: Use this for ordered values. Represents underlying values using a sequence of increasing luminance. The hue is derived from the Biolizard green, using gradients in the HCL-spectrum for perceptual uniformity. Chroma follows a triangular progression for easier differentiation of the high-end values.
#'   \item \strong{divergent}: Use this for values with a natural midpoint. Codes values by a triangular luminance sequence with different hues on each arm of the palette. Crafted using hues 291 and 170, making it accessible for all major forms of color blindness.
#' }
#'
#' @section Application:
#' Add the \code{scale_color_biolizard()} or \code{scale_fill_biolizard()} function to your ggplot chain to apply the respective color or fill palette.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(faithfuld, aes(waiting, eruptions)) +
#'  geom_raster(aes(fill = density)) +
#'  scale_fill_biolizard(type='continuous',scheme='sequential')
#' }
#'
#' @param type Character, either 'discrete' or 'continuous'.
#' @param scheme Character, either 'qualitative', 'sequential', or 'divergent'.
#' @param reverse Boolean, if TRUE, reverse the order of the colors in the palette.
#' @param ... Additional arguments passed on to the underlying ggplot2 scale functions. For more details on these arguments, refer to the standard ggplot2 scales documentation. For discrete type, refer to the documentation of \code{\link[ggplot2]{discrete_scale}}. For continuous type, refer to the documentation of \code{\link[ggplot2]{scale_fill_gradientn}}. Two useful examples for continuous maps are trans='reverse' or limits=c(-1,1).
#' @importFrom ggplot2 scale_fill_gradientn discrete_scale
#' @importFrom colorspace sequential_hcl diverging_hcl
#' @seealso \code{\link{scale_color_biolizard}}
#' @export
scale_fill_biolizard <- function(type = "discrete", scheme = "qualitative", reverse = FALSE, ...) {
  if(type == "discrete") {
    switch(scheme,
           qualitative = discrete_scale("fill", palette = function(n) biolizard_pal_qualitative(n, reverse), ...),
           sequential = discrete_scale("fill", palette = function(n) biolizard_pal_sequential(n, reverse), ...),
           divergent = discrete_scale("fill", palette = function(n) biolizard_pal_divergent(n, reverse), ...)
    )
  } else if(type == "continuous") {
    switch(scheme,
           sequential = scale_fill_gradientn(colors = rev(sequential_hcl(256, h = 170, c = c(40, 75, 0), l = c(35, 90), power = 1)), ...),
           divergent = scale_fill_gradientn(colors = diverging_hcl(256, h = c(291, 170), c = 80, l = c(35, 95), power = 1), ...)
    )
  } else {
    stop("Invalid type provided. Acceptable values are 'discrete' or 'continuous'.")
  }
}
