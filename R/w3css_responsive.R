#' W3.CSS Built-In Responsiveness
#'
#' Implementation of W3.CSS Built-In Responsiveness, as described in
#' [https://www.w3schools.com/w3css/w3css_responsive.asp](https://www.w3schools.com/w3css/w3css_responsive.asp)
#'
#' @param ... UI elements to include
#'
#' @return a UI element.
#' @export
#' @rdname responsive
#'
#' @importFrom htmltools tags
#'
#' @examples
#' w3_half("hey there")
w3_half <- function(...) {
  tags$div(
    class = "w3-half",
    ...
  )
}

#' @export
#' @rdname responsive
w3_third <- function(...) {
  tags$div(
    class = "w3-third",
    ...
  )
}

#' @export
#' @rdname responsive
w3_twothird <- function(...) {
  tags$div(
    class = "w3-twothird",
    ...
  )
}

#' @export
#' @rdname responsive
w3_quarter <- function(...) {
  tags$div(
    class = "w3-quarter",
    ...
  )
}

#' @export
#' @rdname responsive
w3_threequarter <- function(...) {
  tags$div(
    class = "w3-threequarter",
    ...
  )
}

#' @export
#' @rdname responsive
w3_rest <- function(...) {
  tags$div(
    class = "w3-rest",
    ...
  )
}

#' @export
#' @rdname responsive
w3_col <- function(...) {
  tags$div(
    class = "w3-col",
    ...
  )
}
