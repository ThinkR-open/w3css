# TODO : checkbox

#' W3.CSS Input
#'
#' Implementation of W3.CSS Input, as described in
#' [https://www.w3schools.com/w3css/w3css_input.asp](https://www.w3schools.com/w3css/w3css_input.asp)
#'
#' @inheritParams shiny::radioButtons
#' @inheritParams shiny::textInput
#' @inheritParams shiny::dateInput
#' @param ul_class,li_class CSS class for the internal elements.
#'
#' @return Input UI elements
#'
#' @export
#' @rdname inputs
#'
#' @importFrom htmltools tagList tags
#'
#' @examples
#'
#' w3_actionButton(
#' "w3_actionButton",
#' "Show Modal"
#' )
#'

w3_radioButton <- function(
  inputId,
  label,
  choices
) {

  if(is.null(names(choices))){
    names(choices) <- choices
  }

  them <- mapply(function(x, y){
    checked <- NULL
    if (x == choices[1]){
      checked <- "true"
    }
    tags$p(
      tags$input(
        class="w3-radio",
        type="radio",
        name = inputId,
        `data-value`= x,
        checked = checked
      ),
      tags$label(
        y
      )
    )
  }, x = choices, y = names(choices), SIMPLIFY = FALSE)

  tagList(
    tags$form(
      class="w3-radio-parent",
      id = inputId,
      class="w3-container w3-card-4",
      tags$label(
        label
      ),
      tagList(them)
    )
  )
}

#' @export
#' @rdname inputs

w3_selectInput <- function(
  inputId,
  label,
  choices # TODO preselect
){
  if(is.null(names(choices))){
    names(choices) <- choices
  }
  tags$div(
    class = "w3-select-parent",
    tags$label(label),
    tags$select(
      id = inputId,
      class = "w3-select",
      name   = inputId,
      mapply(function(x, y){
        tags$option(
          value = x,
          y
        )
      }, x = choices, y = names(choices), SIMPLIFY = FALSE)
    )
  )

}

#' @importFrom htmltools tagList
w3_text <- function(
  inputId,
  label,
  placeholder = "",
  type
){

  tagList(
    tagList(
      tags$label(
        label
      ),
      tags$input(
        id = inputId,
        class="w3-input w3_textInput w3-border ",
        type=type,
        placeholder = placeholder
      )
    )
  )
}

#' @export
#' @rdname inputs
w3_textInput<- function(
  inputId,
  label,
  placeholder = ""
) {
  w3_text(inputId, label, placeholder, type = "text")
}

#' @export
#' @rdname inputs
w3_passwordInput<- function(
  inputId,
  label,
  placeholder = ""
) {
  w3_text(inputId, label, placeholder, type = "password")
}

# THE FOLLOWING ARE NOT 'OFFICIAL' W3CSS inputs

#' @export
#' @rdname inputs
w3_dateInput <- function(
  inputId,
  label,
  value= Sys.Date(),
  min = "",
  max = ""
){
  tagList(
    tags$label(
      `for` = inputId,
      label
    ),
    tags$input(
      class = "w3-dateInput",
      id = inputId,
      type = "date",
      name = inputId,
      value = value,
      min = min,
      max = max
    )
  )
}

#' @export
#' @rdname inputs
w3_editableListInput <- function(
  inputId,
  label,
  choices,
  ul_class = "",
  li_class = ""
){

  if(is.null(names(choices))){
    names(choices) <- choices
  }

  lis <- mapply(function(x, y){

    tags$li (
      class=li_class,
      name = y,
      tags$span(
        paste0(y, ":")
      ),
      tags$span(
        class = "w3-licontent",
        `contentEditable` = TRUE,
        x
      )
    )

  }, x = choices, y = names(choices), SIMPLIFY = FALSE)

  tagList(
    tags$label(
      `for` = inputId,
      label
    ),
    tags$ul(
      id = inputId,
      class= paste("w3-ul w3-uleditable",ul_class),
      name = inputId,
      lis
    )
  )

}
