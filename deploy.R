options(repos = c(CRAN = "https://packagemanager.rstudio.com/all/latest"), download.file.method = "libcurl", Ncpus = 4)
install.packages("remotes")
remotes::install_cran("attachment")
remotes::install_cran("fs")
remotes::install_github("datavizvg/vegviz")
all_pak <- attachment::att_from_rmds("content/")
for (i in all_pak){
  remotes::install_cran(i)
}
blogdown::install_hugo(extended = TRUE)
blogdown::build_site(build_rmd = TRUE)
fs::dir_tree()