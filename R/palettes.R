sml_palettes <- list(
  gull = c(
    "#E0B0A0",
    "#FFFFFF",
    "#8C8C8C",
    "#2F3A40",
    "#F5A623",
    "#6B5B4B",
    "#8A7A68",
    "#B8A58A",
    "#D6C7A1",
    "#2F3A40"
  ),

  overcast_intertidal = c(
    "#D2DDE5",
    "#63717A",
    "#5E662E",
    "#F0F0EC",
    "#484538",
    "#A38A27"
  ),

  fishes = c(
    "#EECB3C",
    "#FAEFC9",
    "#CBDC6E",
    "#3892BD",
    "#F2A6A3",
    "#B92A3F",
    "#331A00"
  ),

  trawl = c(
    "#EF6F09",
    "#EECB3C",
    "#FAEFC9",
    "#CBDC6E",
    "#3892BD",
    "#F2A6A3",
    "#B92A3F",
    "#87598A",
    "#331A00"
  ),

  sunset = c(
    "#FFDF61",
    "#F7941A",
    "#FF5F1D",
    "#4E506C",
    "#162743"
  ),

  intertidal_critters = c(
    "#DEEBA3",
    "#808F4E",
    "#B7CEFD",
    "#1E3B6F",
    "#FFA75E",
    "#DF5213",
    "#E0D9C1",
    "#5B5B4A"
    )
)


#' Return a Shoals Marine Lab color palette
#'
#' @param name Name of the palette.
#' @param n Number of colors to return. If `NULL`, returns all colors.
#' @param type Either `"discrete"` or `"continuous"`.
#'
#' @return A character vector of hex colors.
#' @export
#'
#' @examples
#' sml_palette("sunset")
#' sml_palette("trawl", n = 4)
#' sml_palette("sunset", n = 5, type = "continuous")
sml_palette <- function(name, n = NULL, type = c("discrete", "continuous")) {
  type <- match.arg(type)

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
        "Palette `", name, "` only has ", length(pal), " colors.",
        call. = FALSE
      )
    }

    return(pal[seq_len(n)])
  }

  grDevices::colorRampPalette(pal)(n)
}

#' List available Shoals Marine Lab palettes
#'
#' @return A character vector of available palette names.
#' @export
#'
#' @examples
#' sml_palettes_available()
sml_palettes_available <- function() {
  names(sml_palettes)
}


