# Adapted from the BBC ggplot2 theme available under GPL-2 License


#' Apply the lizard Style Theme to a ggplot2 Plot
#'
#' This function applies a predefined 'Lizard' style to a ggplot2 plot. It sets specific font types,
#' sizes and other graphical elements to ensure the plot conforms to the common BioLizard style.
#' Before applying the style, it ensures that the required fonts are loaded using the `extrafont` package.
#'
#' @return A `ggplot2::theme` object that can be added to a ggplot2 plot.
#' @export
#'
#' @importFrom ggplot2 theme element_text element_blank element_rect
#' @importFrom extrafont loadfonts
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
#' p + lizard_style()
lizard_style <- function() {
  font <- extrafont::fonts()[1]
  ggplot2::theme(
    #Text format:
    #This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family=font,
                                       size=16,
                                       face="bold",
                                       color="#222222"),
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family=font,
                                          size=12,
                                          margin=ggplot2::margin(9,0,9,0)),
    plot.caption = ggplot2::element_blank(),
    #This leaves the caption text element empty, because it should be set in the finalise plot function

    #Legend format
    #This sets the position and alignment of the legend, removes background for it and sets the requirements for any text within the legend.
    legend.position = "right",
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_text(family=font,
                                         size=11,
                                         color="#222222"),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family=font,
                                        size=10),
    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks.
    axis.title = ggplot2::element_text(family=font,
                                       size=14,
                                       color="#222222"),
    axis.text = ggplot2::element_text(family=font,
                                      size=12,
                                      color="#555555"),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 7),size=12), #small margin fix
    axis.text.y = ggplot2::element_text(margin=ggplot2::margin(l = 5, r = 10), size=12),
    axis.title.y = ggplot2::element_text(family=font,
                                         size=14,
                                         color="#222222"),
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
