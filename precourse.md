---
layout: default
title:  'Pre-course material'
---

# Pre-course
There are few things **to do** before the course starts. These include both setting up computers as well as pre-course studying. Please read carefully and follow the instructions so we can have a good start. Contact us in case anything in unclear.

## Content
- [R & R-Studio](#R)
- [R libraries and datasets](#Rlib)
- [Reading](#reading)
- [Exercises](#exercises)
- [What do bring](#whattobring)
- [Additional resources](#extra)

---

### R & R-Studio <a name="R"></a>

During the course we will run scripts locally on laptops using `R` and `R-Studio`. To be able to follow exercises we ask you to install R and R-Studio on your laptop. Both of these work on computers running Linux, Windows and Macintosh operating systems. R-studio is a set of tools as well as an editor that facilitates the use of R. Over the last years it has become a very popular tool and in many ways become a de-facto standard for working with R.

Note that on some operating systems it will be easier to install and run R and R-studio if you are administrator of your own computer and hence are allowed to install software on your machine. If you do not have these privileges please ask your system administrator to install the latest version of R and R-studio.

##### Install R

Install version 3.5.0 or higher

1.  Go to [CRAN](https://cran.rstudio.com)
2.  Click on the link corresponding to your operating system
3.  Download the recommended files for your system.
4.  Run the installer or move the downloaded files to suitable place on
    your computer.


##### Install R Studio

Go to the web page [rstudio](https://www.rstudio.com/products/rstudio/download/) download the installer corresponding to your operating system. Unpack the installer and install the app on a suitable place on your system.

##### Test installations

If the installation above went without any problem you should be able to fire up R-studio and see something like the following:
<figure>
<img src="precourse/images/RStudio.png" width="500" height="400">
</figure>

----------
### R libraries and datasets <a name="Rlib"></a>

By default, R instals a set of packages during installation. R package, is a basic unit of sharable code, that bundles together code, data, documentation and tests. In the course we will be using both default and additional R packages; the latter we need to install.

##### Install R packages
To install R packages, open R-Studio and in the console, type

``` r
# For CRAN packages
install.packages(ggplot2)
install.packages(reshape2)
install.packages(dplyr)
install.packages(UsingR)
install.packages(googledrive)
install.packages(devtools)
install.packages(pvclust)
install.packages(pheatmap)
install.packages(rafalib)

# For developmental packages, not on CRAN
devtools::install_github("tidyverse/googlesheets4")
```

<figure>
<img src="precourse/images/RStudio-Rlib.png" width="400" height="300">>
<figcaption>
Example screen shoot with install.packages(ggplot2) command
</figcaption>
</figure>

##### Test installation
1. Download R markdown file that we have prepared for you from here [Rtest.Rmd](precourse/Rtest.Rmd).
2. Open R-Studio
3. Open Rtest.Rmd by clicking on `File` -> `Open file` and navigating to the `Rtest.Rmd` location on your computer
4. Have a look at the document to see if you can distinguish code from text. Do not worry if you do not understand the code yet. We are testing the installation now. More about R Markdown comes later (see Exercises: R Markdown).
5. Press `Knit` button
6. **Email us** <<olga.dethlefsen@nbis.se>> and <<eva.freyhult@nbis.se>> the resulting `Rtest.html` file. If installation was successful, `Rtest.Rmd` will render to `Rtest.html` with KnitR. The file should be saved in the same directory as the `Rtest.Rmd`.
7. Otherwise, you will get error messages in the console. You can try to trouble shoot by reading error messages and re-installing packages. If you are new to R and R-Studio try also reading Chapter 1 - [Data analysis for the life sciences][book-rai], Rafael A. Irizarry and Michael I. Love. If you do not manage, email <<olga.dethlefsen@nbis.se>> and <<eva.freyhult@nbis.se>>. An empty email with a title "Will need help with R/RStudio setup" will do.

------

### Reading <a name="reading"></a>
- 2-pager [math refresher](precourse/Maths-Refresher.pdf) (Polak, 2015)
-  Chapter **Matrix algebra**, pages 110 - 117 (from 4.3 Matrix Notation) from [Data analysis for the life sciences][book-rai], Rafael A. Irizarry and Michael I. Love
- Chapter 3, session **3.1 Simple Linear Regression**, pages 61 - 70, from [An Introduction to Statistical Learning][book-gj], Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani

------

### Exercises <a name="exercises"></a>
If you are new to R and/or R Markdown read carefully and practice commands. If you've been using R and R Markdown scan through the materials to double check you it covered.

##### R

- Read and practice commands from Chapter: **Getting started** - [Data analysis for the life sciences][book-rai], Rafael A. Irizarry and Michael I. Love.
- Do lab **2.3 Lab: Introduction to R** from [An Introduction to Statistical Learning][book-gj], Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani (.pdf freely available)

#### R Markdown
- [Introduction to R Markdown](https://rmarkdown.rstudio.com/articles_intro.html)

-------
### What to bring <a name="whattobring"></a>
- bring your own laptop with the above R and R-Studio installations
- bring pen and paper to write on
- a positive open attitude :)

-------
### Additional resources <a name="extra"></a>

#### Other potentially useful resources
- [Best first R tutorial](https://www.nceas.ucsb.edu/files/scicomp/Dloads/RProgramming/BestFirstRTutorial.pdf)  
  A nice self learn tutorial to R, introducing many central concepts to R.
- [A short introduction to R](https://cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf)  
  A very short introduction to using R.


#### Extra reading
-  Chapter: Inference from [Data analysis for the life sciences][book-rai], Rafael A. Irizarry and Michael I. Love


[book-gj]: https://www-bcf.usc.edu/~gareth/ISL/ISLR%20First%20Printing.pdf
[book-rai]: http://www.rwdc2.com/files/rafa.pdf
