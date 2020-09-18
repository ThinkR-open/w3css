## code to prepare `colors` dataset goes here
library(rvest)
x <- read_html("https://www.w3schools.com/w3css/w3css_colors.asp")
tbls <- x %>%
  html_table()
w3_colors <- c(tbls[[1]]$X1, tbls[[1]]$X2)
w3_colors <- tolower(w3_colors)
w3_colors <- gsub(" ", "-", w3_colors)

usethis::use_data(w3_colors, overwrite = TRUE)
