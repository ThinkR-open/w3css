#' W3.CSS Dropdowns
#'
#' Implementation of W3.CSS Dropdowns, as described in
#' [https://www.w3schools.com/w3css/w3css_dropdowns.asp](https://www.w3schools.com/w3css/w3css_dropdowns.asp)
#'
#' @param button_text Text to display inside the button
#' @param content Content of the dropdown
#' @param button_class Additional class to add to the button
#' @param content_style Additional style to add to the content tag
#'
#' @return An HTML div tag
#' @export
#'
#' @examples
#' w3_dropdown(
#'   button_text = "Hover Over Me!",
#'   content = "and I'll show you something cool",
#' )
#'
w3_dropdown <- function(
  button_text = "Hover Over Me!",
  content = list(),
  button_class = NULL,
  content_style = NULL
    ) {
  tags$div(
    class = "w3-dropdown-hover",
    class = button_class,
    tags$button(
      class = "w3-button",
      button_text
    ),
    tags$div(
      class = "w3-dropdown-content w3-bar-block w3-border",
      style = content_style,
      content
    )
  )
}
