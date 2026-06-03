# Move directories with relevant qmds to this book directory while generating the output. This is to ensure that figures etc are linked properly.
library(yaml)

message("--- Temporarily copy files ---")

# 1. Read the existing config and create a backup
yaml_file <- "_quarto.yml"
file.copy(yaml_file, "_quarto.yml.bak", overwrite = TRUE)
if (!file.exists(yaml_file)) stop("Missing config: _quarto.yml")
config <- yaml::read_yaml(yaml_file)

# 2. Separate external chapters and identify the source folders
chapters_list <- unlist(config$book$chapters)
external_paths <- chapters_list[grep("^\\.\\./", chapters_list)]
external_dirs <- unique(gsub("^\\.\\./([^/]+)/.*$", "\\1", external_paths))

# 3. VALIDATION CHECK: Stop and error out if any temporary directory already exists
for (dir_name in external_dirs) {
  target_dir <- paste0("", dir_name)
  if (dir.exists(target_dir)) {
    stop("❌ ERROR: Build halted! The temporary directory '", target_dir, "' already exists. Please delete or move.\n")
  }
}


# 4. Duplicate folders into the book directory so assets and figures map locally
for (dir_name in external_dirs) {
  source_dir <- file.path("..", dir_name)
  target_dir <- paste0("", dir_name) # Converts external reference to local identifier, possibly rename
  
  if (dir.exists(source_dir)) {
    if (dir.exists(target_dir)) unlink(target_dir, recursive = TRUE)
    dir.create(target_dir, showWarnings = FALSE)
    file.copy(from = list.files(source_dir, full.names = TRUE), 
              to = target_dir, recursive = TRUE, copy.mode = TRUE)
    message(paste("✓ Copied folder:", source_dir, "-> book/", dir_name))
  }
}

# 5. Rewrite chapters list by removing the "../" prefix
rewrite_paths <- function(item) {
  # Scenario A: If we encounter a standard list layout (like elements under 'book:')
  if (is.list(item)) {
    # If this specific list element is named 'chapters' and it is a flat character string,
    # it means it's a single-chapter section that R compressed. Force it to be a list!
    if (!is.null(names(item)) && "chapters" %in% names(item) && is.character(item$chapters)) {
      item$chapters <- as.list(gsub("^\\.\\./", "", item$chapters))
    }
    
    # Process all other properties recursively (preserving names and attributes)
    res <- lapply(item, rewrite_paths)
    attributes(res) <- attributes(item)
    return(res)
  }
  
  # Scenario B: If we encounter a raw character string (like an un-named list item)
  if (is.character(item)) {
    # Simply update the text path without wrapping it in an extra list layer
    return(gsub("^\\.\\./", "", item))
  }
  
  return(item)
}
config$book$chapters <- lapply(config$book$chapters, rewrite_paths)

# 6. Overwrite the _quarto.yml file on disk. 
# Quarto reads this new configuration file immediately after this script completes.
yaml::write_yaml(config, yaml_file, handlers=list(logical = verbatim_logical))

message("--- Preparation Complete. Handing over to Quarto ---")
