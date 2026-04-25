#' W3.CSS Notes
#'
#' Implementation of W3.CSS Notes, as described in
#' [https://www.w3schools.com/w3css/w3css_notes.asp](https://www.w3schools.com/w3css/w3css_notes.asp)
#'
#' @param ... note content.
#' @param level one of `"yellow"`, `"red"`, `"blue"`, `"green"` — border
#'   color. Defaults to `"yellow"`.
#'
#' @return an htmltools tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' w3_note("Important: read this first.")
w3_note <- function(..., level = c("yellow", "red", "blue", "green")) {
  level <- match.arg(level)
  tags$div(
    class = paste(
      "w3-panel", "w3-leftbar",
      sprintf("w3-border-%s", level),
      sprintf("w3-pale-%s", level)
    ),
    tags$p(...)
  )
}
