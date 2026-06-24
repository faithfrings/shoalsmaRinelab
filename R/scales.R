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
      type = ifelse(discrete, "discrete", "continuous")
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
      type = ifelse(discrete, "discrete", "continuous")
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
