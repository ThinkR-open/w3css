#' W3.CSS Progress Bars
#'
#' Implementation of W3.CSS Progress Bars, as described in
#' [https://www.w3schools.com/w3css/w3css_progressbar.asp](https://www.w3schools.com/w3css/w3css_progressbar.asp).
#'
#' The outer wrapper carries the WAI-ARIA `role="progressbar"` and the
#' `aria-valuenow / aria-valuemin / aria-valuemax` attributes so screen
#' readers announce the progress correctly.
#'
#' @param value numeric(1) in `[0, 100]`, current progress value.
#' @param color W3 color name applied to the inner bar (default `"green"`).
#' @param show_label logical, show the numeric value inside the bar.
#'
#' @return an htmltools tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' w3_progressbar(25)
#' w3_progressbar(80, color = "blue", show_label = TRUE)
w3_progressbar <- function(value, color = "green", show_label = FALSE) {
  stopifnot(is.numeric(value), length(value) == 1L, !is.na(value))
  value <- max(0, min(100, value))
  inner <- tags$div(
    class = paste("w3-container", w3_color(color)),
    style = sprintf("width:%s%%", value),
    if (show_label) sprintf("%s%%", value) else NULL
  )
  tags$div(
    class = "w3-light-grey",
    role = "progressbar",
    `aria-valuenow` = as.character(value),
    `aria-valuemin` = "0",
    `aria-valuemax` = "100",
    inner
  )
}
