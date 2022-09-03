##Exercise files, remove solutions
#system("for x in *_solutions.Rmd; do base=${x%%_solutions.*}; awk 'BEGIN {flag=1} /*Solution*/{flag=0;next}/End solution/{flag=1;next}flag' $x > ${base}.Rmd; done")
##Render exercise files with solutions separately
#tmp <- lapply(list.files(pattern="solutions.Rmd"), function(rmd) rmarkdown::render(rmd))

##Render book for canvas
bookdown::render_book(c("index.Rmd", "descriptive.Rmd"), output_dir=".", preview=TRUE, bookdown::html_book(lib_dir = "libs", number_sections=TRUE, toc=FALSE, split_by="chapter"))

##Upload to canvas
#kursid=70535
#token generated from settings in canvas
source("../session-probability/tocanvas.R")
wd <- getwd()
setwd("..")
sapply(list.files("session-descriptive", "desc--.*html", full.names = TRUE), postpage, token=token, kursid=kursid)

setwd(wd)
##Render book for github
bookdown::render_book(c("index.Rmd", "descriptive.Rmd"), output_dir=".", preview=TRUE, bookdown::gitbook(lib_dir = "libs"))
