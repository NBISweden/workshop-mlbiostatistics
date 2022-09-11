system('defaults write org.R-project.R force.LANG en_US.UTF-8')

## Environment for exercises are controlled solely by Conda
if(Sys.getenv("CONDA_DEFAULT_ENV") != "biostat-exer") {
  Sys.setenv(
    RENV_PATHS_RENV = "envs/renv",
    RENV_PATHS_LIBRARY = "envs/renv/library",
    RENV_PROJECT = getwd()   # avoid renv::activate message
  )
  source("envs/renv/activate.R")
}

