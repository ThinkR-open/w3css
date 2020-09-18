library(rvest)
create_R <- function(
  url
){
  page <- read_html(url)
  titre <- page %>%
    html_node("h1") %>%
    html_text()
  file_name <- gsub(".*\\/(w3css_[^.]*)\\.asp", "\\1", url)
  pth <- fs::path(
    "R",
    file_name,
    ext = "R"
  )
  fs::file_create(pth)
  write_there <- function(x){
    write(sprintf("#' %s", x), file = pth, append = TRUE)
  }
  write_there(titre)
  write_there(" ")
  write_there(
    sprintf(
      "Implementation of %s, as described in",
      titre
    )
  )
  write_there(sprintf(
    "[%s](%s).", url, url
  ))
  write_there(" ")
  write_there("@return")
  write_there("@export")
  write_there(" ")
  write_there("@examples")
  write_there(" ")
  write_there("TODO")
  cli::cat_rule("done")
}

page <- read_html('https://www.w3schools.com/w3css/')
urls <- page %>%
  html_nodes("a") %>%
  html_attr("href") %>%
  grep("^w3css_", ., value = TRUE) %>%
  paste0("https://www.w3schools.com/w3css/", .)

purrr::map(urls, create_R)
