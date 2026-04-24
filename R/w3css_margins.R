#' W3.CSS Margins
#'
#' Implementation of W3.CSS Margins, as described in
#' [https://www.w3schools.com/w3css/w3css_margins.asp](https://www.w3schools.com/w3css/w3css_margins.asp).
#'
#' @param side one of `"all"` (default), `"top"`, `"right"`, `"bottom"`,
#'   `"left"`. `"all"` returns the plain `w3-margin` class.
#'
#' @return the matching CSS class name.
#' @export
#'
#' @examples
#' w3_margin()
#' w3_margin("top")
w3_margin <- function(side = c("all", "top", "right", "bottom", "left")) {
  side <- match.arg(side)
  if (side == "all") "w3-margin" else sprintf("w3-margin-%s", side)
}
