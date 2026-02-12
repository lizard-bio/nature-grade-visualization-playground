# ---- BIOLIZARD COLOR SCALES ----

# The qualitative palette function is inspired from the Economist color scales theme available under GPL-2 License.

# Internal functions and definitions
# old scale
# biolizard_qualitative_palette <- c("#01A086", "#1E2237", "#E9B940", "#5D7EA5", "#860202",
#                                    "#89D2C6", "#C56F27", "#EED8A1", "#9CAEC3", "#B073DE",
#                                    "#03F2F7", "#71BD8B")
# biolizard_paired_palette <- c("#6CC7B7", "#176B59", "#5D7EA5", "#1E2237",
#                               "#EED8A1", "#e9b940", "#D6D6D6",  "#828282",
#                               "#DE5F5F", "#860202")

# new scale
# biolizard_qualitative_palette <- c("#9fd356", "#009944", "#0d47a1", "#1e88e5", "#E5A4CB", "#FF6F59", "#75DDDD", "#F72585")
biolizard_qualitative_palette <- c("#9fd356", "#0d47a1", "#E5A4CB", "#FF6F59", "#75DDDD", "#009944", "#1e88e5", "#F72585")

biolizard_paired_palette <- c("#9fd356", "#009944", "#1e88e5", "#0d47a1", "#E5A4CB", "#F72585")


# the three main colors
# deprecate: no main colors anymore --> all black

#' Biolizard green
#' @export
# blz_green <- "#01a086"
blz_green <- {
  lifecycle::deprecate_warn("3.0.0", what = I("blz_green"),
                            details = "The BioLizard green (#01a086) is no longer part of the BioLizard brand. Returning black.")
  "#000000"
}

#' Biolizard dark blue
#' @export
# blz_blue <- "#1e2237"
blz_blue <- {
  lifecycle::deprecate_warn("3.0.0", what = I("blz_blue"),
                            details = "The BioLizard dark blue (#1e2237) is no longer part of the BioLizard brand. Returning black.")
  "#000000"
}


#' Biolizard yellow
#' @export
# blz_yellow <- "#e9b940"
blz_yellow <- {
  lifecycle::deprecate_warn("3.0.0", what = I("blz_yellow"),
                            details = "The BioLizard yellow (#e9b940) is no longer part of the BioLizard brand. Returning black.")
  "#000000"
}



# color palette functions

#' Biolizard qualitative 12-color palette
#'
#' @description
#' Returns a colorblind-safe qualitative color palette starting with Biolizard's signature green, blue and yellow.
#'
#' @examples
#' biolizard_pal_qualitative(8)
#' biolizard_pal_qualitative(4, reverse = TRUE)
#'
#' @param n Integer, number of colors. Maximum 12.
#' @param reverse Boolean, if TRUE, reverse the order of the colors
#' @seealso [biolizard_pal_paired()] [biolizard_pal_hue()] [biolizard_pal_sequential()] [biolizard_pal_divergent()]
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

