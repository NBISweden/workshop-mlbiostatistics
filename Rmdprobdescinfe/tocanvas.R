library(tidyverse)

sections <- data.frame(x=system2("grep", "'^# ' *.Rmd | grep -v '{-}'", stdout=TRUE))

cap <- function(x) paste0(toupper(substr(x, 1,1)), substr(x,2,str_length(x)))
sections <- sections %>% mutate(session = gsub("[0-9]*", "", gsub(".Rmd.*", "", x)),
                                Session=cap(session),
                                name = gsub(".*# ", "", gsub(" [{].*", "", x)),
                                id = gsub(".*#", "", gsub(".*[{]", "", gsub("[}]", "", x))))


tocanvas <- function(session, Session, name, id) {
  write(sprintf("<p><iframe style=\"overflow: hidden;\" src=\"https://nbisweden.github.io/workshop-mlbiostatistics/session-%s/%s.html\" width=\"1000\" height=\"800\"></iframe></p>", session, id), file="tmp.html")
  system2("curl", sprintf("-X POST --header \"Authorization: Bearer 14589~69wK1p5Q9Q8pcn2WFfl7NL5hwbZQdAhFn6V0Bzwiytap4RagAAHZziZ7biWXrbWk\" https://uppsala.instructure.com/api/v1/courses/51998/pages --data-urlencode wiki_page[title]=\"%s: %s\" --data-urlencode wiki_page[body]@tmp.html", Session, name))
}

