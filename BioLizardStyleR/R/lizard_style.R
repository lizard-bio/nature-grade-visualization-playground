# Adapted from the BBC ggplot2 theme available under GPL-2 License

# Internal functions and definitions
base_element_c <- "#000000"
base_fill_c <- "#faf4ed"
highlight_element_c <- "#0d47a1"
highlight_fill_c <- "#badeed"

base_text_c <- "#000000"



#' set default colors of plot elements to black
#'
#' @importFrom ggplot2  update_geom_defaults
set_default_BLZcolors <- function(){
   ggplot2::update_geom_defaults("point", list(colour = base_element_c, fill = base_element_c))

   ggplot2::update_geom_defaults("line", list(colour = base_element_c))
   ggplot2::update_geom_defaults("hline", list(colour = base_element_c))
   ggplot2::update_geom_defaults("vline", list(colour = base_element_c))
   ggplot2::update_geom_defaults("abline", list(colour = base_element_c))
   ggplot2::update_geom_defaults("density", list(colour = base_element_c))
   ggplot2::update_geom_defaults("smooth", list(colour = highlight_element_c, fill = highlight_fill_c))

   ggplot2::update_geom_defaults("boxplot", list(fill = base_fill_c, colour = base_element_c))
   ggplot2::update_geom_defaults("violin", list(fill = base_fill_c, colour = base_element_c))

   ggplot2::update_geom_defaults("rect", list(fill = base_fill_c, colour = NA))  # colour = NA to remove outline
   ggplot2::update_geom_defaults("polygon", list(fill = base_fill_c, colour = NA))
}



#' Apply the lizard Style Theme to a ggplot2 Plot
#'
#' This function applies a predefined 'Lizard' style to a ggplot2 plot. It sets specific font types,
#' sizes and other graphical elements to ensure the plot conforms to the common BioLizard style.
#' If not yet installed, this function will install the 'Red Hat Display' font using the `gdtools` package.
#'
#' @return A `ggplot2::theme` object that can be added to a ggplot2 plot.
#' @export
#'
#' @importFrom ggplot2 theme element_text element_blank element_rect theme_grey
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
#' p + lizard_style()
lizard_style <- function() {

  #change default colors for geoms
  set_default_BLZcolors()

  t <- ggplot2::theme(
    #Text format:
    #This sets the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family="Red Hat Display",
                                       size=16,
                                       color=base_text_c,
                                       face="bold",
                                       hjust = 0,
                                       vjust = 1),
    #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family="Red Hat Display",
                                          size=12,
                                          margin=ggplot2::margin(9,0,9,0)),
    plot.caption = ggplot2::element_blank(),
    #This leaves the caption text element empty, because it should be set in the finalise plot function

    #Legend format
    #This sets the position and alignment of the legend, removes background for it and sets the requirements for any text within the legend.
    legend.position = "right",
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_text(family="Red Hat Display",
                                         size=11,
                                         color=base_text_c),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family="Red Hat Display",
                                        size=10,
                                        hjust = 0),
    #Axis format
    #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks.
    axis.title = ggplot2::element_text(family="Red Hat Display",
                                       size=14,
                                       color=base_text_c),
    axis.text = ggplot2::element_text(family="Red Hat Display",
                                      size=12,
                                      color=base_text_c),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10),size=12), #small margin fix
    axis.text.y = ggplot2::element_text(margin=ggplot2::margin(l = 10, r = 5), size=12),
    axis.title.y = ggplot2::element_text(family="Red Hat Display",
                                         size=14,
                                         color=base_text_c,
                                         angle=90,
                                         vjust=1),
    axis.title.x = ggplot2::element_text(family="Red Hat Display",
                                         size=14,
                                         color=base_text_c,
                                         margin=ggplot2::margin(b = 5)),
    axis.ticks = ggplot2::element_line(color=base_element_c),
    axis.line = ggplot2::element_line(color=base_element_c),

    #Grid lines
    #This removes all minor and major gridlines
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_blank(),
    panel.grid.major.x = ggplot2::element_blank(),
    #Adjusted to exclude grid lines by default; reason is that one should always think about if grid lines really add something to the plot.

    #Blank background
    #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
    panel.background = ggplot2::element_blank(),

    #Strip background (This sets the panel background for facet-wrapped plots)
    strip.background = ggplot2::element_rect(fill=base_fill_c),
    strip.text = ggplot2::element_text(size  = 14,  hjust = 0.5)

  )

  # inherit all other settings from theme_grey()
  ggplot2::theme_grey() %+replace% t
}


#' Apply the lizard layout to a plotly plot
#'
#' This function applies a predefined 'Lizard' style to a plotly plot. It sets specific font types,
#' sizes and other graphical elements to ensure the plot conforms to the common BioLizard style.
#' It does not yet work with ggplotly.
#'
#' Adapted from: https://github.com/plotly/plotly.R/issues/2117
#'
#' @param fig A plotly figure created with standard plotly language.
#' @param ... Further arguments for the plotly::layout() function
#' @return A plotly figure in the BioLizard style
#' @export
#'
#' @examples
#' library(plotly)
#' # Works with plotly
#' plot_ly(
#'   mtcars,
#'   type = "scatter",
#'   mode = "markers",
#'   x = ~mpg,
#'   y = ~disp,
#'   color = ~gear,
#'   colors = biolizard_pal_l_viridis(4)) |> lizard_layout()
#'
#' # Works with ggplotly
#' p <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
#' ggplotly(p) |> lizard_layout()
lizard_layout <- function(fig, ...) {
  # Get the local font file path
  RHD_path <- system.file("fonts/RedHatDisplay-Regular.ttf", package = "BioLizardStyleR")

  # Check if the file exists
  if (!file.exists(RHD_path)) {
    stop("Error: Lato font not found in package. Ensure it's in inst/fonts/")
  }

  # Create CSS to load the font
  rhd_css <- paste0(
    "<style type='text/css'>",
    "@font-face { font-family: 'Red Hat Display'; src: url('", RHD_path, "'); }",
    "body, text { font-family: 'Red Hat Display', sans-serif; }",
    "</style>"
  )

  # Add the CSS as an HTML dependency
  fig$dependencies <- c(
    fig$dependencies,
    list(
      htmltools::htmlDependency(
        name = "RHD-font",
        version = "0",
        src = c(file = system.file("fonts", package = "BioLizardStyleR")),
        stylesheet = "RedHatDisplay-Regular.ttf",
        head = rhd_css
      )
    )
  )

  # Adapt layout
  fig <- fig |> plotly::layout(
    font = list(family = "Red Hat Display"),
    title = list(font = list(size = 16, color = base_text_c)),
    legend = list(font = list(size = 10),
                  title = list(font = list(color = base_text_c, size = 11))),
    xaxis = list(tickfont = list(size = 12, color = base_text_c), showline = TRUE, showgrid = FALSE, zeroline = FALSE),
    yaxis = list(tickfont = list(size = 12, color = base_text_c), showline = TRUE, showgrid = FALSE, zeroline = FALSE),
    paper_bgcolor = "white",
    plot_bgcolor = "white",
    ...
  )

  return(fig)
}