#' Biolizard qualitative paired palette
#'
#' @description
#' Returns a colorblind-safe qualitative color palette inspired by Biolizard's signature green, blue and yellow.
#' Every two consecutive colors have a similar hue, making this palette especially suitable for paired levels:
#' e.g. two cases for different time points, such as control_t1, case_t1, control_t2, case_t2, control_t3, case_t3, ...
#'
#' @examples
#' biolizard_pal_paired(8)
#' biolizard_pal_paired(4, reverse = TRUE)
#'
#' @param n Integer, number of colors. Maximum 10.
#' @param reverse Boolean, if TRUE, reverse the order of the colors
#' @seealso [biolizard_pal_hue()] [biolizard_pal_qualitative()] [biolizard_pal_sequential()] [biolizard_pal_divergent()]
#' @export
#'
biolizard_pal_paired <- function(n, reverse = FALSE) {
  colors <- biolizard_paired_palette
  max_n <- length(biolizard_paired_palette)
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

#' Biolizard hues palette
#'
#' @description
#' Specific case of the `scales::pal_hue` function that returns a discrete color scale
#' starting with Biolizard's signature green (#01a086). This scale can be expanded to large
#' number of colors, but DOES NOT guarantee color-blind safe palettes.
#'
#' @examples
#' biolizard_pal_hue(12)
#' biolizard_pal_hue(5, reverse = TRUE)
#'
#' @param n Integer, number of colors.
#' @param reverse Boolean, if TRUE, reverse the order of the colors
#' @importFrom scales pal_hue
#' @seealso [biolizard_pal_paired()] [biolizard_pal_qualitative()] [biolizard_pal_divergent()] [biolizard_pal_sequential()]
#' @export
#'
biolizard_pal_hue <- function(n, reverse = FALSE) {
  if (!reverse) {
    return(pal_hue(l = 55, c = 71, h.start = 135)(n))
  } else {
    return(pal_hue(l = 55, c = 71, h.start = 135, direction = -1)(n))
  }
}

#' Biolizard sequential palette
#'
#' @description
#' Sequential color palette inspired by Biolizard's signature green.
#'
#' @examples
#' biolizard_pal_sequential(10)
#' biolizard_pal_sequential(4, reverse = TRUE)
#'
#' @param n Integer, number of colors.
#' @param reverse Boolean, if TRUE, reverse the order of the colors
#' @importFrom colorspace sequential_hcl
#' @seealso [biolizard_pal_paired()] [biolizard_pal_hue()] [biolizard_pal_qualitative()] [biolizard_pal_divergent()]
#' @export
#'
biolizard_pal_sequential <- function(n, reverse = FALSE) {
  if (n < 1) {
    stop("The requested number of colors must be at least 1.")
  }
  colors <- sequential_hcl(n, h = 250, c = c(90, 100, 70), l = c(75, 15), power = 1)
  if (reverse) {
    return(rev(colors))
  } else {
    return(colors)
  }
}

#' Biolizard divergent palette
#'
#' @description
#' Divergent color palette inspired by Biolizard's signature green.
#'
#' @examples
#' biolizard_pal_divergent(10)
#' biolizard_pal_divergent(4, reverse = TRUE)
#'
#' @param n Integer, number of colors.
#' @param reverse Boolean, if TRUE, reverse the order of the colors
#' @importFrom colorspace diverging_hcl
#' @seealso [biolizard_pal_paired()] [biolizard_pal_hue()] [biolizard_pal_qualitative()] [biolizard_pal_sequential()]
#' @export
#'
biolizard_pal_divergent <- function(n, reverse = FALSE) {
  if (n < 2) {
    stop("The requested number of colors must be at least 2.")
  }
  # colors <- diverging_hcl(n, h = c(291, 170), c = 80, l = c(35, 95), power = 1)
  colors <- diverging_hcl(n, h = c(250, 115), c = c(80, 100), l = c(35, 90), power = 1)
  if (reverse) {
    return(rev(colors))
  } else {
    return(colors)
  }
}


#' l_viridis continuous color scale
#'
#' @description
#' This color scale is inspired by the viridis colorscale, and passes through biolizard's signature yellow and green (or very similar).
#' Like viridis it is colorblind-friendly and perceptually uniform.
#' It was created using `viscm` (https://github.com/matplotlib/viscm) and named l_viridis, after the European green lizard (Lacerta viridis)
#'
#' @examples
#' biolizard_pal_l_viridis(10)
#' biolizard_pal_l_viridis(4, reverse = TRUE)
#'
#' @param n Integer, number of colors.
#' @param reverse Boolean, if TRUE, reverse the order of the colors
#' @importFrom scales pal_gradient_n
#' @importFrom grDevices rgb
#' @seealso [biolizard_pal_paired()] [biolizard_pal_hue()] [biolizard_pal_qualitative()] [biolizard_pal_divergent()]
#' @export
#'
biolizard_pal_l_viridis <- function(n, reverse = FALSE) {
  if (n < 1) {
    stop("The requested number of colors must be at least 1.")
  }
  # convert rgb colors from viscm to hex
  hex <- apply(l_viridis_rgb, 1, function(x) grDevices::rgb(x[1], x[2], x[3], maxColorValue = 1))
  colors <- pal_gradient_n(hex)(seq(0, 1, length.out = n))
  if (reverse) {
    return(colors)
  } else {
    return(rev(colors))  #reverse to make the palette start with yellow
  }
}


#' Biolizard ggplot2 Scales
#'
#' @description
#' Use this function to incorporate the Biolizard palettes as a color scale into a ggplot object.
#'
#' The function supports five schemes for discrete data:
#'
#' \itemize{
#'   \item **qualitative**: Colorblind-safe qualitative color palette starting with Biolizard's signature green, blue and yellow.
#'   \item **paired**: Colorblind-safe qualitative color palette inspired by Biolizard's signature colors, especially suited for levels that are related 2-by-2.
#'   \item **hues**: Maps each level to an evenly spaced hue on the color wheel, starting with Biolizard's signature green. DOES NOT generate colorblind-safe palettes.
#'   \item **l_viridis**: Sequential color palette inspired by the viridis color scale, passing through Biolizard's signature yellow and green.
#'   \item **sequential**: Sequential color palette inspired by Biolizard's signature green.
#'   \item **divergent**: Divergent color palette inspired by Biolizard's signature green.
#' }
#'
#' And three schemes for continuous data:
#'
#' \itemize{
#'   \item **l_viridis**: Sequential color palette inspired by the viridis color scale, passing through Biolizard's signature yellow and green.
#'   \item **sequential**: Sequential color palette inspired by Biolizard's signature green.
#'   \item **divergent**: Divergent color palette inspired by Biolizard's signature green.
#' }
#'
#' @section Application:
#' Add the `scale_color_biolizard()` or `scale_fill_biolizard()` function to your ggplot chain to apply the respective color or fill palette.
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
#'  testplot +
#'    scale_color_biolizard(type='discrete',scheme='qualitative') +
#'    lizard_style()
#'
#' testplot <- ggplot(data = mtcars, aes(x = hp, y = mpg, color = mpg)) +
#'   geom_point() +
#'     labs(
#'       title = "Miles per Gallon vs. gears",
#'       x = "Horsepower",
#'       y = "Miles per Gallon",
#'       color = "Miles per Gallon",
#'       fill = "Miles per Gallon"
#'     )
#'  testplot +
#'    scale_color_biolizard(type='continuous',scheme='l_viridis') +
#'    lizard_style()
#' }
#'
#' @param type Character, either 'discrete' or 'continuous'.
#' @param scheme Character, color scheme to use: 'qualitative', 'paired', 'hues', 'l_viridis', 'sequential' or 'divergent'
#' @param reverse Boolean, if TRUE, reverse the order of the colors in the palette.
#' @param ... Additional arguments passed on to the underlying ggplot2 scale functions. For more details on these arguments, refer to the standard ggplot2 scales documentation. For discrete type, refer to the documentation of [ggplot2::discrete_scale()]. For continuous type, refer to the documentation of [ggplot2::scale_fill_gradientn()]. Two useful examples for continuous maps are trans='reverse' or limits=c(-1,1).
#' @importFrom ggplot2 scale_color_gradientn discrete_scale scale_color_hue
#' @importFrom colorspace sequential_hcl diverging_hcl
#' @importFrom grDevices rgb
#' @seealso [biolizard_pal_paired()] [biolizard_pal_hue()] [biolizard_pal_qualitative()] [biolizard_pal_sequential()] [biolizard_pal_divergent()] [biolizard_pal_l_viridis()]
#' @rdname biolizard_scales
#' @export
scale_color_biolizard <- function(type = "discrete",
                                  scheme = ifelse(type == "discrete", "qualitative", "l_viridis"),
                                  reverse = FALSE, ...) {
  # convert l_viridis rgb colors from viscm to hex
  l_viridis_hex <- apply(l_viridis_rgb, 1, function(x) grDevices::rgb(x[1], x[2], x[3], maxColorValue = 1))

  if(type == "discrete") {
    switch(scheme,
           qualitative = discrete_scale("colour", palette = function(n) biolizard_pal_qualitative(n, reverse), ...),
           paired = discrete_scale("colour", palette = function(n) biolizard_pal_paired(n, reverse), ...),
           hues = scale_color_hue(l = 55, c = 71, h.start = 135, direction = ifelse(reverse, -1, 1), ...),
           l_viridis = discrete_scale("colour", palette = function(n) biolizard_pal_l_viridis(n, reverse), ...),
           sequential = discrete_scale("colour", palette = function(n) biolizard_pal_sequential(n, reverse), ...),
           divergent = discrete_scale("colour", palette = function(n) biolizard_pal_divergent(n, reverse), ...),
           stop("Requested scheme not available for discrete color palette.")
    )
  } else if(type == "continuous") {
    switch(paste(scheme, reverse, sep="_"),
           l_viridis_FALSE = scale_color_gradientn(colors = rev(l_viridis_hex), ...),
           l_viridis_TRUE = scale_color_gradientn(colors = l_viridis_hex, ...),
           sequential_FALSE = scale_color_gradientn(colors = sequential_hcl(256, h = 250, c = c(90, 100, 70), l = c(75, 15), power = 1), ...),
           sequential_TRUE = scale_color_gradientn(colors = rev(sequential_hcl(256, h = 250, c = c(90, 100, 70), l = c(75, 15), power = 1)), ...),
           # divergent_FALSE = scale_color_gradientn(colors = diverging_hcl(256, h = c(291, 170), c = 80, l = c(35, 95), power = 1), ...),
           divergent_FALSE = scale_color_gradientn(colors = diverging_hcl(256,  h = c(250, 115), c = c(80, 100), l = c(35, 90), power = 1), ...),
           # divergent_TRUE = scale_color_gradientn(colors = rev(diverging_hcl(256, h = c(291, 170), c = 80, l = c(35, 95), power = 1)), ...),
           divergent_TRUE = scale_color_gradientn(colors = rev(diverging_hcl(256,  h = c(250, 115), c = c(80, 100), l = c(35, 90), power = 1)), ...),
           stop("Requested scheme not available for continuous color palette.")
    )
  } else {
    stop("Invalid type provided. Acceptable values are 'discrete' or 'continuous'.")
  }
}

#' @rdname biolizard_scales
#' @export
scale_colour_biolizard <- scale_color_biolizard

#' @importFrom ggplot2 scale_fill_gradientn discrete_scale scale_fill_hue
#' @importFrom colorspace sequential_hcl diverging_hcl
#' @importFrom grDevices rgb
#'
#' @rdname biolizard_scales
#' @export
scale_fill_biolizard <- function(type = "discrete", scheme = ifelse(type == "discrete", "qualitative", "l_viridis"), reverse = FALSE, ...) {
  # convert l_viridis rgb colors from viscm to hex
  l_viridis_hex <- apply(l_viridis_rgb, 1, function(x) grDevices::rgb(x[1], x[2], x[3], maxColorValue = 1))

  if(type == "discrete") {
    switch(scheme,
           qualitative = discrete_scale("fill", palette = function(n) biolizard_pal_qualitative(n, reverse), ...),
           paired = discrete_scale("fill", palette = function(n) biolizard_pal_paired(n, reverse), ...),
           hues = scale_fill_hue(l = 55, c = 71, h.start = 135, direction = ifelse(reverse, -1, 1), ...),
           l_viridis = discrete_scale("fill", palette = function(n) biolizard_pal_l_viridis(n, reverse), ...),
           sequential = discrete_scale("fill", palette = function(n) biolizard_pal_sequential(n, reverse), ...),
           divergent = discrete_scale("fill", palette = function(n) biolizard_pal_divergent(n, reverse), ...)
    )
  } else if(type == "continuous") {
    switch(paste(scheme, reverse, sep="_"),
           l_viridis_FALSE = scale_fill_gradientn(colors = rev(l_viridis_hex), ...),
           l_viridis_TRUE = scale_fill_gradientn(colors = l_viridis_hex, ...),
           sequential_FALSE = scale_fill_gradientn(colors = sequential_hcl(256, h = 250, c = c(90, 100, 70), l = c(75, 15), power = 1), ...),
           sequential_TRUE = scale_fill_gradientn(colors = rev(sequential_hcl(256, h = 250, c = c(90, 100, 70), l = c(75, 15), power = 1)), ...),
           # divergent_FALSE = scale_fill_gradientn(colors = diverging_hcl(256, h = c(291, 170), c = 80, l = c(35, 95), power = 1), ...),
           divergent_FALSE = scale_fill_gradientn(colors = diverging_hcl(256,  h = c(250, 115), c = c(80, 100), l = c(35, 90), power = 1), ...),
           # divergent_TRUE = scale_fill_gradientn(colors = rev(diverging_hcl(256, h = c(291, 170), c = 80, l = c(35, 95), power = 1)), ...)
           divergent_TRUE = scale_fill_gradientn(colors = rev(diverging_hcl(256,  h = c(250, 115), c = c(80, 100), l = c(35, 90), power = 1)), ...)
    )
  } else {
    stop("Invalid type provided. Acceptable values are 'discrete' or 'continuous'.")
  }
}
