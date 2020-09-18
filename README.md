
<!-- README.md is generated from README.Rmd. Please edit that file -->

w3css
=====

<!-- badges: start -->
<!-- badges: end -->

\[WORK IN PROGRESS\] There are still a lot of elements/features to
implement.

An implementation of W3 CSS
<a href="https://www.w3schools.com/w3css/" class="uri">https://www.w3schools.com/w3css/</a>
for ‘shiny’.

Installation
------------

    remotes::install_github("thinkr-open/w3css")

Note about W3.CSS approach
--------------------------

W3.CSS philosophy is to allow a lot of flexibily in your UI design by
setting CSS class to your component. For example, to create a container
with a padding and centered, you’d do:

    <div class="w3-container w3-center w3-padding-24">
      <p> My content </p>
    </div>

Which will be translated here with:

    w3_container(
      class = w3_center(),
      class = w3_padding(24), 
      htmltools::tags$p(
        "My content"
      )
    )

Example
-------

    library(w3css)
    library(shiny)
    ui <- function(){
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
          )
          ,
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
    ){
      observeEvent( input$w3_actionButton , {
        print(input$w3_actionButton)
        req(input$w3_actionButton > 0)
        w3_show_modal("w3_modal")
      })
      observeEvent( input$w3_radioButton , {
        print(input$w3_radioButton)
      })
      observeEvent( input$w3_selectInput , {
        print(input$w3_selectInput)
      })
      observeEvent( input$w3_textInput , {
        print(input$w3_textInput)
      })
      observeEvent( input$w3_passwordInput , {
        print(input$w3_passwordInput)
      })
      observeEvent( input$w3_dateInput , {
        print(input$w3_dateInput)
      })
      observeEvent( input$w3_editableListInput , {
        print(input$w3_editableListInput)
      })
      
    }

    shinyApp(ui, server)
