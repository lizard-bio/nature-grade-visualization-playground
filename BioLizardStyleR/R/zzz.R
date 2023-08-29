#' @importFrom showtext showtext_auto
#' @importFrom sysfonts font_add
#'
#' @param libname The name of the library.
#' @param pkgname The name of the package.
#' @noRd
.onLoad <- function(libname, pkgname) {
  # Get the path to the included NunitoSans font
  nunito_font_path <- system.file("fonts/NunitoSans_10pt-Regular.ttf", package = pkgname)

  # Check if the file exists
  if (file.exists(nunito_font_path)) {
    # Add the NunitoSans font to showtext
    sysfonts::font_add("Nunito Sans", nunito_font_path)
  } else {
    # Warning message if font file is not found
    warning("Nunito Sans font could not be found. Text rendering may be affected.")
  }
  # Initialize showtext for ggplot2
  showtext::showtext_auto()
}
