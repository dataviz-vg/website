library(magrittr)
attachment::att_from_rmds("content/") %>%
  purrr::discard(~ .x == "tidyverse") %>%
  purrr::map(usethis::use_package)

usethis::use_dev_package("emoGG")
usethis::use_dev_package("vegviz")
usethis::use_dev_package("emo")

usethis::use_package("gifski")
usethis::use_package("magick")
usethis::use_package("blogdown")
usethis::use_package("details")
usethis::use_package("rmarkdown")

usethis::use_latest_dependencies()
usethis::use_tidy_description()

renv::snapshot(type = "explicit", force = TRUE)

