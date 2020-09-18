#' W3.CSS Modal
#'
#' Implementation of W3.CSS Modal, as described in
#' [https://www.w3schools.com/w3css/w3css_modal.asp](https://www.w3schools.com/w3css/w3css_modal.asp)
#'
#' @inheritParams w3_radioButton
#' @inheritParams shiny::showModal
#' @param title,body,footer Content to add in the modal
#' @param color W3 CSS Color
#' @param display Display style of the modal (either 'none' or 'block')
#'
#' @importFrom htmltools htmlTemplate
#' @importFrom shiny getDefaultReactiveDomain
#'
#' @return a modal UI, or used for side effects.
#' @export
#' @rdname modals
#' @examples
#' w3_modal("one modal")
w3_modal <- function(
  inputId,
  title = "",
  body = "",
  footer = "",
  color = "",
  display = "none"
){
  htmlTemplate(
    system.file("htmltemplates/modal.html", package = "w3css"),
    id = inputId,
    title = title,
    body = body,
    footer = footer,
    color = color,
    display = display
  )
}

#' @rdname modals
w3_show_modal <- function(inputId, session = shiny::getDefaultReactiveDomain()){
  session$sendCustomMessage("show_modal", message)
}

#' @rdname modals
w3_hide_modal <- function(inputId, session = shiny::getDefaultReactiveDomain()){
  session$sendCustomMessage("hide_modal", message)
}
