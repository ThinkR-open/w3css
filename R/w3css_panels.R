#' W3.CSS Panels
#'
#' Implementation of W3.CSS colors, as described in
#' [www.w3schools.com/w3css/w3css_panels.asp](https://www.w3schools.com/w3css/w3css_panels.asp).
#'
#' @param ... Content of the panel.
#' @param with_close Add a close button to the panel.
#'
#' @return A tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' # Simple container
#' w3_panel("hey there")
#' # Container with a 'teal'-colored background
#' w3_panel("hey there", class = w3_color("teal"))
w3_panel <- function(..., with_close = FALSE){
  if (with_close){
    tags$div(
      class = w3_prefix("panel"),
      ...
    )
  } else {
    tags$div(
      class = w3_prefix("panel"),
      tags$span(
        onclick="this.parentElement.style.display='none'",
        class= "w3-button w3-display-topright",
        "X"
      ),
      ...
    )
  }

}
