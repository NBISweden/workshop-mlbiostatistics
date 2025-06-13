#! /bin/bash

cat ../NBIS-food-preferences.csv | awk -F '","' '{ print $3, $4 }' | while read x; do fn="diploma-${x// /}.tex"; cp diploma-adj.tex $fn; sed -i "s/XXXXXXX/${x}/g" $fn ; pdflatex $fn; done
