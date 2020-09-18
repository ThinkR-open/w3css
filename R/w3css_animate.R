#' W3.CSS Animations
#'
#' Implementation of W3.CSS Animations, as described in
#' [https://www.w3schools.com/w3css/w3css_animate.asp](https://www.w3schools.com/w3css/w3css_animate.asp)
#'
#' @return A W3 CSS class.
#' @export
#' @rdname animation
#'
#' @examples
#' w3_animate_top()
w3_animate_top <- function(){
  w3_prefix("animate-top")
}

#' @export
#' @rdname animation
w3_animate_bottom <- function(){
  w3_prefix("animate-bottom")
}

#' @export
#' @rdname animation
w3_animate_left <- function(){
  w3_prefix("animate-left")
}

#' @export
#' @rdname animation
w3_animate_right <- function(){
  w3_prefix("animate-right")
}

#' @export
#' @rdname animation
w3_animate_opacity <- function(){
  w3_prefix("animate-opacity")
}

#' @export
#' @rdname animation
w3_animate_zoom <- function(){
  w3_prefix("animate-zoom")
}

#' @export
#' @rdname animation
w3_animate_fading <- function(){
  w3_prefix("animate-fading")
}

#' @export
#' @rdname animation
w3_spin <- function(){
  w3_prefix("spin")
}
