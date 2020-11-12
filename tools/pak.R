library(tidyverse)
attachment::att_from_rmds("content/") %>%
  purrr::discard(~ .x == "tidyverse") %>%
  purrr::map(usethis::use_package)

usethis::use_dev_package("emoGG")
usethis::use_dev_package("vegviz")
desc::desc_set_dep("tidyverse")
usethis::use_package("blogdown")
usethis::use_package("ggridges")

usethis::use_latest_dependencies()

renv::snapshot(type = "explicit")

