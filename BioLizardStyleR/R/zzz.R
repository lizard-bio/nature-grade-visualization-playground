.onLoad <- function(libname, pkgname) {
  packageStartupMessage("Searching for Lato font...")
  if(gdtools::font_family_exists("Lato")) {
    packageStartupMessage("Lato found! You're all set to start using the BLZ style!")
  } else {
    packageStartupMessage("The Lato font is not yet installed. Installing it now using gdtools (sudo rights required) ...")
    platform <- menu(c("debian/ubuntu", "macos", "other"), title="Which platform are you using?")
    if(platform == 3) {
      stop("Installation through gdtools only supported for debian/ubuntu or macos platforms. Please try installing the Lato font manually from the ttf files in https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall and run `install_biolizard_fonts()`")
    }
    platform <- switch(platform,
                       "1" = "debian",
                       "2" = "macos")
    tryCatch({
      gdtools::install_gfont_script("Lato", file = "install-lato.sh", platform = platform)
    }, error = function(err) {
      stop(paste("gdtools error: ", err, "\n\nTry installing the Lato font manually from the ttf files in https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall and run `install_biolizard_fonts()`"))
    })
    tryCatch({
      system(command = "sudo -kS ./install-lato.sh", input = rstudioapi::askForPassword("sudo password"))
    }, error = function(err) {
      #clean up
      unlink("install-lato.sh")
      stop(paste("installation error: ", err, "\n\nTry installing the Lato font manually from the ttf files in https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall and run `install_biolizard_fonts()`"))
    })
    #clean up
    unlink("install-lato.sh")
    BioLizardStyleR::install_biolizard_fonts(clearDataBase = TRUE)
    packageStartupMessage("\nLato installed! You're all set to start using the BLZ style!")

    # # check if installation worked  #will also raise error upon successful installation for some reason...
    # Sys.sleep(1)   # allow for some time to update sys_fonts()
    # if(!gdtools::font_family_exists("Lato")){
    #   stop("Failed to install Lato. Try installing the Lato font manually from the ttf files in https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall and run `install_biolizard_fonts()`")
    # }
  }
}
