options(
  repos = c(CRAN = "https://packagemanager.rstudio.com/all/latest"), 
  download.file.method = "libcurl",
  Ncpus = 4
)

install.packages("remotes")

remotes::install_cran("renv")

renv::restore()

blogdown::install_hugo(extended = TRUE)
blogdown::build_site(
  build_rmd = list.files(
    "content/post/", 
    pattern = ".*Rmd$", 
    full.names = TRUE, 
    recursive = TRUE
  )
)

fs::dir_tree()