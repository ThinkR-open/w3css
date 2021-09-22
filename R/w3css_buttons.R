#' W3.CSS Buttons
#'
#' Implementation of W3.CSS Buttons, as described in
#' [https://www.w3schools.com/w3css/w3css_buttons.asp](https://www.w3schools.com/w3css/w3css_buttons.asp)
#'
#' @return a UI element
#' @export
#' @inheritParams shiny::actionButton
#' @param type Class to apply to the button
#'
#' @importFrom htmltools tagList tags
#'
#' @examples
#' w3_actionButton('ok', 'Go')
#'
w3_actionButton <- function(
  inputId,
  label,
  type = c("btn", "button", "bar", "block", "circle", "ripple"),
  # disabled= NULL, TODO => Check from getValue
  ...
){
  type <- match.arg(type)
  tagList(
    tags$button(
      id = inputId,
      class = sprintf("w3button w3-%s w3-border", type),
      value = 0,
      label,
      # disabled,
      ...
    )
  )
}

