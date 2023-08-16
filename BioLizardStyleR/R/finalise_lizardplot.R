
#' Save a ggplot2 Plot to File
#'
#' This function saves a given ggplot2 plot to a specified filepath.
#' @param plot_grid The ggplot2 plot to be saved.
#' @param width Width of the output image in pixels.
#' @param height Height of the output image in pixels.
#' @param save_filepath Path where the plot should be saved.
save_plot <- function (plot_grid, width, height, save_filepath) {
  grid::grid.draw(plot_grid)
  ggplot2::ggsave(filename = save_filepath,
                  plot=plot_grid, width=(width/72), height=(height/72), bg="white")
}

#' Left Align Text in ggplot
#'
#' Aligns specified text elements of a ggplot to the left.
#' @param plot_name A ggplot object.
#' @param pieces A character vector of ggplot text elements (e.g., "title", "subtitle", "caption").
#' @return A grob object with left-aligned text.
left_align <- function(plot_name, pieces){
  grob <- ggplot2::ggplotGrob(plot_name)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

#' Retrieve Path to Image in the Package
#'
#' Returns the system file path to the Biolizard logo
#' @return Full path to the image file.
get_image_path <- function() {
  system.file("logo", "BioLizardLogo.png", package="BioLizardStyleR")
}

#' Create Footer with Source, Logo, and Custom Font
#'
#' Constructs a footer for a ggplot with specified source text, a logo image,
#' and the option to specify a font.
#'
#' @param source Text to display as the source in the footer.
#' @param logo_image_path Path to the logo image. Default is the "BioLizardLogo.png" from the package.
#' @param font Font family for the source text. Default is "Avenir LT Std 55 Roman".
#'             Ensure this font is installed on the system for the expected appearance.
#' @return A grob object representing the footer with the source text, logo, and the specified font.
create_footer <- function (source, logo_image_path=get_image_path(), font="Avenir LT Std 55 Roman") {
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
                           grid::textGrob(source,
                                          x = 0.004, hjust = 0, gp = grid::gpar(fontsize=16, fontfamily=font)),
                           grid::rasterGrob(png::readPNG(logo_image_path), x=0.935))
  return(footer)
}

#' Finalize and Save Plot in BioLizard Style
#'
#' Applies BioLizard styling and saves the plot to file.
#'
#' @details When specifying both `save_filepath` and `output_name`, note that the `save_filepath`
#' takes precedence. If `save_filepath` is set to its default and `output_name` is specified,
#' then the plot will be saved with the `output_name` in the current working directory.
#'
#' @param plot_name A ggplot object.
#' @param source Text to display as the source in the footer.
#' @param save_filepath Path where the plot should be saved. Default is current working directory.
#' @param output_name Optional name for the output plot file.
#' @param width_pixels Width of the output plot in pixels.
#' @param height_pixels Height of the output plot in pixels.
#' @param logo_image_path Path to the logo image. Defaults to the Biolizard logo within the package.
#' @return Invisibly returns the styled plot.
#' @export
finalise_lizardplot <- function(plot_name,
                                source,
                                save_filepath=paste0(gsub("\\\\", "/", getwd()),"/TempLizardPlot.png"),
                                output_name=NULL,
                                width_pixels=640,
                                height_pixels=450,
                                logo_image_path=get_image_path()) {

  footer <- create_footer(source, logo_image_path)

  plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.1))

  default_filepath <- paste0(gsub("\\\\", "/", getwd()), "/TempLizardPlot.png")
  if (!is.null(output_name) && save_filepath == default_filepath) {
    save_filepath <- paste0(getwd(), "/", output_name,".png")
  }

  save_plot(plot_grid, width_pixels, height_pixels, save_filepath)
  invisible(plot_grid)
}
