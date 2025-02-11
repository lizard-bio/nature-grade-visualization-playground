.onLoad <- function(libname, pkgname) {
  packageStartupMessage("Searching for Lato font...")
  fonts <- systemfonts::system_fonts()
  if("Lato" %in% fonts$family){
    packageStartupMessage("Lato found! You're all set to start using the BLZ style!")
  } else {
    packageStartupMessage("Loading Lato font...")
    tryCatch({
      sysfonts::font_add_google(name = "Lato")
    }, error = function(err) {
      stop(paste("sysfonts error: ", err, "\n\nTry installing the Lato font manually from the ttf files in https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall and run `install_biolizard_fonts()`"))
    })
    # packageStartupMessage("Lato loaded! You're all set to start using the BLZ style!")
    # check if installation worked  --> does not work for some reason: systemfonts::system_fonts() not yet updated
    systemfonts::reset_font_cache()
    fonts <- systemfonts::system_fonts()
    if("Lato" %in% fonts$family){
      packageStartupMessage("Lato loaded! You're all set to start using the BLZ style!")
    } else {
      stop("Loading Lato unsuccesful: Try installing the Lato font manually from the ttf files in https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall and run `install_biolizard_fonts()`")
    }
  }
}
