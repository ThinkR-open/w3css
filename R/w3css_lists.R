#' W3.CSS Lists
#'
#' Implementation of W3.CSS Lists, as described in
#' [https://www.w3schools.com/w3css/w3css_lists.asp](https://www.w3schools.com/w3css/w3css_lists.asp)
#'
#' @param ... a list tagList
#' @param ul_class Additional CSS class for the ul.
#' @return a `tagList`
#' @export
#'
#' @importFrom htmltools tagList tags
#'
#' @examples
#' w3_list(
#'   htmltools::tags$li("one")
#' )
w3_list <- function(
  ...,
  ul_class = ""
    ) {
  tagList(
    tags$ul(
      class = paste("w3-ul", ul_class),
      ...
    )
  )
}
