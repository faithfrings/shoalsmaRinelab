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
    ),

  food = c(
    "#E8C561",
    "#721804",
    "#416B1A",
    "#FCF1C9",
    "#FB9B3A"
  ),

  gilly = c(
    "#3A3A41",
    "#DDDDDF",
    "#837F85",
    "#D42631"
  ),

  ouR_team = c(
    "#CFE49D",
    '#95928B',
    "#40236F",
    "#D1E3F3",
    "#D2548A",
    "#434A52",
    "#435231",
    "#F6FDFF",
    "#33353F",
    "#4F6FD7"
  ),

  tern = c(
    "#676C74",
    "#9EA3AB",
    "#E5E5E5",
    "#4A4C62",
    "#1F242B",
    "#C37266",
    "#63382A"
  ),

  kingsbury = c(
    "#A0AEBD",
    "#D5D3D7",
    "#D87038",
    "#C5B897",
    "#283629"
  ),

  whale = c(
    "#A5BCD7",
    "#666272",
    "#C9B490",
    "#767D8E",
    "#CBC5CD",
    "#3B5478"
  ),

  songbirds = c(
    "#88CAE1",
    "#7F7672",
    "#7D6950",
    "#F8F29B",
    "#CACDDD"),

  lobster_dinner = c(
    "#81231B",
    "#AA9C74",
    "#654167",
    "#DFBA5E",
    "#6A4746"
  )

)


#' Select shoalsmaRine lab palette
#' @description This function returns colour palettes based on shoals marine lab photos
#' @param palette_name Name of desired palette
#' @return A vector of hex colour codes
#' @export
#' @examples
#' get_pal("sunset")
#' get_pal("gilly")

get_pal <- function(palette_name) {

  pal <- sml_palettes[[palette_name]]
  if (is.null(pal))
    stop("Whoops! That colour palette does not exist in shoalsmaRinelab :(")
  pal

}

#' Plot colour palette
#' @description Plot chosen colour palette from shoalsmaRine lab package
#' @param x A vector of colours
#' @return An image showing colours in palette
#' @export
#' @import ggplot2
#' @examples
#' pardalote <- get_pal("sunset")
#' print_pal(sunset)

print_pal <- function(x) {

  n <- length(x)
  df <- data.frame(x = c(1:n), y = rep(1, n))
  ggplot(df) +
    geom_tile(aes(x = x, y = y),
              fill = x,
              colour = "white",
              width = 0.9,
              height = 0.1) +
    theme_void() +
    theme(legend.position = "none")

}

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


