index <- readLines("index0.Rmd")
yml <- readLines("_bookdown.yml")
krmdfiles <- grep("rmd_files", yml)

##Exercise files, remove solutions
system("for x in *_solutions.Rmd; do base=${x%%_solutions.*}; awk 'BEGIN {flag=1} /*Solution*/{flag=0;next}/End solution/{flag=1;next}flag' $x > ${base}.Rmd; done")

##Descriptive
# writeLines(gsub("XXXXX", "Descriptive statistics", index), "index.Rmd")
# yml[krmdfiles] <- "rmd_files: [\"index.Rmd\", \"01descriptive.Rmd\"] "
# writeLines(yml, "_bookdown.yml")
# bookdown::render_book(c("index.Rmd", "01descriptive.Rmd"), output_dir="../session-descriptive", preview=TRUE, bookdown::gitbook(lib_dir = "libs"))
##Probability
writeLines(gsub("XXXXX", "Probability", index), "index.Rmd")
yml[krmdfiles] <- "rmd_files: [\"index.Rmd\", \"02probability.Rmd\"] "
writeLines(yml, "_bookdown.yml")
bookdown::render_book(c("index.Rmd", "02probability.Rmd"), output_dir="../session-probability", preview=TRUE, bookdown::gitbook(lib_dir = "libs"))
#bookdown::render_book(c("index.Rmd", "02probability.Rmd"), output_dir="../session-probability", preview=TRUE, bookdown::html_book(lib_dir = "libs", toc=FALSE, split_by="chapter"))
##Statistical inference
writeLines(gsub("XXXXX", "Statistical inference", index), "index.Rmd")
yml[krmdfiles] <- "rmd_files: [\"index.Rmd\", \"03inference.Rmd\"] "
writeLines(yml, "_bookdown.yml")
bookdown::render_book(c("index.Rmd", "03inference.Rmd"), output_dir="../session-inference", preview=TRUE, bookdown::gitbook(lib_dir = "libs"))
##Clustering
# writeLines(gsub("XXXXX", "Clustering", index), "index.Rmd")
# yml[krmdfiles] <- "rmd_files: [\"index.Rmd\", \"04clustering.Rmd\"] "
# writeLines(yml, "_bookdown.yml")
# bookdown::render_book(c("index.Rmd", "04clustering.Rmd"), output_dir="../session-clustering", preview=TRUE, bookdown::gitbook(lib_dir = "libs"))

