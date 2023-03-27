# TODO : checkbox

#' W3.CSS Input
#'
#' Implementation of W3.CSS Input, as described in
#' [https://www.w3schools.com/w3css/w3css_input.asp](https://www.w3schools.com/w3css/w3css_input.asp)
#'
#' @param ul_class,li_class CSS class for the internal elements.
#' @param choiceNames List of names and values, respectively, that are displayed to the user in the app and correspond to the each choice (for this reason, choiceNames and choiceValues must have the same length). If either of these arguments is provided, then the other must be provided and choices must not be provided. The advantage of using both of these over a named list for choices is that choiceNames allows any type of UI object to be passed through (tag objects, icons, HTML code, ...), instead of just simple text. See Examples.
#'
#' @return Input UI elements
#'
#' @export
#' @rdname inputs
#'
#' @importFrom htmltools tagList tags
#' @inheritParams shiny::radioButtons
#' @inheritParams shiny::selectInput
#' @inheritParams shiny::updateSelectInput
#' @inheritParams shiny::textInput
#' @inheritParams shiny::passwordInput
#' @inheritParams shiny::dateInput
#' @inheritParams shiny::numericInput
#' @inheritParams shiny::updateNumericInput
#' @inheritParams shiny::numericInput
#' @inheritParams shiny::checkboxInput
#' @inheritParams shiny::checkboxGroupInput
#'
#' @examples
#'
#' w3_actionButton(
#'   "w3_actionButton",
#'   "Show Modal"
#' )
w3_radioButton <- function(
  inputId,
  label,
  choices,
  choiceNames = NULL
    ) {

  if (!is.null(choiceNames)) {
    names(choices) <- choiceNames
  } else if (is.null(names(choices))) {
      names(choices) <- choices
  }

  them <- mapply(function(x, y) {
    checked <- NULL
    if (x == choices[1]) {
      checked <- "true"
    }
    tags$p(
      tags$input(
        class = "w3-radio",
        type = "radio",
        name = inputId,
        `data-value` = x,
        checked = checked
      ),
      tags$label(
        y
      )
    )
  }, x = choices, y = names(choices), SIMPLIFY = FALSE)

  tagList(
    tags$form(
      class = "w3-radio-parent",
      id = inputId,
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
  choices,
  selected = NULL
    ) {
  if (is.null(selected)) {
    selected <- choices[1]
  }
  if (is.null(names(choices))) {
    names(choices) <- choices
  }

  tags$div(
    class = "w3-select-parent",
    tags$label(label),
    tags$select(
      id = inputId,
      class = "w3-select",
      name = inputId,
      mapply(function(x, y) {
        tags$option(
          value = x,
          selected = {
            if (x == selected) {
              "selected"
            } else {
              NULL
            }
          },
          y
        )
      }, x = choices, y = names(choices), SIMPLIFY = FALSE)
    )
  )
}

#' @export
#' @rdname inputs
w3_updateSelectInput <- function(
  inputId,
  label = NULL,
  choices = NULL,
  session = shiny::getDefaultReactiveDomain()
    ) {
  message <- dropNulls(
    list(
      label = label,
      choices = choices
    )
  )
  session$sendInputMessage(inputId, message)
}

#' @importFrom htmltools tagList
w3_text <- function(
  inputId,
  label,
  placeholder = "",
  type
    ) {
  tagList(
    tagList(
      tags$label(
        label
      ),
      tags$input(
        id = inputId,
        class = "w3-input w3_textInput w3-border ",
        type = type,
        placeholder = placeholder
      )
    )
  )
}

#' @export
#' @rdname inputs
w3_textInput <- function(
  inputId,
  label,
  placeholder = ""
    ) {
  w3_text(inputId, label, placeholder, type = "text")
}

#' @export
#' @rdname inputs
w3_passwordInput <- function(
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
  value = Sys.Date(),
  min = "",
  max = ""
    ) {
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
    ) {
  if (is.null(names(choices))) {
    names(choices) <- choices
  }

  lis <- mapply(function(x, y) {
    tags$li(
      class = li_class,
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
      class = paste("w3-ul w3-uleditable", ul_class),
      name = inputId,
      lis
    )
  )
}

#' @export
#' @rdname inputs
w3_numericInput <- function(
  inputId,
  label,
  value = NULL,
  min,
  max,
  step = NULL,
  placeholder = ""
    ) {
  tagList(
    tags$label(
      label
    ),
    tags$input(
      id = inputId,
      class = "w3-input w3_numericInput w3-border",
      type = "number",
      value = value,
      min = min,
      max = max,
      step = step
    )
  )
}

# FROM shiny codebase

dropNulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE = logical(1))]
}

#' @export
#' @rdname inputs
w3_updateNumericInput <- function(
  inputId,
  label = NULL,
  placeholder = NULL,
  value = NULL,
  min = NULL,
  max = NULL,
  step = NULL,
  session = shiny::getDefaultReactiveDomain()
    ) {
  message <- dropNulls(
    list(
      label = label,
      placeholder = placeholder,
      value = value,
      min = min,
      max = max,
      step = step
    )
  )
  session$sendInputMessage(inputId, message)
}

#' @export
#' @rdname inputs
w3_checkbox <- function(
  inputId,
  label,
  value = FALSE
    ) {
  if (!value) {
    value <- NULL
  }
  tags$div(
    tags$input(
      id = inputId,
      class = "w3-check w3_checkbox",
      type = "checkbox",
      checked = value,
      name = label
    ),
    tags$label(
      `for` = label,
      label
    )
  )
}

#' @export
#' @rdname inputs
w3_checkboxGroupInput <- function(
  inputId,
  label = NULL,
  choices,
  selected = NULL,
  choiceNames = NULL
    ) {
  if (is.null(choiceNames)) {
    choiceNames <- choices
  }
  if (is.null(selected)) {
    selected <- NA
  }

  tagList(
    tags$label(label),
    tags$div(
      id = inputId,
      class = "w3_checkboxGroup-parent",
      mapply(function(choice, choiceName, selected) {
        tags$div(
          tags$input(
            class = "w3-check w3_checkboxGroupInput",
            type = "checkbox",
            checked = {
              if (choice %in% selected) {
                "checked"
              } else {
                NULL
              }
            },
            name = inputId,
            value = choiceName
          ),
          tags$label(
            choiceName
          )
        )
      }, choices, choiceNames, selected, SIMPLIFY = FALSE)
    )
  )
}
