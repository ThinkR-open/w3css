#' W3.CSS Tags
#'
#' Implementation of W3.CSS Tags, as described in
#' [https://www.w3schools.com/w3css/w3css_tags.asp](https://www.w3schools.com/w3css/w3css_tags.asp).
#' Renders a `<span class="w3-tag">` element.
#'
#' @param ... label content.
#' @param color optional W3 color name to apply via [w3_color()]
#'   (e.g. `"red"`, `"teal"`). `NULL` by default.
#' @param round optional corner rounding (one of `"small"`, `"medium"`,
#'   `"large"`, `"xlarge"`, `"xxlarge"`). `NULL` for square corners.
#'
#' @return an htmltools tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' w3_tag("new")
#' w3_tag("urgent", color = "red", round = "large")
w3_tag <- function(..., color = NULL, round = NULL) {
  classes <- "w3-tag"
  if (!is.null(color)) classes <- paste(classes, w3_color(color))
  if (!is.null(round)) classes <- paste(classes, w3_round(round))
  tags$span(class = classes, ...)
}
