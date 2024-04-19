# ---- BIOLIZARD COLOR SCALES ----

# The qualitative palette function is inspired from the Economist color scales theme available under GPL-2 License.

# Internal functions and definitions
# biolizard_qualitative_palette <- c("#01a086", "#1e2237", "#e9b940","#00C2F9", "#FF5AAF","#FF6E3A","#00FCCF",
#                                    "#8400CD" ,"#E20134","#008DF9", "#FFB2FD","#A40122")

blz_green <- "#01a086"
blz_blue <- "#1e2237"
blz_yellow <- "#e9b940"

biolizard_qualitative_palette <- c("#01a086", "#1e2237", "#e9b940","#105144", "#6CC7B7", "#233E60", "#666666", "#D6D6D6")

#333333
#404040
#555555
#808080
#666666
#737373


biolizard_pal_qualitative <- function() {
  colors <- biolizard_qualitative_palette
  max_n <- length(biolizard_qualitative_palette)
  f <- function(n) {
    if (n < 1) {
      stop("The requested number of colors must be at least 1.")
    } else if (n > max_n) {
      stop("The requested number of colors exceeds the available colors in the palette. Maximum colors:", max_n)
    }
    return(colors[1:n])
  }
  return(f)
}
biolizard_pal_sequential <- function() {
  f <- function(n) {
    if (n < 1) {
      stop("The requested number of colors must be at least 1.")
    }
    colors <- sequential_hcl(n, h = 170, c = c(40, 75, 0), l = c(35, 90), power = 1)
    return(rev(colors))
  }
  return(f)
}

biolizard_pal_divergent <- function() {
  f <- function(n) {
    if (n < 2) {
      stop("The requested number of colors must be at least 2.")
    }
    return(diverging_hcl(n, h = c(291, 170), c = 80, l = c(35, 95), power = 1))
  }
  return(f)
}

#' Biolizard Color Scale
#'
#' @description
#' Use this function to incorporate the Biolizard palettes as a color scale into a ggplot object.
#'
#' The function supports three schemes:
#'
#' \itemize{
#'   \item \strong{qualitative}: Tailored to be inclusive and friendly for those with Deuteranopia. Inspired by Martin Krzywinski's palette and infused with Biolizard's house colors.
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
#' @param ... Additional arguments passed on to the underlying ggplot2 scale functions. For more details on these arguments, refer to the standard ggplot2 scales documentation. For discrete type, refer to the documentation of \code{\link[ggplot2]{discrete_scale}}. For continuous type, refer to the documentation of \code{\link[ggplot2]{scale_fill_gradientn}}. Two useful examples for continuous maps are trans='reverse' or limits=c(-1,1).
#' @importFrom ggplot2 scale_color_gradientn discrete_scale
#' @importFrom colorspace sequential_hcl diverging_hcl
#' @seealso \code{\link{scale_fill_biolizard}}
#' @export
scale_color_biolizard <- function(type = "discrete", scheme = "qualitative", ...) {
  if(type == "discrete") {
    switch(scheme,
           qualitative = discrete_scale("colour", palette = biolizard_pal_qualitative(), ...),
           sequential = discrete_scale("colour", palette = biolizard_pal_sequential(), ...),
           divergent = discrete_scale("colour", palette = biolizard_pal_divergent(), ...)
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
#'   \item \strong{qualitative}: Tailored to be inclusive and friendly for those with Deuteranopia. Inspired by Martin Krzywinski's palette and infused with Biolizard's house colors.
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
#' @param ... Additional arguments passed on to the underlying ggplot2 scale functions. For more details on these arguments, refer to the standard ggplot2 scales documentation. For discrete type, refer to the documentation of \code{\link[ggplot2]{discrete_scale}}. For continuous type, refer to the documentation of \code{\link[ggplot2]{scale_fill_gradientn}}. Two useful examples for continuous maps are trans='reverse' or limits=c(-1,1).
#' @importFrom ggplot2 scale_fill_gradientn discrete_scale
#' @importFrom colorspace sequential_hcl diverging_hcl
#' @seealso \code{\link{scale_color_biolizard}}
#' @export
scale_fill_biolizard <- function(type = "discrete", scheme = "qualitative", ...) {
  if(type == "discrete") {
    switch(scheme,
           qualitative = discrete_scale("fill", palette = biolizard_pal_qualitative(), ...),
           sequential = discrete_scale("fill", palette = biolizard_pal_sequential(), ...),
           divergent = discrete_scale("fill", palette = biolizard_pal_divergent(), ...)
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
