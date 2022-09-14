#!/bin/zsh
COURSE_GITHUB_IO="https://nbisweden.github.io/workshop-mlbiostatistics/session-pca/html"

for html_out in chapters exercises exercises-solutions
do
  html_out_files=$html_out"_files"
  sed -e "s,$html_out_files/figure-html,$COURSE_GITHUB_IO/$html_out_files/figure-html,g" $html_out.html |
    sed -e "s,src=\"images/,src=\"$COURSE_GITHUB_IO/images/,g" > to_canvas/$html_out.html
done
