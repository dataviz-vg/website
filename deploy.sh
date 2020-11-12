git remote rm origin
git remote add origin https://colinfay:${ACCESS_TOKEN}@github.com/datavizvg/website.git

git show-ref

#Rscript -e 'options(repos = c(CRAN = "https://packagemanager.rstudio.com/all/latest"), download.file.method = "libcurl", Ncpus = 4);install.packages(c("remotes", "blogdown"));remotes::install_github("datavizvg/vegviz")'

#Rscript -e 'blogdown::install_hugo();blogdown::build_site()'

git config --global user.name "contact@colinfay.me"
git config --global user.email "Colin Fay"
git add .
git commit -m "Built" -a

git push --force origin HEAD:refs/heads/netlify