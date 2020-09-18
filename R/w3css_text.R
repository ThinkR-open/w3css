#' W3.CSS Text
#'
#' Implementation of W3.CSS Text, as described in
#' [https://www.w3schools.com/w3css/w3css_text.asp](https://www.w3schools.com/w3css/w3css_text.asp)
#'
#' @return A CSS Class
#' @export
#' @rdname text
#'
#' @examples
#' w3_left_align()
w3_left_align <- function(){
  w3_prefix("left-align")
}

#' @export
#' @rdname text
w3_right_align <- function(){
  w3_prefix("right-align")
}

#' @export
#' @rdname text
w3_center <- function(){
  w3_prefix("center")
}

#' @export
#' @rdname text
w3_wide <- function(){
  w3_prefix("wide")
}

#' @export
#' @rdname text
w3_opacity <- function(){
  w3_prefix("opacity")
}
