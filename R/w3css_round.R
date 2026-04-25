#' W3.CSS Rounded corners
#'
#' Implementation of W3.CSS Round, as described in
#' [https://www.w3schools.com/w3css/w3css_round.asp](https://www.w3schools.com/w3css/w3css_round.asp).
#'
#' @param size corner size. One of `"default"`, `"small"`, `"medium"`,
#'   `"large"`, `"xlarge"`, `"xxlarge"`.
#'
#' @return the matching CSS class name.
#' @export
#'
#' @examples
#' w3_round()
#' w3_round("small")
#' w3_round("xxlarge")
w3_round <- function(size = c("default", "small", "medium", "large", "xlarge", "xxlarge")) {
  size <- match.arg(size)
  if (size == "default") "w3-round" else sprintf("w3-round-%s", size)
}
