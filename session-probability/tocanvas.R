library(rjson)

##Define token (generated from settings in canvas) and
##kursid <- 70535
#setwd("..")

##List all figures in an html file
figures <- function(htmlfile) {
  html <- readLines(htmlfile)
  imgs <- grep("<img src", html)
  lapply(strsplit(html[imgs], "<img src="), function(z) sapply(strsplit(z[-1], " "), function(z) gsub('\"', "", z[1]))) %>% unlist()
}

##Post the figure to canvas as a file, will be saved in same file structure as
##path, so do this from appropriate directory (workshop-mlbiostatistics)
postfigure <- function(f, path, token, kursid) {
  ## Following instructions here; https://canvas.instructure.com/doc/api/file.file_uploads.html
  path <- dirname(file.path(path, f))
  f<-basename(f)
  ##Check if file exists
  post1 <- fromJSON(system(sprintf("curl -X GET --header \"Authorization: Bearer %s\" https://uppsala.instructure.com/api/v1/courses/%i/files?search_term=%s  -F 'parent_folder_path=%s'",  token, kursid, f, path), intern = TRUE))
  if (length(post1)>0) { 
    post1 <- post1[[1]]
    return(post1$url)
  } else {
    ## Otherwise: Telling Canvas about the file upload and getting a token
    post1 <- fromJSON(system(sprintf("curl -X POST --header \"Authorization: Bearer %s\" https://uppsala.instructure.com/api/v1/courses/%i/files -F 'name=%s' -F 'parent_folder_path=%s'",  token, kursid, f, path), intern=TRUE))
    params <- sprintf("-F '%s=%s'", names(post1$upload_params), post1$upload_params) %>% paste(collapse=" ")
    ## Upload the file data to the URL given in the previous response
    post2 <- fromJSON(system(sprintf("curl %s %s -F 'file=@%s'", post1$upload_url, params, file.path(path, f)), intern=TRUE))
    ## Confirm the upload's success
    post3 <- fromJSON(system(sprintf("curl -X POST %s -H 'Content-Length: 0' -H 'Authorization: Bearer %s'", post2$location, token), intern=TRUE))
    return(post3$preview_url)
  }
}

cap <- function(x) { ##Capitalize
  paste0(toupper(substring(x, 1,1)), substring(x, 2,))
} 

postpage <- function(htmlfile, token, kursid) {
  h1 <- gsub("[<][/]*h1>", "", system(sprintf("cat %s|grep '<h1>'", htmlfile), intern=TRUE))
  chapter <- cap(gsub("session-", "", basename(dirname(htmlfile))))
  ##Numbered sections?
  if (grepl("header-section-number", h1)) {
    nh1 <- gsub(".*>", "", gsub("</span>.*", "", h1))
    h1 <- gsub(".*span>[ ]*", "", h1)
    title <- paste(paste(chapter, nh1), h1, sep=": ")
  } else {
    title <- paste(chapter, h1, sep=": ")
  }
  figs <- figures(htmlfile)
  path <- dirname(htmlfile)
  #url <- tools::file_path_sans_ext(basename(htmlfile))
  url <- tolower(gsub("[ :.]", "-", title))
  canvashtml <- sprintf("%s/%s-canvas.html", path, url)
  if (length(figs)>0) {
    figurls <- sapply(figs, function(f) postfigure(f, path, token, kursid))
    ##Replace figures with canvas links and remove next/previous buttons
    system(sprintf("cat %s | %s | grep -v '<button class=\"btn btn-default\">Previous</button>' | grep -v '<button class=\"btn btn-default\">Next</button>' > %s", htmlfile, paste(sprintf("sed -e \"s|%s|%s|g\"", names(figurls), figurls), collapse=" | "), canvashtml))
  } else {
    system(sprintf("cat %s | grep -v '<button class=\"btn btn-default\">Previous</button>' | grep -v '<button class=\"btn btn-default\">Next</button>' > %s", htmlfile, canvashtml))
  }
  ##Check if page exists
  post1 <- fromJSON(system(sprintf("curl -X GET --header \"Authorization: Bearer %s\" https://uppsala.instructure.com/api/v1/courses/%i/pages/%s",  token, kursid, url), intern = TRUE))
  if (length(post1)<=1) {
    ##Post to canvas, new page
    system(sprintf("curl -X PUT https://uppsala.instructure.com/api/v1/courses/%i/pages/%s --data-urlencode wiki_page[body]=\"$(cat %s|grep -v '<h1>'|grep -v '<title>')\" -d wiki_page[title]=\"%s\" --header \"Authorization: Bearer %s\"", kursid, url, canvashtml, title, token))
  } else {
    ##Post to canvas, update existing page
    system(sprintf("curl -X PUT https://uppsala.instructure.com/api/v1/courses/%i/pages/%s --data-urlencode wiki_page[body]=\"$(cat %s|grep -v '<h1>'|grep -v '<title>')\" --header \"Authorization: Bearer %s\"", kursid, url, canvashtml, token))
  }
  system(sprintf("rm %s/%s-canvas.html", path, url), ignore.stderr=TRUE)
}


##Do the uploading for probability and inference sessions
#sapply(list.files("session-inference", "infe", full.names = TRUE), postpage, token=token, kursid=kursid)
#sapply(list.files("session-probability", "prob", full.names = TRUE), postpage, token=token, kursid=kursid)
