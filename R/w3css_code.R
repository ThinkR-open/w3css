#' W3.CSS Code
#'
#' Implementation of W3.CSS Code, as described in
#' [https://www.w3schools.com/w3css/w3css_code.asp](https://www.w3schools.com/w3css/w3css_code.asp).
#' `w3_code()` renders a `<pre class="w3-code">` block, `w3_codespan()`
#' renders an inline `<code class="w3-codespan">` span.
#'
#' @param ... code content.
#'
#' @return an htmltools tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' w3_code("x <- 1")
w3_code <- function(...) {
  tags$pre(class = "w3-code", ...)
}

#' @rdname w3_code
#' @export
#' @examples
#' w3_codespan("foo")
w3_codespan <- function(...) {
  tags$code(class = "w3-codespan", ...)
}
