---
layout: default
title:  'Pre-course material'
---

<br/>
### <img border="0" src="icons/precourse.svg" width="40" height="40"> Pre-course information


There are few things **to do** before the course starts. These include both pre-course homework (studying), setting up communication channels and your computer.


- [Pre-course homework](#homework)
- [Communication](#communication)
- [R, R-Studio, R markdown](#R)
- [What to bring](#whattobring)

<!-- - [Additional resources](#extra) -->
<!-- - [R libraries and datasets](#Rlib) -->
<!-- - [Reading](#reading) -->


#### Pre-course homework <a name="homework"></a>
- Biostatistics and machine learning is based on mathematics so in order to have a good start at the course we need to revise or pick-up the basics.
- Go to [https://olgadet.github.io/bookdown-mlbiostatistics/](https://olgadet.github.io/bookdown-mlbiostatistics/) and have a look at the Preliminary Mathematics section, 7 chapters covering basics of mathematical notations, sets, functions, differentiation, integration, vectors and matrices.
- Find pen and paper and **write down** the solutions (or your best attempt) to the following exercises:
  - Ex. 1.3: f, g, h
  - Ex. 1.4: e, f, g, h
  - Ex. 2.2
  - Ex. 3.2, 3.3
  - Ex. 4.6: h, i, j
  - Ex. 5.1: i, j
  - Ex. 6.1: e
  - Ex. 7.1: h

#### Communication <a name="communication"></a>
- We will be using [Zoom](https://zoom.us) for discussions and [Zulip](https://zulip.com) for chatting in writing

##### Zoom Meeting
- https://stockholmuniversity.zoom.us/j/67966236535
*Password sent via email*

##### Zulip
- Join via the invitation link *sent via email*
- Upload your photo. Edit your profile. Introduce yourself in the "sayHi" stream
- And feel free to start the conversation going under "prelim-math" while you're doing your pre-course homework

#### What to bring (have) <a name="whattobring"></a>
- a laptop with R and R-Studio installations (see below)
- a working web camera and a quiet space to take the course from
- solutions (or attempts) to the exercises (see above Pre-course homework)
- a pen and paper to write on
- a positive attitude


#### R, R-Studio, R-packages and Rmd <a name="R"></a>

- During the course we will run scripts locally on laptops using `R` (programming language) and `R-Studio` (editor). We  will write scripts in using R markdown files (.Rmd), a files that include both an easy-to-write plain text that can also contain chunks of embedded R code.

##### R

Install R version 3.5.0 or higher

1.  Go to [CRAN](https://cran.rstudio.com)
2.  Click on the link corresponding to your operating system
3.  Download the recommended files for your system.
4.  Run the installer or move the downloaded files to suitable place on
    your computer.

##### Install R Studio

- Go to the web page [rstudio](https://www.rstudio.com/products/rstudio/download/) download the installer corresponding to your operating system. Unpack the installer and install the app on a suitable place on your system.
- You should now be able to fire up R-studio and see something like the following:
<figure>
<img src="precourse/images/RStudio.png" width="500" height="400">
</figure>

- *Note that on some operating systems it will be easier to install and run R and R-studio if you are administrator of your own computer and hence are allowed to install software on your machine. If you do not have these privileges please ask your system administrator to install the latest version of R and R-studio.*

##### R packages
- By default, R installs a set of packages during installation. R package, is a basic unit of sharable code, that bundles together code, data, documentation and tests. In the course we will be using both default and additional R packages; the latter we need to install. To install a package, we type in console `install.packages("package-name")`
- Try installing packages that we will use for decision tress and artificial neural networks

```R

# install decision tress packages
install.packages("rpart")
install.packages("rpart")
install.packages("randomForest")

# install artifical neural network package
install.packages("neuralnet")

```

- To use the install package we load them by using `library()` or `require()` e.g.
```R

library("neuralnet")
require("randomForest")

```

- To see packages index page use `help()` function
```R
help(package="neuralnet")
```

##### Install R packages
To install R packages, open R-Studio and in the console, type

#### R and R Markdown
- If you are new to R Markdown have a look [https://rmarkdown.rstudio.com/lesson-1.html](https://rmarkdown.rstudio.com/lesson-1.html)
- If you are new to R you can follow for free introduction online R lessons at codecademy [https://www.codecademy.com/learn/learn-r](https://www.codecademy.com/learn/learn-r) or at datacamp [https://www.datacamp.com/courses/free-introduction-to-r](https://www.datacamp.com/courses/free-introduction-to-r)


<!--
##### R libraries and datasets <a name="Rlib"></a>

By default, R installs a set of packages during installation. R package, is a basic unit of sharable code, that bundles together code, data, documentation and tests. In the course we will be using both default and additional R packages; the latter we need to install.

##### Install R packages
To install R packages, open R-Studio and in the console, type

``` r
# For CRAN packages

install.packages("dplyr")
install.packages("UsingR")
install.packages("reshape2")
install.packages("glmnet")
install.packages("pvclust")

install.packages("googledrive")
install.packages("devtools")

install.packages("ggplot2")
install.packages("pheatmap")
install.packages("rafalib")

install.packages("tidyverse")
install.packages("kableExtra")
install.packages("knitr")
install.packages("keras")


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

If you do not already have the package devtools installed or for other reasons run into problems installing the package googlesheets4, please skip this package! Use this file [Rtestreduced.Rmd](precourse/Rtestreduced.Rmd) to test your installation instead and send us the resulting `Rtestreduced.html` file.

------ -->

<!-- ### Reading <a name="reading"></a>
- 2-pager [math refresher](precourse/Maths-Refresher.pdf) (Polak, 2015)
- Chapter **Matrix algebra**, pages 147 - 157 (subsections: Matrix Notation; Solving System of Equations; Vectors, Matrices and Scalars; Matrix Operations) from [Data analysis for the life sciences][book-rai], Rafael A. Irizarry and Michael I. Love
- Chapter 3, session **3.1 Simple Linear Regression**, pages 61 - 70, from [An Introduction to Statistical Learning][book-gj], Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani

------ -->

<!-- ### Additional R practice  <a name="R-practice"></a>
If you are new to R and/or R Markdown read carefully and practice commands. If you've been using R and R Markdown scan through the materials to double check you it covered.

##### R

- Read and practice commands from Chapter: **Getting started** - [Data analysis for the life sciences][book-rai], Rafael A. Irizarry and Michael I. Love.
- Do lab **2.3 Lab: Introduction to R** from [An Introduction to Statistical Learning][book-gj], Gareth James, Daniela Witten, Trevor Hastie and Robert Tibshirani (.pdf freely available) -->



-------



<!-- -------
### Additional resources <a name="extra"></a> -->

<!-- #### Extra reading
-  Chapter: Inference from [Data analysis for the life sciences][book-rai], Rafael A. Irizarry and Michael I. Love -->

<!-- #### Extra R labs
- [Best first R tutorial](https://www.nceas.ucsb.edu/files/scicomp/Dloads/RProgramming/BestFirstRTutorial.pdf)  
  A nice self learn tutorial to R, introducing many central concepts to R.
- [A short introduction to R](https://cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf)  
  A very short introduction to using R. -->



[book-gj]: https://www-bcf.usc.edu/~gareth/ISL/ISLR%20First%20Printing.pdf
[book-rai]: http://www.rwdc2.com/files/rafa.pdf
