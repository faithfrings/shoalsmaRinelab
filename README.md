
# shoalsmaRinelab

<!-- badges: start -->

![](images/shoalsmaRinelab.png) <!-- badges: end -->

The goal of the shoalsmaRinelab package is to provide users with custom
palettes developed from photos taken by students, staff, and faculty of
landscapes, flora, fauna and cuisine at the Shoals Marine Laboratory.

A special thank you to Charlotte Tysall for creation of the package logo
design, and to the R by the Sea students for inspiring the ideas behind
the logo.

### Installation

You can install the development version of shoalsmaRinelab from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("faithfrings/shoalsmaRinelab")
```

### How to use `shoalsmaRinelab`

You can get a list of the possible palettes using
`sml_palettes_available` function.

``` r
library(shoalsmaRinelab)
sml_palettes_available()
#> [1] "gull"                "overcast_intertidal" "fishes"             
#> [4] "trawl"               "sunset"              "intertidal_critters"
#> [7] "food"                "gilly"
```

`get_pal` returns the chosen palette as a vector of hex color codes.

``` r
get_pal("sunset")
#> [1] "#FFDF61" "#F7941A" "#FF5F1D" "#4E506C" "#162743"
```

`print_pal` displays the colour palette.

``` r
sunset <- get_pal("sunset")
print_pal(sunset)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" alt="" width="100%" />

### Examples

Colour palettes can be used for data visualisation in base `R` and
`ggplot2`.

#### Continuous example

``` r
library(shoalsmaRinelab)
library(ggplot2)
#> Warning: package 'ggplot2' was built under R version 4.4.3

ggplot(faithful,
       aes(x = waiting,
           y = eruptions,
           color = eruptions))+
  geom_point()+
  scale_color_sml(palette = "sunset",
                  discrete = FALSE)+
  theme_bw()
```

<img src="man/figures/README-example-1.png" alt="" width="100%" />

#### Discrete example

``` r
ggplot(mpg, aes(x = class, fill = class)) + 
  geom_bar() + 
  scale_fill_sml(palette = "intertidal_critters",
                 discrete = TRUE) + 
  theme_bw()
```

<img src="man/figures/README-unnamed-chunk-5-1.png" alt="" width="100%" />

## Palettes

### Guillemot

<table>

<tr>

<td width="65%" align="center">

<img src="man/figures/README-gilly_pal-1.png" alt="" width="100%" />

</td>

<td width="35%" align="center">

<img src="images/gilly_circle.png" alt="Guillemot" width="220">

Image: [Marshall
Mumford](https://lh3.googleusercontent.com/sitesv/AA5AbUApo-pb-SbL_u8A8W3OMnmN9PU8jluZCrmOm5vDyzFHNMOMucCoUdexgQrxILqbhx3VQH0ubHh0dgpPEvx197mjsHURTzDgk-Glh2kdyBL0dpwCAZRsL7mWal1mepJ9T_Lv5TxH1knblc8x6PYixKPujSOkArmCzQEJyRXmXan09BDmtxqO__mhy37PPU3uLkc1O9EifL7CNeQjpNz9k9z1Q9pIBfTAlYnwbQ=w1280)

</td>

</tr>

</table>

### Gull

<table>

<tr>

<td width="65%" align="center">

<img src="man/figures/README-gull_pal-1.png" alt="" width="100%" />

</td>

<td width="35%" align="center">

<img src="images/gull_circle.png" alt="Gull" width="220">

Image: [Marshall
Mumford](https://www.mrm.photography/home/experiences/shoals-marine-lab/surg)

</td>

</tr>

</table>

### Fishes

Inspiration for the fishes palette: winter flounder, short horn sculpin,
sea raven, cunner, hag fish, cod, mackerel, and pollock
<table>

<tr>

<td width="65%" align="center">

<img src="man/figures/README-fish_pal-1.png" alt="" width="100%" />

</td>

<td width="35%" align="center">

<img src="images/fish_circle.png" alt="Fishes" width="220">

Image: [Marshall
Mumford](https://www.mrm.photography/home/experiences/shoals-marine-lab/surg)

</td>

</tr>

</table>

### Intertidal critters

<table>

<tr>

<td width="65%" align="center">

<img src="man/figures/README-intertidal_pal-1.png" alt="" width="100%" />

</td>

<td width="35%" align="center">

<img src="images/intertidal_critters_circle.png" alt="Intertidal critters" width="220">

Image: Marshall Mumford

</td>

</tr>

</table>

### Overcast intertidal

<table>

<tr>

<td width="65%" align="center">

<img src="man/figures/README-ointertidal_pal-1.png" alt="" width="100%" />

</td>

<td width="35%" align="center">

<img src="images/overcast_intertidal_circle.png" alt="Overcast intertidal" width="220">

Image: Jannine Chamorro

</td>

</tr>

</table>

### Trawl

This palette was inspired by organisms captured during an otter trawl.
Organisms include sculpin, flounder, and lobsters.
<table>

<tr>

<td width="65%" align="center">

<img src="man/figures/README-trawl_pal-1.png" alt="" width="100%" />

</td>

<td width="35%" align="center">

<img src="images/trawl_circle.png" alt="Trawl" width="220">

Image: Marshall Mumford

</td>

</tr>

</table>

### Food

This palette was inspired by student photos of their meals at the lab.
The meals were too good not to share!
<table>

<tr>

<td width="65%" align="center">

<img src="man/figures/README-food_pal-1.png" alt="" width="100%" />

</td>

<td width="35%" align="center">

<img src="images/food_circle.png" alt="Food" width="220">

Image: Elin Bjorklunk Mischler

</td>

</tr>

</table>

### Sunset

<table>

<tr>

<td width="65%" align="center">

<img src="man/figures/README-sunset_pal-1.png" alt="" width="100%" />

</td>

<td width="35%" align="center">

<img src="images/sunset_circle.png" alt="Sunset" width="220">

Image: TBD

</td>

</tr>

</table>
