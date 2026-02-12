.onLoad <- function(libname, pkgname) {
  # Check if Red Hat Display is installed
  packageStartupMessage("Searching for Red Hat Display font...")
  systemfonts::reset_font_cache()
  fonts <- systemfonts::system_fonts()
  if("Red Hat Display" %in% fonts$family){
    packageStartupMessage("Red Hat Display found! You're all set to start using the BLZ style!")
  } else {
    # If it is not installed, then we install it
    packageStartupMessage("Loading Red Hat Display font...")
    errorMessage <- paste0("\nRed Hat Display font installation failed. Try installing the Red Hat Display font manually from the ttf files in ",
    "https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall.")
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

        # Check to ensure the font is installed, after we installed it. If not, error.
        Sys.sleep(1)
        systemfonts::reset_font_cache()
        fonts <- systemfonts::system_fonts()
        if("Red Hat Display" %in% fonts$family){
          packageStartupMessage("Red Hat Display loaded! You're all set to start using the BLZ style!")
        } else {
          stop(errorMessage)
        }

      }

    # For other OS, we use font_add_google() from sysfonts
    } else {
      tryCatch({
        sysfonts::font_add_google(name = "Red Hat Display")
        # ensure showtext is used to draw figures: this will enable the font in the plots
        showtext::showtext_auto()
      }, error = function(err) {
        stop(paste("sysfonts error: ", err, errorMessage))
      })
    }

  }
}
