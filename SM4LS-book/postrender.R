# book/clean_chapters.R
library(yaml)

message("--- Restoring original configuration ---")

# 1. Restore the original _quarto.yml from backup
if (file.exists("_quarto.yml.bak")) {
  # Parse the file before restoring to identify which folder paths to clean up
  config <- yaml::read_yaml("_quarto.yml.bak")
  if (!file.exists("_quarto.yml")) {
    cleanup <- TRUE
  } else {
    ## Check if the original config is newer than the backup (it might be a few seconds newer if many files had to be copied), but a longer time difference indicates that the original config was modified manually after the backup was created.
    bak_time <- file.info("_quarto.yml.bak")$mtime |> as.integer()
    orig_time <- file.info("_quarto.yml")$mtime |> as.integer()
    cleanup <- orig_time - bak_time < 10
  }
  if (!cleanup) {
    stop("❌ ERROR: Build halted! The original config file '_quarto.yml' is newer than the backup. Please check for changes before restoring.\n")
  }
  file.copy("_quarto.yml.bak", "_quarto.yml", overwrite = TRUE)
  unlink("_quarto.yml.bak")
  message("✓ Restored original _quarto.yml config file.")
} else {
  if (!file.exists("_quarto.yml")) {
    stop("❌ ERROR: Build halted! The backup config file '_quarto.yml.bak' is missing, and the original '_quarto.yml' does not exist. Cannot restore configuration.\n")
  }
  config <- yaml::read_yaml("_quarto.yml")
}

# 2. Safely extract and clean up the temporary directories
chapters_list <- unlist(config$book$chapters)
external_paths <- chapters_list[grep("^\\.\\./", chapters_list)]
external_dirs <- unique(gsub("^\\.\\./([^/]+)/.*$", "\\1", external_paths))

for (dir_name in external_dirs) {
  target_dir <- paste0("", dir_name)
  if (dir.exists(target_dir)) {
    unlink(target_dir, recursive = TRUE)
    message(paste("Cleaned temporary folder:", target_dir))
  }
}
