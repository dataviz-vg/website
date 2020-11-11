sudo apt update && sudo apt install -y libcurl4-openssl-dev

git remote set-url origin https://colinfay:${{ secrets.ACCESS_TOKEN }}@https://github.com/datavizvg/website.git
git branch --set-upstream-to=upstream/netlify

echo "options(repos = c(CRAN = 'https://packagemanager.rstudio.com/all/latest'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site

Rscript -e 'install.packages(c("remotes", "blogdown"));remotes::install_github("datavizvg/vegviz")'

Rscript -e 'blogdown::install_hugo()'

Rscript -e 'blogdown::build_site()'

git config --local user.email "contact@colinfay.me"
git config --local user.name "Colin Fay"
git add .
git commit -m "Built" -a

git push --force 