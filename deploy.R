options(repos = c(CRAN = "https://packagemanager.rstudio.com/all/latest"), download.file.method = "libcurl", Ncpus = 4)
install.packages("remotes")
remotes::install_cran("attachment")
remotes::install_cran("fs")

remotes::install_github("datavizvg/vegviz")
remotes::install_github("dill/emoGG")

all_pak <- attachment::att_from_rmds("content/")
all_pak <- all_pak[-which(all_pak == "vegviz")]
all_pak <- all_pak[-which(all_pak == "emoGG")]
are_installed <- installed.packages()

for (i in all_pak){
  if (!i %in% are_installed){
    remotes::install_cran(i)
  }
}

blogdown::install_hugo(extended = TRUE)
blogdown::build_site(build_rmd = TRUE)
fs::dir_tree()