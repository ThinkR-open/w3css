#' @importFrom attempt stop_if_not
color <- function(color, type){
  color <- tolower(color)
  color <- gsub(" +", "-", color)
  stop_if_not(
    color,
    ~ .x %in% w3_colors,
    "The color you entered is not defined in the W3 palette.\nSee https://www.w3schools.com/w3css/w3css_colors.asp for a full list"
  )
  if (type == "color"){
    w3_prefix(color)
  } else if (type == "text") {
    w3_prefix(sprintf("text-%s", color))
  } else if (type == "hover") {
    w3_prefix(sprintf("hover-text-%s", color))
  }
}

#' W3.CSS Colors
#'
#' Implementation of W3.CSS colors, as described in
#' [www.w3schools.com/w3css/w3css_colors.asp](https://www.w3schools.com/w3css/w3css_colors.asp).
#'
#' @param color One of W3 css color
#'
#' @return A css class
#' @export
#' @rdname w3css_colors
#'
#' @examples
#' w3_color("red")
#' w3_color("pink")
#' w3_color("blue")
w3_color <- function(color){
  color(color, type = "color")
}

#' @export
#' @rdname w3css_colors
w3_text_color <- function(color){
  color(color, type = "text")
}

#' @export
#' @rdname w3css_colors
w3_hover_color <- function(color){
  color(color, type = "hover")
}
