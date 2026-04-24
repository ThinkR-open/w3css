#' W3.CSS Icons
#'
#' Implementation of W3.CSS Icons, as described in
#' [https://www.w3schools.com/w3css/w3css_icons.asp](https://www.w3schools.com/w3css/w3css_icons.asp).
#' Renders an `<i class="fa fa-...">` element; you must include the
#' corresponding Font Awesome stylesheet in the page (see `shiny::icon()` for
#' a matching loader).
#'
#' @param name icon name (without the `fa-` prefix), e.g. `"home"`,
#'   `"cloud"`, `"search"`.
#' @param library icon CSS prefix. `"fa"` (Font Awesome) by default;
#'   `"w3"` uses the W3 icon set instead (`"w3-icon w3-..."`).
#' @param ... extra attributes passed to the `<i>` tag.
#'
#' @return an htmltools tag.
#' @export
#'
#' @importFrom htmltools tags
#'
#' @examples
#' w3_icon("home")
#' w3_icon("cloud", library = "fa")
w3_icon <- function(name, library = c("fa", "w3"), ...) {
  library <- match.arg(library)
  cls <- switch(
    library,
    fa = sprintf("fa fa-%s", name),
    w3 = sprintf("w3-icon w3-%s", name)
  )
  tags$i(class = cls, ...)
}
