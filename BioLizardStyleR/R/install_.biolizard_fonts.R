#' Retrieve the Absolute Path to the Fonts Folder
#'
#' This function returns the absolute path to the 'fonts' folder within the 'BioLizardStyleR' package.
#'
#' @return A character string representing the absolute path to the fonts folder.
#'
#' @examples
#' get_path()
get_path <- function() {
  system.file("fonts", package = "BioLizardStyleR")
}

#' Import BioLizard Fonts into R
#'
#' This function imports the fonts from the 'BioLizardStyleR' package into R using the 'extrafont' package.
#'
#' @export
#' @importFrom extrafont font_import
#' @examples
#' install_biolizard_fonts()
#' extrafont::fonts()  # to check the installed fonts
install_biolizard_fonts <- function() {
  font_path <- get_path()
  extrafont::font_import(paths = font_path)
  extrafont::loadfonts(device='all', quiet = TRUE)
}
