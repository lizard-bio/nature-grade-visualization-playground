# Adapted from the BBC ggplot2 theme available under GPL-2 License


#' Apply the lizard Style Theme to a ggplot2 Plot
#'
#' This function applies a predefined 'Lizard' style to a ggplot2 plot. It sets specific font types,
#' sizes and other graphical elements to ensure the plot conforms to the common BioLizard style.
#' If not yet installed, this function will install the 'Lato' font using the `gdtools` package.
#'
#' @return A `ggplot2::theme` object that can be added to a ggplot2 plot.
#' @export
#'
#' @importFrom ggplot2 theme element_text element_blank element_rect
#' @importFrom gdtools install_gfont_script installed_gfonts
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
#' p + lizard_style()
lizard_style <- function() {
  tryCatch({
    if(!"Lato" %in% gdtools::installed_gfonts()){
      message("The Lato font is not yet installed. Installing it now...")
      gdtools::install_gfont_script("Lato")
      # check if installation worked
      if(!"Lato" %in% gdtools::installed_gfonts()){
        stop("gdtools failed to install Lato. Try installing the Lato font manually from the ttf files in https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall and run `install_biolizard_fonts()`")
      }
    }
  }, error = function(err) {
    stop(paste("gdtools error: ", err, "\n\nTry installing the Lato font manually from the ttf files in https://github.com/lizard-bio/nature-grade-visualization-playground/tree/main/FontsToInstall and run `install_biolizard_fonts()`"))
  }
  )
  ggplot2::theme(
    #Text format:
    #This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family="Lato",
                                       size=16,
                                       color="#222222",
                                       face="bold"),
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family="Lato Medium",
                                          size=12,
                                          margin=ggplot2::margin(9,0,9,0)),
    plot.caption = ggplot2::element_blank(),
    #This leaves the caption text element empty, because it should be set in the finalise plot function

    #Legend format
    #This sets the position and alignment of the legend, removes background for it and sets the requirements for any text within the legend.
    legend.position = "right",
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_text(family="Lato Medium",
                                         size=11,
                                         color="#222222"),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family="Lato Medium",
                                        size=10,
                                        hjust = 0),
    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks.
    axis.title = ggplot2::element_text(family="Lato Medium",
                                       size=14,
                                       color="#222222"),
    axis.text = ggplot2::element_text(family="Lato Medium",
                                      size=12,
                                      color="#555555"),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10),size=12), #small margin fix
    axis.text.y = ggplot2::element_text(margin=ggplot2::margin(l = 10, r = 5), size=12),
    axis.title.y = ggplot2::element_text(family="Lato Medium",
                                         size=14,
                                         color="#222222"),
    axis.title.x = ggplot2::element_text(family="Lato Medium",
                                         size=14,
                                         color="#222222",
                                         margin=ggplot2::margin(b = 5)),
    axis.ticks = ggplot2::element_line(color="#555555"),
    axis.line = ggplot2::element_line(color="#808080"),

    #Grid lines
    #This removes all minor and major gridlines
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_blank(),
    panel.grid.major.x = ggplot2::element_blank(),
    #Adjusted to exclude grid lines by default; reason is that one should always think about if grid lines really add something to the plot.

    #Blank background
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_blank(),

    #Strip background (This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour)
    strip.background = ggplot2::element_rect(fill="white"),
    strip.text = ggplot2::element_text(size  = 14,  hjust = 0)
  )
}
