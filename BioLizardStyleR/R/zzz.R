.onLoad <- function(libname, pkgname) {
  # Check if Lato is installed
  packageStartupMessage("Searching for Lato font...")
  systemfonts::reset_font_cache()
  fonts <- systemfonts::system_fonts()
  if("Lato" %in% fonts$family){
    packageStartupMessage("Lato found! You're all set to start using the BLZ style!")
  } else {
    # If it is not installed, then we install it
    packageStartupMessage("Loading Lato font...")
    errorMessage <- paste0("\nTry installing the Lato font manually from the ttf files in ",
    "https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall ")
    # "and run `install_biolizard_fonts()`")

    # If MacOS is used, the .ttf files from inst/fonts are copied to ~/Library/Fonts
    if (Sys.info()["sysname"] == "Darwin"){
      font_dir <- file.path(system.file("fonts", package = "BioLizardStyleR"))
      font_files <- list.files(font_dir, pattern = "*.ttf", full.names = TRUE)
      if (all(file.exists(font_files))) {
        dest_dir <- "~/Library/Fonts"
        if (!dir.exists(dest_dir)) {
          dir.create(dest_dir, recursive = TRUE, showWarnings = TRUE)
        }
        tryCatch({
          file.copy(font_files, dest_dir, overwrite = TRUE)
        }, error = function(err) {
          stop(errorMessage)
        })

      }

    # For other OS, we use font_add_google() from sysfonts
    } else {
      tryCatch({
        sysfonts::font_add_google(name = "Lato")
      }, error = function(err) {
        stop(paste("sysfonts error: ", err, errorMessage))
      })
    }

    # Check to ensure the font is installed, after we installed it. If not, error.
    Sys.sleep(1)
    systemfonts::reset_font_cache()
    fonts <- systemfonts::system_fonts()
    if("Lato" %in% fonts$family){
      packageStartupMessage("Lato loaded! You're all set to start using the BLZ style!")
    } else {
      stop(errorMessage)
    }
  }
}
