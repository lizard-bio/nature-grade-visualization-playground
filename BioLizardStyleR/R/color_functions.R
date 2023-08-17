# ---- QUALITATIVE ----

#' Biolizard Qualitative Color Palette
#'
#' This palette is inspired by Martin Krzywinski's "12-COLOR PALETTE FOR COLORBLINESS"
#' and is infused with the signature house colors of Biolizard for the first three shades.
#' Tailored to be inclusive, it is friendly for those with the prevalent form of color blindness: Deuteranopia (Red-Green Color Blindness).
#'
#' @export
biolizard_qualitative_palette <- c("#01a086", "#1e2237", "#e9b940","#00C2F9", "#FF5AAF","#FF6E3A","#00FCCF",
                                             "#8400CD" ,"#E20134","#008DF9", "#FFB2FD","#A40122")

#' Internal qualitative Biolizard palette function
#' @noRd
#' @return A function to extract colors.

biolizard_pal_qualitative <- function() {
  colors <- biolizard_qualitative_palette
  max_n <- length(biolizard_qualitative_palette)
  f <- function(n) {
    if (n > max_n) {
      stop("The requested number of colors exceeds the available colors in the palette. Maximum colors: 12.")
    }
    return(colors[1:n])  # Return the selected colors
  }
  return(f)
}

#' Qualitative Biolizard Color Scale
#'
#' Use this function to incorporate the [biolizard_qualitative_palette] as a color scale into a ggplot object.
#'
#' @seealso [biolizard_qualitative_palette] for the detailed palette description and colors.
#' @importFrom ggplot2 discrete_scale
#' @export
scale_colour_qualitative_biolizard <- function(...) {
  discrete_scale("colour", "BioLizard", biolizard_pal_qualitative(), ...)
}

#' Qualitative Biolizard Fill Scale
#'
#' Use this function to incorporate the [biolizard_qualitative_palette] as a fill scale into a ggplot object.
#'
#' @seealso [biolizard_qualitative_palette] for the detailed palette description and colors.
#' @importFrom ggplot2 discrete_scale
#' @export
scale_fill_qualitative_biolizard <- function(...) {
  discrete_scale("fill", "BioLizard", biolizard_pal_qualitative(), ...)
}

#' @rdname scale_colour_qualitative_biolizard
#' @export
scale_color_qualitative_biolizard <- scale_colour_qualitative_biolizard

# ---- SEQUENTIAL ----

# ---- Discrete ----

#' Sequential Biolizard Palette for discrete values
#' @noRd
#' @return A function to extract colors.

biolizard_pal_sequential <- function() {
  f <- function(n) {
    return(sequential_hcl(n, h = 170, c = c(40, 75, 0), l = c(35, 90), power = 1))  # Return the selected colors
  }
  return(f)
}

#' Sequential Discrete Biolizard Fill Scale
#'
#' Use this function with ggplot where fill corresponds to discrete categories, applying the sequential Biolizard palette.
#'
#' @details The sequential palette represents the underlying values using a consistent sequence of increasing luminance.
#' The hue is derived from the Biolizard green. The palette utilizes gradients within the HCL-spectrum for perceptual uniformity.
#' The chroma follows a triangular progression to help differentiate the middle range values from the extreme values.
#'
#' @importFrom ggplot2 discrete_scale
#' @importFrom colorspace sequential_hcl
#' @export
scale_fill_sequential_discrete_biolizard <- function(...){
  discrete_scale("fill", "BioLizard", biolizard_pal_sequential(), ...)
}

#' Sequential Discrete Biolizard Color Scale
#'
#' Use this function with ggplot where color corresponds to discrete categories, applying the sequential Biolizard palette.
#'
#' @details The sequential palette represents the underlying values using a consistent sequence of increasing luminance.
#' The hue is derived from the Biolizard green. The palette utilizes gradients within the HCL-spectrum for perceptual uniformity.
#' The chroma follows a triangular progression to help differentiate the middle range values from the extreme values.
#'
#' @importFrom ggplot2 discrete_scale
#' @importFrom colorspace sequential_hcl
#' @export
scale_colour_sequential_discrete_biolizard <- function(...){
  discrete_scale("colour", "BioLizard", biolizard_pal_sequential(), ...)
}


#' @rdname scale_colour_sequential_discrete_biolizard
#' @importFrom ggplot2 discrete_scale
#' @importFrom colorspace sequential_hcl
#' @export
scale_color_sequential_discrete_biolizard <- scale_colour_sequential_discrete_biolizard

# ---- Continuous ----

#' Sequential Continuous Biolizard Fill Scale
#'
#' Use this function with ggplot when color corresponds to a continuous range, applying the sequential Biolizard palette.
#'
#' @details The sequential palette represents the underlying values using a consistent sequence of increasing luminance.
#' The hue is derived from the Biolizard green. The palette utilizes gradients within the HCL-spectrum for perceptual uniformity.
#' The chroma follows a triangular progression to help differentiate the middle range values from the extreme values.
#'
#' @importFrom ggplot2 scale_fill_gradientn
#' @importFrom colorspace sequential_hcl
#' @export
scale_fill_sequential_continuous_biolizard <- function(...) {
  scale_fill_gradientn(colors = sequential_hcl(256, h = 170, c = c(40, 75, 0), l = c(35, 90), power = 1), ...)
}

