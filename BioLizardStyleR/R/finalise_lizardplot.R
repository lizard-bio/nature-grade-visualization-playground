#Some of this code is adapted from the BBC ggplot2 theme available under GPL-2 License.


#' Save a ggplot2 Plot to File
#'
#' This function saves a given ggplot2 plot to a specified filepath using
#' the ggplot2 package for PNGs and the Cairo package for other formats.
#'
#' @param plot_grid The ggplot2 plot to be saved.
#' @param width Width of the output image in pixels.
#' @param height Height of the output image in pixels.
#' @param save_filepath Path where the plot should be saved.
#' @param device The output format (e.g., "png", "pdf", "svg", "ps").
save_plot <- function (plot_grid, width, height, save_filepath, device) {

  if (device == "png") {
    ggplot2::ggsave(filename = save_filepath, plot = plot_grid,
                    width = width/72, height = height/72, bg = "white", device = "png")
  } else {
    # Set the appropriate Cairo device based on the specified format
    switch(device,
           'pdf' = { Cairo::CairoPDF(file = save_filepath, width = width/72, height = height/72) },
           'svg' = { Cairo::CairoSVG(file = save_filepath, width = width/72, height = height/72) },
           'ps' = { Cairo::CairoPS(file = save_filepath, width = width/72, height = height/72) },
           { stop(paste("Unsupported device:", device)) }
    )

    grid::grid.draw(plot_grid)
    dev.off()
  }
}

#' Left Align Text in ggplot
#'
#' Aligns specified text elements of a ggplot to the left.
#' @param ggplot_name A ggplot object.
#' @param pieces A character vector of ggplot text elements (e.g., "title", "subtitle", "caption").
#' @return A grob object with left-aligned text.
left_align <- function(ggplot_name, pieces){
  grob <- ggplot2::ggplotGrob(ggplot_name)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

#' Retrieve Path to Image in the Package
#'
#' Returns the system file path to the Biolizard logo
#' @return Full path to the image file.
get_image_path <- function() {
  system.file("logo", "BiolizardLogo.png", package="BioLizardStyleR")
}

#' Compute Font Size Based on Text Length
#'
#' Dynamically determines the appropriate font size for text based on its length.
#' The function uses a linear scaling method to determine the font size, where longer
#' text lengths result in smaller font sizes and shorter text lengths yield larger font sizes.
#'
#' @param text_length Integer indicating the length of the text.
#'
#' @return Numeric font size value scaled according to the text length.


compute_font_size <- function(text_length) {
  max_length <- 250
  min_length <- 1
  max_fontsize <- 16
  min_fontsize <- 1.5

  # Linearly scale font size
  if (text_length <= min_length) {
    return(max_fontsize)
  } else if (text_length >= max_length) {
    return(min_fontsize)
  } else {
    ratio <- (text_length - min_length) / (max_length - min_length)
    fontsize_diff <- max_fontsize - min_fontsize
    scaled_fontsize <- max_fontsize - (ratio * fontsize_diff)
    return(scaled_fontsize)
  }
}

#' Create Footer with Dynamic Font Size, Logo, and Custom Font
#'
#' Constructs a footer for a ggplot using specified source text, a logo image,
#' and an optional font. The font size of the source text is determined dynamically
#' based on its length using the \code{\link{compute_font_size}} function.
#'
#' @param source Text to display as the source in the footer.
#' @param logo_image_path Path to the logo image. Defaults to the "BiolizardLogo.png" within the package.
#'
#' @return A grob object representing the footer with the source text, logo, and the specified font.

create_footer <- function (source, logo_image_path=get_image_path()) {
  # Dynamically compute font size
  fontsize <- compute_font_size(nchar(source))

  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
                           grid::textGrob(source,
                                          x = 0.004, hjust = 0, gp = grid::gpar(fontsize=fontsize, fontfamily="Nunito Sans 10pt Medium")),
                           grid::rasterGrob(png::readPNG(logo_image_path), x=0.935))
  return(footer)
}


#' Finalize and Save Plot in BioLizard Style
#'
#' Appends a Biolizard footer to a ggplot and exports the resultant graph.
#' It utilizes the `save_plot` function for saving the plot.
#'
#' @details When specifying both `save_filepath` and `output_name`, note that the `save_filepath`
#' takes precedence. If `save_filepath` is set to its default and `output_name` is specified,
#' then the plot will be saved with the `output_name` in the current working directory.
#'
#' @param ggplot_name A ggplot object.
#' @param source Text to display as the source in the footer.
#' @param save_filepath Path where the plot should be saved. Default is the current working directory.
#' @param output_name Optional name for the output plot file.
#' @param width_pixels Width of the output plot in pixels.
#' @param height_pixels Height of the output plot in pixels.
#' @param logo_image_path Path to the logo image. Defaults to the Biolizard logo within the package.
#' @param device The output format (e.g., "png", "pdf", "svg", "ps").
#' @return Invisibly returns the styled plot.
#' @export
finalise_lizardplot <- function(ggplot_name,
                                source = "",
                                save_filepath=NULL,
                                output_name="TempLizardPlot",
                                width_pixels=640,
                                height_pixels=450,
                                logo_image_path=get_image_path(),
                                device='png') {

  footer <- create_footer(source, logo_image_path)

  plot_left_aligned <- left_align(ggplot_name, c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.1))

  # Determine save path
  if (is.null(save_filepath)) {
    save_filepath <- gsub("\\\\", "/", getwd())
  }

  #check of suffix already present in output_name
  suffixes <- c(".png", ".pdf", ".svg", ".ps")
  name_suffix <- strsplit(output_name, "\\.")[[1]]
  name_suffix <- name_suffix[length(name_suffix)]
  if(length(grep(paste(suffixes, collapse = "|"), output_name, ignore.case = TRUE)) > 0 & tolower(name_suffix) == device) {
    save_filepath <- file.path(save_filepath, output_name)
  } else {
    save_filepath <- file.path(save_filepath, paste(output_name, device, sep = "."))
  }


  save_plot(plot_grid, width_pixels, height_pixels, save_filepath, device=device)
  invisible(plot_grid)
}
