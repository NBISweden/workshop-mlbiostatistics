This directory contains the materials prepared for the session about clustering analysis.

### Files

* `chapters.Rmd` : to create a document on the topic
* `presentation.Rmd` : to create the lecture presentation
* `exercises.Rmd` : for exercises and solutions. But, by default, `knit` of this will generate a chapter for exercises only.
* `exercises-solutions.Rmd` : This is a wrapper of  `exercises.Rmd` to generate a chapter for both exercises and solutions by changing `params`. All changes of contents should be done on `exercises.Rmd`. 



### Directories

#### For Canvas

The filles in this directory are to be used in Canvas.

* `html` : all HTML course materials for the topic. The `Rmd` scripts generate the output here.

#### For scripts here

* `images`: a symbolic link to the directory that contains image files, `html/images`.
* `cache` : temporary files created by `Rmd` to store computationally intensive analysis results. The files in here are supposed to be ignored by `git` .
* `env` : environments



### Environment restore

With [Conda](https://docs.conda.io) installed, the commands below on Terminal (Mac/Linux) or Command line (Windows) will restore the same environment.
If you prefer, [Mamba](https://mamba.readthedocs.io/)/micromamba can be used instead of Conda. 

    # common env for all exercises in the course
    conda env create envs/biostat-exer_envir.yml
    
    # for chapters, presentation, and so on
    conda env create -n biostat -f envs/environment.yml

Execute these commands below in the `R` to activate `renv` R package

```R
renv::settings$external.libraries(.libPaths())
renv::activate()
```

To restore `R env`ironment,

```R
renv::restore()
```
