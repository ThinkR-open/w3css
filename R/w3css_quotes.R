#' W3.CSS Quotes
#'
#' Implementation of W3.CSS Quotes, as described in
#' [https://www.w3schools.com/w3css/w3css_quotes.asp](https://www.w3schools.com/w3css/w3css_quotes.asp)
#'
#' @param ... quote content.
#' @param panel logical, wrap the blockquote in a styled panel. `TRUE` by default.
#'
#' @return an htmltools tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' w3_quote("Be yourself — everyone else is already taken.")
w3_quote <- function(..., panel = TRUE) {
  bq <- tags$blockquote(
    class = if (panel) "w3-panel w3-leftbar w3-light-grey" else NULL,
    ...
  )
  bq
}
