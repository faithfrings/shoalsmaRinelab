.sml_user_textures <- new.env(parent = emptyenv())

sml_textures_available <- function() {
  texture_dir <- system.file(
    "extdata", "textures",
    package = "shoalsmaRinelab"
  )

  built_in <- list.files(
    texture_dir,
    pattern = "\\.(png|jpg|jpeg)$",
    full.names = FALSE,
    ignore.case = TRUE
  )

  built_in <- tools::file_path_sans_ext(built_in)

  user_added <- ls(.sml_user_textures)

  sort(unique(c(built_in, user_added)))
}

sml_texture_path <- function(name) {
  if (exists(name, envir = .sml_user_textures, inherits = FALSE)) {
    return(get(name, envir = .sml_user_textures))
  }

  texture_dir <- system.file(
    "extdata", "textures",
    package = "shoalsmaRinelab"
  )

  possible_files <- list.files(
    texture_dir,
    pattern = paste0("^", name, "\\.(png|jpg|jpeg)$"),
    full.names = TRUE,
    ignore.case = TRUE
  )

  if (length(possible_files) == 0) {
    stop(
      "Texture `", name, "` not found. Available textures are: ",
      paste(sml_textures_available(), collapse = ", "),
      call. = FALSE
    )
  }

  possible_files[[1]]
}

sml_texture <- function(name) {
  sml_texture_path(name)
}

sml_register_texture <- function(name, path, copy = TRUE) {
  if (!file.exists(path)) {
    stop("File does not exist: ", path, call. = FALSE)
  }

  ext <- tools::file_ext(path)

  if (!tolower(ext) %in% c("png", "jpg", "jpeg")) {
    stop(
      "Texture must be a png, jpg, or jpeg file.",
      call. = FALSE
    )
  }

  if (copy) {
    cache_dir <- file.path(tempdir(), "shoalsmaRinelab_textures")
    dir.create(cache_dir, showWarnings = FALSE, recursive = TRUE)

    new_path <- file.path(cache_dir, paste0(name, ".", ext))
    file.copy(path, new_path, overwrite = TRUE)

    path <- new_path
  }

  assign(name, normalizePath(path), envir = .sml_user_textures)

  invisible(path)
}

sml_texture_map <- function(textures) {
  if (is.null(names(textures))) {
    names(textures) <- textures
  }

  paths <- vapply(
    textures,
    sml_texture_path,
    character(1)
  )

  names(paths) <- names(textures)

  paths
}

scale_pattern_filename_sml <- function(textures, ...) {
  texture_paths <- sml_texture_map(textures)

  ggpattern::scale_pattern_filename_manual(
    values = texture_paths,
    ...
  )
}











