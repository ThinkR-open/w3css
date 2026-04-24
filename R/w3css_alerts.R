#' W3.CSS Alerts
#'
#' Implementation of W3.CSS Alerts, as described in
#' [https://www.w3schools.com/w3css/w3css_alerts.asp](https://www.w3schools.com/w3css/w3css_alerts.asp)
#'
#' @param ... alert content.
#' @param level one of `"red"`, `"yellow"`, `"green"`, `"blue"` — controls
#'   the background color class. Defaults to `"red"`.
#'
#' @return an htmltools tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' w3_alert("Danger!")
#' w3_alert("Heads up!", level = "yellow")
w3_alert <- function(..., level = c("red", "yellow", "green", "blue")) {
  level <- match.arg(level)
  tags$div(
    class = paste("w3-panel", w3_color(level)),
    tags$p(...)
  )
}
