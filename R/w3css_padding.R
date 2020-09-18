#' W3.CSS Padding
#'
#' Implementation of W3.CSS Padding, as described in
#' [https://www.w3schools.com/w3css/w3css_padding.asp](https://www.w3schools.com/w3css/w3css_padding.asp)
#'
#' @param value The value of the padding. Must be one of  "", 16, 24, 32, 48,
#' 64, "small", or "large".
#'
#' @return A CSS class
#' @export
#'
#' @examples
#' w3_padding(16)
w3_padding <- function(
  value = c(
    "",
    16,
    24,
    32,
    48,
    64,
    "small",
    "large"
  )
){
  value <- match.arg(value)
  if (value == ""){
    return(
      w3_prefix("padding")
    )
  }
  return(
    w3_prefix(
      sprintf(
        "padding-%s",
        value
      )
    )
  )
}
