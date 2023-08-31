#' Import BioLizard Fonts into R
#'
#' This function imports BioLizard fonts into R using 'NunitoSans' as the default font.
#' Users with a different NunitoSans font installed can adjust the pattern. The function leverages the 'extrafont'
#' package and provides feedback on fonts that match the specified pattern.
#'
#' @param pattern A character string specifying the font file pattern. Default is 'NunitoSans_10pt-Medium.ttf'.
#' @param clearDataBase A logical flag to clear the existing database of fonts in 'extrafont'. Useful if pre-existing fonts are causing issues. Default is FALSE.
#'
#' @return Prints a success message if the desired font is loaded correctly. Additionally, warnings are issued if multiple fonts match the pattern or if no matching fonts are found.
#'
#' @export
#' @importFrom extrafont font_import
#' @importFrom extrafont fonts
#'
#' @examples
#' \dontrun{
#' install_biolizard_fonts()
#' extrafont::fonts()  # to check the installed fonts
#' }
install_biolizard_fonts <- function(pattern = 'NunitoSans_10pt-Medium.ttf', clearDataBase = FALSE) {
  # Clear database logic here
  if (clearDataBase == TRUE) {
    if ("package:extrafontdb" %in% search()) {
      suppressWarnings(detach(package:extrafontdb, unload = TRUE))
    }
    install.packages("extrafontdb")
    library(extrafont)
    library(extrafontdb)
  }

  # Font import and checking logic here
  font_import(pattern = pattern)
    # Check if any font matches the pattern
    matching_fonts <- fonts()
    if (length(matching_fonts) > 1) {
      matched_fonts <- basename(extrafont::fonttable()[,3])
      warning("Multiple fonts match the pattern. Here they are: ", paste(matched_fonts, collapse=", "))
      warning("Please specify the exact font using the 'pattern' argument. Then, re-run the function with clearDataBase=TRUE.")
    }
    if (length(matching_fonts) == 0) {
      warning("No matching fonts found. Ensure the 'NunitoSans' font is installed locally and verify your pattern input (looking for the .tff files")
    }
    extrafont::loadfonts(device='all', quiet = TRUE)
    if (length(matching_fonts) == 1) {
      print(paste('Success! The following font will be used:', fonts()))
            }
}
