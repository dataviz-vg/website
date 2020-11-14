options(
  repos = c(CRAN = "https://packagemanager.rstudio.com/all/latest"), 
  download.file.method = "libcurl",
  Ncpus = 4
)

install.packages("remotes")

remotes::install_cran("renv")

renv::restore()

blogdown::install_hugo(extended = TRUE)

fls <- list.files(
  "content/post/", 
  pattern = ".*Rmd$", 
  full.names = TRUE, 
  recursive = TRUE
)

library(magrittr)

purrr::map(fls, rmarkdown::yaml_front_matter) %>%
  purrr::set_names(fls) %>%
  purrr::map("draft") %>%
  purrr::discard(isTRUE) %>% 
  names() %>%
  blogdown::build_site(
    build_rmd = .
  )
