rm(list=ls())
library(knitr)

# Input data
inp.file <- "../../../workshop-biostats-local/students.txt"
data.inp <- read.delim(inp.file)

# Students full names
students <- paste(data.inp$First.Name, data.inp$Last.Name, sep=' ')
 
# For each student generate a diploma
for (st in students){
  print(st)
  knit2pdf("certificates.Rnw",
           output=paste0('diploma_', st, '.tex'))

}


