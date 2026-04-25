#' W3.CSS Alerts
#'
#' Implementation of W3.CSS Alerts, as described in
#' [https://www.w3schools.com/w3css/w3css_alerts.asp](https://www.w3schools.com/w3css/w3css_alerts.asp)
#'
#' @param ... alert content.
#' @param level any W3 color name accepted by [w3_color()] (e.g.
#'   `"red"`, `"yellow"`, `"teal"`, `"deep-orange"`). Controls the
#'   background color class. Defaults to `"red"`. Validation is delegated
#'   to [w3_color()] so the full W3 palette is accepted.
#'
#' @return an htmltools tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' w3_alert("Danger!")
#' w3_alert("Heads up!", level = "yellow")
#' w3_alert("Looks good!", level = "teal")
w3_alert <- function(..., level = "red") {
  tags$div(
    class = paste("w3-panel", w3_color(level)),
    tags$p(...)
  )
}
