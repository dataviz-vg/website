library(purrr)
list.files(
  path = "content/", 
  pattern = ".*.html$", 
  recursive = TRUE, 
  full.names = TRUE
) %>%
  map(unlink, TRUE, TRUE)
list.files(
  pattern = ".Store$", 
  recursive = TRUE, 
  full.names = TRUE, 
  all.files = TRUE
) %>%
  map(unlink, TRUE, TRUE)
unlink("blogdown/", TRUE, TRUE)
unlink("static", TRUE, TRUE)
unlink("public", TRUE, TRUE)
