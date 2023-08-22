#' Import BioLizard Fonts into R
#'
#' This function imports BioLizard fonts into R using 'AvenirLTStd-Roman.ttf' as the default font.
#' Users with a different Avenir font installed can adjust the pattern. A simple starting option
#' might be 'Avenir' if the exact .ttf filename is unknown. The function leverages the 'extrafont'
#' package and provides feedback on fonts that match the specified pattern.
#'
#' @param pattern A character string specifying the font file pattern. Default is 'AvenirLTStd-Roman.ttf'.
#' @return Prints a success message if the desired font is loaded correctly. Additionally, warnings are issued if multiple fonts match the pattern or if no matching fonts are found.
#' @export
#' @importFrom extrafont font_import
#' @importFrom extrafont fonts
#' @examples
#' \dontrun{
#' install_biolizard_fonts()
#' extrafont::fonts()  # to check the installed fonts
#' }
install_biolizard_fonts <- function(pattern='AvenirLTStd-Roman.ttf') {
    #This clears the extrafont database
    if ("package:extrafontdb" %in% search()) {
      suppressWarnings(detach(package:extrafontdb, unload=TRUE))
    }
    install.packages("extrafontdb")
    library(extrafont)
    library(extrafontdb)

    font_import(pattern=pattern)
    # Check if any font matches the pattern
    matching_fonts <- fonts()
    if (length(matching_fonts) > 1) {
      matched_fonts <- basename(extrafont::fonttable()[,3])
      warning("Multiple fonts match the pattern. Here they are: ", paste(matched_fonts, collapse=", "))
      warning("Please specify the exact font using the 'pattern' argument. Then, re-run the function.")
    }
    if (length(matching_fonts) == 0) {
      warning("No matching fonts found. Ensure the 'Avenir' font is installed locally and verify your pattern input (looking for the .tff files")
    }
    extrafont::loadfonts(device='all', quiet = TRUE)
    if (length(matching_fonts) == 1) {
      print(paste('Success! The following font will be used:', fonts()))
            }
}
