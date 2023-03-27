
<!-- README.md is generated from README.Rmd. Please edit that file -->

# w3css

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/thinkr-open/w3css/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/thinkr-open/w3css/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

\[WORK IN PROGRESS\] There are still a lot of elements/features to
implement.

An implementation of W3 CSS <https://www.w3schools.com/w3css/> for
‘shiny’.

## Installation

``` r
remotes::install_github("thinkr-open/w3css")
```

## About

You’re reading the doc about version : 0.0.0.9004

This README has been compiled on the

``` r
Sys.time()
#> [1] "2023-03-27 12:42:41 CEST"
```

Here are the test & coverage results :

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading w3css
#> ── R CMD check results ─────────────────────────────────── w3css 0.0.0.9004 ────
#> Duration: 11.6s
#> 
#> 0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

``` r
covr::package_coverage()
#> w3css Coverage: 0.00%
#> R/page.R: 0.00%
#> R/utils.R: 0.00%
#> R/w3css_animate.R: 0.00%
#> R/w3css_badges.R: 0.00%
#> R/w3css_borders.R: 0.00%
#> R/w3css_buttons.R: 0.00%
#> R/w3css_colors.R: 0.00%
#> R/w3css_containers.R: 0.00%
#> R/w3css_dropdowns.R: 0.00%
#> R/w3css_input.R: 0.00%
#> R/w3css_lists.R: 0.00%
#> R/w3css_modal.R: 0.00%
#> R/w3css_padding.R: 0.00%
#> R/w3css_panels.R: 0.00%
#> R/w3css_responsive.R: 0.00%
#> R/w3css_text.R: 0.00%
```

## Note about W3.CSS approach

W3.CSS philosophy is to allow a lot of flexibily in your UI design by
setting CSS class to your component. For example, to create a container
with a padding and centered, you’d do:

``` html
<div class="w3-container w3-center w3-padding-24">
<p> My content </p>
</div>
```

Which will be translated here with:

``` r
w3_container(
  class = w3_center(),
  class = w3_padding(24),
  htmltools::tags$p(
    "My content"
  )
)
```

## Example

``` r
library(w3css)
library(shiny)
ui <- function() {
  w3_page(
    w3_container(
      w3_panel(
        w3_actionButton(
          "w3_actionButton",
          "Show Modal"
        )
      ),
      w3_panel(
        w3_modal(
          "w3_modal",
          "Here is a modal",
          "Its body",
          "Its footer",
          "teal"
        )
      ),
      w3_panel(
        w3_numericInput(
          "w3_numericInput",
          "Enter number",
          value = 5,
          min = 1,
          max = 10,
          step = 2
        ),
        w3_checkbox(
          "w3_checkbox",
          "Click me"
        ),
        w3_checkboxGroupInput(
          "w3_checkboxGroupInput",
          "Checkbox group",
          choices = letters[1:4]
        )
      ),
      w3_panel(
        w3_radioButton(
          "w3_radioButton",
          label = "Hey there",
          choices = letters[1:3]
        )
      ),
      w3_panel(
        w3_selectInput(
          "w3_selectInput",
          label = "Hey there",
          choices = letters[1:3]
        )
      ),
      w3_panel(
        w3_textInput(
          "w3_textInput",
          "Text"
        )
      ),
      w3_panel(
        w3_passwordInput(
          "w3_passwordInput",
          "password"
        )
      ),
      w3_panel(
        w3_dateInput(
          "w3_dateInput",
          "Pick a date"
        )
      ),
      w3_panel(
        w3_editableListInput(
          "w3_editableListInput",
          "Editable list",
          choices = names(mtcars)
        )
      )
    )
  )
}

server <- function(
  input,
  output,
  session
    ) {
  observeEvent(input$w3_actionButton, {
    print(input$w3_actionButton)
    req(input$w3_actionButton > 0)
    w3_show_modal("w3_modal")
  })
  observeEvent(input$w3_numericInput, {
    print(input$w3_numericInput)
  })
  observeEvent(input$w3_checkbox, {
    print(input$w3_checkbox)
  })
  observeEvent(input$w3_checkboxGroupInput, {
    print(input$w3_checkboxGroupInput)
  })
  observeEvent(input$w3_radioButton, {
    print(input$w3_radioButton)
  })
  observeEvent(input$w3_selectInput, {
    print(input$w3_selectInput)
  })
  observeEvent(input$w3_textInput, {
    print(input$w3_textInput)
  })
  observeEvent(input$w3_passwordInput, {
    print(input$w3_passwordInput)
  })
  observeEvent(input$w3_dateInput, {
    print(input$w3_dateInput)
  })
  observeEvent(input$w3_editableListInput, {
    print(input$w3_editableListInput)
  })
}

shinyApp(ui, server)
```

``` r
pkgload::load_all()
library(shiny)
ui <- function(request) {
  w3_page(
    w3_actionButton(
      "w3_actionButton",
      "Update"
    ),
    w3_numericInput(
      "w3_numericInput",
      "Enter number",
      value = 5,
      min = 1,
      max = 10,
      step = 2
    ),
    w3_selectInput(
      "w3_selectInput",
      "Select",
      choices = letters
    )
  )
}

server <- function(
  input,
  output,
  session
    ) {
  observeEvent(
    input$w3_actionButton,
    {
      w3_updateNumericInput(
        "w3_numericInput",
        "Enter number",
        value = 15,
        min = 5,
        max = 55,
        step = 3
      )
      w3_updateSelectInput(
        "w3_selectInput",
        "Select",
        choices = LETTERS
      )
    },
    ignoreInit = TRUE
  )

  observe({
    print(input$ w3_selectInput)
  })
}

shinyApp(ui, server)
```
