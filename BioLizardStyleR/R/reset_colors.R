#' Reset default ggplot2 colors
#'
#' This function resets the default colors for elements of ggplot2 plots, that
#' are changed to BLZ green ("#01a086") when using the `lizard_style()` function.
#' Note that colors are automatically reset when restarting the R session.
#'
#' @return NULL
#' @export
#'
#' @importFrom ggplot2 update_geom_defaults
#' @examples
#' library(ggplot2)
#' p <- ggplot(mtcars, aes(mpg, disp)) + geom_point()
#' p + lizard_style()
#' p  # default colors have changed to BLZ green, even without applying the theme
#' reset_colors()
#' p  # ggplot default colors
reset_colors <- function(){
  update_geom_defaults("point",   list(colour = "black", fill = NA))

  ggplot2::update_geom_defaults("line",   list(colour = "black"))
  ggplot2::update_geom_defaults("hline",   list(colour = "black"))
  ggplot2::update_geom_defaults("vline",   list(colour = "black"))
  ggplot2::update_geom_defaults("abline",   list(colour = "black"))
  ggplot2::update_geom_defaults("density", list(colour = "black"))
  ggplot2::update_geom_defaults("smooth", list(colour = "#3366FF"))

  ggplot2::update_geom_defaults("boxplot", list(colour = "grey20", fill = "white"))
  ggplot2::update_geom_defaults("violin", list(colour = "grey20", fill = "white"))

  ggplot2::update_geom_defaults("rect",   list(fill = "grey35"))
  ggplot2::update_geom_defaults("polygon", list(fill = "grey20"))
}
