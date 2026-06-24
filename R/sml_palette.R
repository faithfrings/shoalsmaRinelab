sml_palette <- function(name,
                        n = NULL,
                        type = c("discrete",
                                 "continuous")){
  type = match.arg(type)
  if (!name %in% names(sml_palettes)) {
    stop(
      "Palette `", name, "` not found. Available palettes are: ",
      paste(names(sml_palettes), collapse = ", "),
      call. = FALSE
    )
  }

  pal <- sml_palettes[[name]]

  if (is.null(n)) {
    return(pal)
  }

  if (type == "discrete") {
    if (n > length(pal)) {
      stop(
        "Palette `", name, "` only has ", length(pal),
        " colors, but you requested ", n, ".",
        call. = FALSE
      )
    }

    return(pal[seq_len(n)])
  }

  grDevices::colorRampPalette(pal)(n)
}
