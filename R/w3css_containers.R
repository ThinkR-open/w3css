#' W3.CSS Containers
#'
#' Implementation of W3.CSS Containers, as described in
#' [https://www.w3schools.com/w3css/w3css_containers.asp](https://www.w3schools.com/w3css/w3css_containers.asp)
#'
#' @param ... Content of the container
#' @param type HTML tag to use as a container. Default is `div`.
#'
#' @return A tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' # Simple container
#' w3_container("hey there")
#' # Container with a 'teal'-colored background
#' w3_container("hey there", class = w3_color("teal"))
w3_container <- function(..., type = "div"){
  tags[[type]](
    class = "w3-container",
    ...
  )
}
