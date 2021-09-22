# INTERNAL
#' @importFrom htmltools htmlDependency HTML
w3_dependency <- function() {
  htmlDependency(
    "w3CSS","4.13",
    src = system.file(package = "w3css"),
    stylesheet = c(
      "w3.css"
    ),
    script = "srcjs/handlers.js",
    meta = list(
      charset="UTF-8"
    ),
    head = HTML(
      '<meta name="viewport" content="width=device-width, initial-scale=1">'
    )
  )
}

#' @importFrom htmltools htmlDependency
jquery_dependency <- function() {
  htmlDependency(
    "jquery","3.5.1",
    src = system.file(package = "w3css"),
    script = "jquery-3.5.1.min.js"
  )
}

#' @importFrom htmltools htmlDependency
input_binding <- function() {
  htmlDependency(
    "w3js","0.1.0",
    src = system.file("srcjs", package = "w3css"),
    script = list.files(
      pattern = "input-",
      system.file("srcjs", package = "w3css")
    )
  )
}


#' W3 CSS Page
#'
#' @param ... Content of the page
#'
#' @return A shiny UI using W3.CSS
#' @export
#'
#' @importFrom htmltools tagList
#'
#' @examples
#' w3_page("hey there")
w3_page <- function(...){
  tagList(
    w3_dependency(),
    jquery_dependency(),
    input_binding(),
    tagList(
      ...
    )
  )
}

