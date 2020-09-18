border <- function(
  ...
){
  paste("w3", "border", ..., sep = "-")
}

#' W3.CSS Borders
#'
#' Implementation of W3.CSS borders, as described in
#' [www.w3schools.com/w3css/w3css_borders.asp](https://www.w3schools.com/w3css/w3css_borders.asp).
#'
#' @param color One of W3 css color
#'
#' @return A W3 CSS class.
#' @export
#' @rdname w3css_border
#'
#' @examples
#' w3_border()
#' w3_border_top()
w3_border <- function(){
  border()
}

#' @export
#' @rdname w3css_border
w3_border_top <- function(){
  border("top")
}

#' @export
#' @rdname w3css_border
w3_border_right <- function(){
  border("right")
}

#' @export
#' @rdname w3css_border
w3_border_bottom <- function(){
  border("bottom")
}

#' @export
#' @rdname w3css_border
w3_border_left <- function(){
  border("left")
}

#' @export
#' @rdname w3css_border
w3_border_0 <- function(){
  border("0")
}

#' @export
#' @rdname w3css_border
w3_border_color <- function(color){
  border(color)
}

#' @export
#' @rdname w3css_border
w3_hover_border_color <- function(color){
  paste("w3", "hover", "border", color, sep = "-")
}

#' @export
#' @rdname w3css_border
w3_bottombar <- function(){
  "w3-bottombar	"
}

#' @export
#' @rdname w3css_border
w3_leftbar <- function(color){
  "w3-leftbar"
}

#' @export
#' @rdname w3css_border
w3_rightbar <- function(color){
  "w3-rightbar"
}

#' @export
#' @rdname w3css_border
w3_topbar <- function(color){
  "w3-topbar"
}