#' Sequential Continuous Biolizard Color Scale
#'
#' Use this function with ggplot when fill corresponds to a continuous range, applying the sequential Biolizard palette.
#'
#' @importFrom ggplot2 scale_color_gradientn
#' @importFrom colorspace sequential_hcl
#' @export
scale_color_sequential_continuous_biolizard <- function(...) {
  scale_color_gradientn(colors = sequential_hcl(256, h = 170, c = c(40, 75, 0), l = c(35, 90), power = 1), ...)
}

#' @rdname scale_color_sequential_continuous_biolizard
#' @importFrom ggplot2 scale_color_gradientn
#' @importFrom colorspace sequential_hcl
#' @export
scale_colour_sequential_continuous_biolizard <- scale_color_sequential_continuous_biolizard

# ---- DIVERGENT ----

# ---- Discrete ----

#' Divergent Biolizard Palette for discrete values
#' @noRd
#' @return A function to extract colors.

biolizard_pal_divergent <- function() {
  f <- function(n) {
    return(diverging_hcl(n, h = c(291, 170), c = 80, l = c(35, 95), power = 1))  # Return the selected colors
  }
  return(f)
}

#' Divergent Discrete Biolizard Fill Scale
#'
#' Use this function with ggplot when fill corresponds to discrete categories with a natural midpoint, applying the divergent Biolizard palette.
#'
#' @details  This divergent palette codes underlying numeric values by a triangular luminance sequence with different hues in the left and in the right “arms” of the palette.
#' (a) a single hue is used for each arm of the palette,
#' (b) chroma and luminance trajectory are balanced between the two arms,
#' (c) the neutral central value has zero chroma.
#' The palette is crafted using hue 291 and hue 170, which is the distinctive biolizard green. .
#' This unique hue pairing produces a palette that remains accessible for all major forms of color blindness.
#'
#' @importFrom ggplot2 discrete_scale
#' @importFrom colorspace diverging_hcl
#' @export
scale_fill_divergent_discrete_biolizard <- function(...){
  discrete_scale("fill", "BioLizard", biolizard_pal_divergent(), ...)
}

#' Divergent Discrete Biolizard Color Scale
#'
#' Use this function with ggplot when color corresponds to discrete categories with a natural midpoint, applying the divergent Biolizard palette.
#'
#' @details This divergent palette codes underlying numeric values by a triangular luminance sequence with different hues in the left and in the right “arms” of the palette.
#' (a) a single hue is used for each arm of the palette,
#' (b) chroma and luminance trajectory are balanced between the two arms,
#' (c) the neutral central value has zero chroma.
#' The palette is crafted using hue 291 and hue 170, which is the distinctive biolizard green. .
#' This unique hue pairing produces a palette that remains accessible for all major forms of color blindness.
#'
#' @importFrom ggplot2 discrete_scale
#' @importFrom colorspace diverging_hcl
#' @export
scale_colour_divergent_discrete_biolizard <- function(...){
  discrete_scale("colour", "BioLizard", biolizard_pal_divergent(), ...)
}

#' @rdname scale_colour_divergent_discrete_biolizard
#' @importFrom ggplot2 discrete_scale
#' @importFrom colorspace diverging_hcl
#' @export
scale_color_divergent_discrete_biolizard <- scale_colour_divergent_discrete_biolizard

# ---- Continuous ----

#' Divergent Continuous Biolizard Fill Scale
#'
#' Use this function with ggplot when fill corresponds to a continuous range with a natural midpoint, applying the divergent Biolizard palette.
#'
#' @details This divergent palette codes underlying numeric values by a triangular luminance sequence with different hues in the left and in the right “arms” of the palette.
#' (a) a single hue is used for each arm of the palette,
#' (b) chroma and luminance trajectory are balanced between the two arms,
#' (c) the neutral central value has zero chroma.
#' The palette is crafted using hue 291 and hue 170, which is the distinctive biolizard green. .
#' This unique hue pairing produces a palette that remains accessible for all major forms of color blindness.
#'
#' @importFrom ggplot2 scale_fill_gradientn
#' @importFrom colorspace diverging_hcl
#' @export
scale_fill_divergent_continuous_biolizard <- function(...) {
  scale_fill_gradientn(colors = diverging_hcl(256, h = c(291, 170), c = 80, l = c(35, 95), power = 1), ...)
}

#' Divergent Continuous Biolizard Color Scale
#'
#' Use this function with ggplot when color corresponds to a continuous range with a natural midpoint, applying the divergent Biolizard palette.
#'
#' @details This divergent palette codes underlying numeric values by a triangular luminance sequence with different hues in the left and in the right “arms” of the palette.
#' (a) a single hue is used for each arm of the palette,
#' (b) chroma and luminance trajectory are balanced between the two arms,
#' (c) the neutral central value has zero chroma.
#' The palette is crafted using hue 291 and hue 170, which is the distinctive biolizard green. .
#' This unique hue pairing produces a palette that remains accessible for all major forms of color blindness.
#'
#' @importFrom ggplot2 scale_color_gradientn
#' @importFrom colorspace diverging_hcl
#' @export
scale_color_divergent_continuous_biolizard <- function(...) {
  scale_color_gradientn(colors = diverging_hcl(256, h = c(291, 170), c = 80, l = c(35, 95), power = 1), ...)
}

#' @rdname scale_color_divergent_continuous_biolizard
#' @importFrom ggplot2 scale_color_gradientn
#' @importFrom colorspace diverging_hcl
#' @export
scale_colour_divergent_continuous_biolizard <- scale_color_divergent_continuous_biolizard
