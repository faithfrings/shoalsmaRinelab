#' ggplot2 color scale using Shoals Marine Lab palettes
#'
#' @param palette Name of the palette.
#' @param discrete Logical. Should the scale be discrete?
#' @param reverse Logical. Should the palette order be reversed?
#' @param ... Additional arguments passed to ggplot2 scale functions.
#'
#' @return A ggplot2 scale.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   geom_point(size = 3) +
#'   scale_color_sml("sunset")
scale_color_sml <- function(
    palette = "gull",
    discrete = TRUE,
    reverse = FALSE,
    ...
) {
  pal <- function(n) {
    colors <- sml_palette(
      name = palette,
      n = n,
      type = if (discrete) "discrete" else "continuous"
    )

    if (reverse) {
      colors <- rev(colors)
    }

    colors
  }

  if (discrete) {
    ggplot2::discrete_scale(
      aesthetics = "colour",
      scale_name = paste0("sml_", palette),
      palette = pal,
      ...
    )
  } else {
    ggplot2::scale_color_gradientn(
      colors = pal(256),
      ...
    )
  }
}


#' ggplot2 fill scale using Shoals Marine Lab palettes
#'
#' @param palette Name of the palette.
#' @param discrete Logical. Should the scale be discrete?
#' @param reverse Logical. Should the palette order be reversed?
#' @param ... Additional arguments passed to ggplot2 scale functions.
#'
#' @return A ggplot2 scale.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' ggplot(iris, aes(Species, Sepal.Length, fill = Species)) +
#'   geom_boxplot() +
#'   scale_fill_sml("sunset")
scale_fill_sml <- function(
    palette = "gull",
    discrete = TRUE,
    reverse = FALSE,
    ...
) {
  pal <- function(n) {
    colors <- sml_palette(
      name = palette,
      n = n,
      type = if (discrete) "discrete" else "continuous"
    )

    if (reverse) {
      colors <- rev(colors)
    }

    colors
  }

  if (discrete) {
    ggplot2::discrete_scale(
      aesthetics = "fill",
      scale_name = paste0("sml_", palette),
      palette = pal,
      ...
    )
  } else {
    ggplot2::scale_fill_gradientn(
      colors = pal(256),
      ...
    )
  }
}
