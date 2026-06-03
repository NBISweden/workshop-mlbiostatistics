# book/clean_chapters.R
library(yaml)

message("--- Restoring original configuration ---")

# 1. Restore the original _quarto.yml from backup
if (file.exists("_quarto.yml.bak")) {
  # Parse the file before restoring to identify which folder paths to clean up
  config <- yaml::read_yaml("_quarto.yml.bak")
  file.copy("_quarto.yml.bak", "_quarto.yml", overwrite = TRUE)
  unlink("_quarto.yml.bak")
  message("✓ Restored original _quarto.yml config file.")
} else {
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
