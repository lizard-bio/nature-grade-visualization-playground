#' Import BioLizard Fonts into R
#'
#' This function imports BioLizard fonts into R using 'Lato' as the default font.
#' Users with a different Lato font installed can adjust the pattern. The function leverages the 'extrafont'
#' package and provides feedback on fonts that match the specified pattern.
#'
#' @param pattern A character string specifying the font file pattern. Default is 'Lato'.
#' @param clearDataBase A logical flag to clear the existing database of fonts in 'extrafont'. Useful if pre-existing fonts are causing issues. Default is FALSE.
#'
#' @return Prints a success message if the desired font is loaded correctly. Additionally, warnings are issued if multiple fonts match the pattern or if no matching fonts are found.
#'
#' @export
#' @importFrom extrafont font_import loadfonts
#' @importFrom extrafont fonts
#'
#' @examples
#' \dontrun{
#' install_biolizard_fonts()
#' extrafont::fonts()  # to check the installed fonts
#' }
install_biolizard_fonts <- function(pattern = 'Lato', clearDataBase = FALSE) {
  # Clear database logic here
  if (clearDataBase == TRUE) {
    db_path <- paste0(system.file(package = "extrafontdb"),"/fontmap/fonttable.csv")
    if(file.exists(db_path)) {
      unlink(db_path)
    }
  }
  # Font import and checking logic here
  tryCatch({
    font_import(pattern = pattern, prompt = FALSE)
  }, error = function(err) {
    stop("No matching fonts found. Ensure the font is installed locally and verify your pattern input (looking for the .tff files).")
  }
  )
  # Check if any font matches the pattern
  matching_fonts <- grep(pattern, fonts(), value = TRUE)
  if (length(matching_fonts) == 0) {
    stop("No matching fonts found. Ensure the font is installed locally and verify your pattern input (looking for the .tff files).")
  }
  if (length(matching_fonts) > 0) {
    loadfonts(device='all', quiet = TRUE)
    print(paste('Success! The following fonts were installed:', paste(matching_fonts, collapse = ", ")))
  }
}
