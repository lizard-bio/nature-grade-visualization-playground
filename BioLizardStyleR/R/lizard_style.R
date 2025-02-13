# Adapted from the BBC ggplot2 theme available under GPL-2 License

#' set default colors of plot elements to BLZ green
#'
#' @importFrom ggplot2  update_geom_defaults
set_default_BLZgreen <- function(){
   ggplot2::update_geom_defaults("point", list(colour = "#01a086", fill = "#01a086"))

   ggplot2::update_geom_defaults("line", list(colour = "#01a086"))
   ggplot2::update_geom_defaults("hline", list(colour = "#01a086"))
   ggplot2::update_geom_defaults("vline", list(colour = "#01a086"))
   ggplot2::update_geom_defaults("abline", list(colour = "#01a086"))
   ggplot2::update_geom_defaults("density", list(colour = "#01a086"))
   ggplot2::update_geom_defaults("smooth", list(colour = "#1e2237"))

   ggplot2::update_geom_defaults("boxplot", list(fill = "#01a086", colour = "black"))
   ggplot2::update_geom_defaults("violin", list(fill = "#01a086", colour = "black"))

   ggplot2::update_geom_defaults("rect", list(fill = "#01a086"))
   ggplot2::update_geom_defaults("polygon", list(fill = "#01a086"))
}



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
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
#' p + lizard_style()
lizard_style <- function() {

  #change default colors for geoms
  set_default_BLZgreen()

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
    strip.background = ggplot2::element_rect(fill="white", linewidth = 0),
    strip.text = ggplot2::element_text(size  = 14,  hjust = 0.5)

  )

}


#' Apply the lizard layout to a plotly plot
#'
#' This function applies a predefined 'Lizard' style to a plotly plot. It sets specific font types,
#' sizes and other graphical elements to ensure the plot conforms to the common BioLizard style.
#' It does not yet work with ggplotly.
#'
#' @param fig A plotly figure created with standard plotly language.
#'
#' @return A plotly figure in the BioLizard style
#' @export
#'
#' @importFrom showtextdb google_fonts
#' @importFrom htmltools htmlDependency
#'
#' @examples
#' library(plotly)
#' plot_ly(
#'   mtcars,
#'   type = "scatter",
#'   mode = "markers",
#'   x = ~mpg,
#'   y = ~disp,
#'   color = ~gear,
#'   colors = biolizard_pal_l_viridis(4)) %>% lizard_layout()
lizard_layout <- function(fig, ...){
  #get the source url to the font file from google
  lato_file <- showtextdb::google_fonts("Lato")$regular_url

  #create custom CSS
  lato_css <- paste0(
    "<style type = 'text/css'>",
    "@font-face { ",
    "font-family: 'lato'; ", #however you want to refer to it
    "src: url('", lato_file, "'); ", #file from google
    "}",
    "</style>")

  #add the CSS as a dependency for the plotly object
  fig$dependencies <- c(
    fig$dependencies,
    list(
      htmltools::htmlDependency(
        name = "lato-font", #these  first 3 arguments don't really matter for this use case
        version = "0",
        src = "",
        head = lato_css #refer to the custom CSS created
      )
    )
  )

  # Adapt layout
  fig <- fig %>% plotly::layout(
    # Adapts font to Lato
    font = list(family = "lato"),

    # Changes title and legend font sizes and colors to BioLizard style
    title = list(font = list(size = 16, color = "#222222")),
    legend = list(font = list(size = 10),
                  title = list(font = list(color = "#222222", size = 11))),

    # # Changes tick text to BioLizard style and removes the grid.
    xaxis = list(tickfont = list(size = 12, color = "#555555"), showline = TRUE, showgrid = FALSE, zeroline = FALSE),
    yaxis = list(tickfont = list(size = 12, color = "#555555"), showline = TRUE, showgrid = FALSE, zeroline = FALSE),
    ...)
  return(fig)
}
