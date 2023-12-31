% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/finalise_lizardplot.R
\name{compute_font_size}
\alias{compute_font_size}
\title{Compute Font Size Based on Text Length}
\usage{
compute_font_size(text_length)
}
\arguments{
\item{text_length}{Integer indicating the length of the text.}
}
\value{
Numeric font size value scaled according to the text length.
}
\description{
Dynamically determines the appropriate font size for text based on its length.
The function uses a linear scaling method to determine the font size, where longer
text lengths result in smaller font sizes and shorter text lengths yield larger font sizes.
}
