# R/zzz.R

# 1. Create a hidden environment to store the success/failure status
# This allows .onLoad to pass information to .onAttach without printing.
.blz_env <- new.env()

.onLoad <- function(libname, pkgname) {

  # Default status
  assign("font_ready", FALSE, envir = .blz_env)
  assign("install_method", "none", envir = .blz_env)

  # Define the error message URL for later use
  manual_url <- "https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall"
  assign("manual_url", manual_url, envir = .blz_env)

  # --- MACOS STRATEGY: Copy .ttf files to System Fonts ---
  if (Sys.info()["sysname"] == "Darwin") {

    font_dir <- system.file("fonts", package = pkgname)
    font_files <- list.files(font_dir, pattern = "\\.ttf$", full.names = TRUE)
    dest_dir <- path.expand("~/Library/Fonts")

    # Only proceed if we actually found font files in the package
    if (length(font_files) > 0) {
      tryCatch({
        if (!dir.exists(dest_dir)) dir.create(dest_dir, recursive = TRUE)

        # Copy files (overwrite to ensure latest version)
        file.copy(from = font_files, to = dest_dir, overwrite = TRUE)

        # Reset cache so R sees the new system fonts
        Sys.sleep(1)
        systemfonts::reset_font_cache()

        # Verify installation
        if ("Red Hat Display" %in% systemfonts::system_fonts()$family) {
          assign("font_ready", TRUE, envir = .blz_env)
          assign("install_method", "system_copy", envir = .blz_env)
        }

      }, error = function(e) {
        # If copying fails (permissions, etc.), we record the failure but don't crash
        assign("font_ready", FALSE, envir = .blz_env)
      })
    }

    # --- WINDOWS/LINUX STRATEGY: Use sysfonts (Google Fonts) ---
  } else {
    tryCatch({
      # Download/Register via Google Fonts
      sysfonts::font_add_google(name = "Red Hat Display", family = "Red Hat Display")

      # Automatically turn on showtext for plotting
      showtext::showtext_auto()

      assign("font_ready", TRUE, envir = .blz_env)
      assign("install_method", "google_api", envir = .blz_env)

    }, error = function(e) {
      assign("font_ready", FALSE, envir = .blz_env)
    })
  }
}

.onAttach <- function(libname, pkgname) {
  # Retrieve status variables
  is_ready <- get("font_ready", envir = .blz_env)
  method   <- get("install_method", envir = .blz_env)
  url      <- get("manual_url", envir = .blz_env)

  if (is_ready) {
    if (method == "system_copy") {
      packageStartupMessage("Red Hat Display found and synced to system fonts. Ready for BLZ style!")
    } else {
      packageStartupMessage("Red Hat Display loaded via Google Fonts. Ready for BLZ style!")
    }
  } else {
    # The Error Message
    packageStartupMessage("----------------------------------------------------------")
    packageStartupMessage("WARNING: Red Hat Display font installation failed.")
    packageStartupMessage("The package relies on this font for correct visualization.")
    packageStartupMessage("\nPlease install the font manually from:")
    packageStartupMessage(url)
    packageStartupMessage("----------------------------------------------------------")
  }
}
