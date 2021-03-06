% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/w3css_lists.R
\name{w3_list}
\alias{w3_list}
\title{W3.CSS Lists}
\usage{
w3_list(..., ul_class = "")
}
\arguments{
\item{...}{a list tagList}

\item{ul_class}{Additional CSS class for the ul.}
}
\value{
a \code{tagList}
}
\description{
Implementation of W3.CSS Lists, as described in
\url{https://www.w3schools.com/w3css/w3css_lists.asp}
}
\examples{
w3_list(
  htmltools::tags$li("one")
)
}
