
<!-- README.md is generated from README.Rmd. Please edit that file -->
# CountAllMissingByGroup

<!-- badges: start -->
<!-- badges: end -->
The goal of CountAllMissingByGroup is to count NA cells per specified group given an input data frame.

## Installation

You can install the development version of CountAllMissingByGroup like so:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/CountAllMissingByGroup")
#> Downloading GitHub repo stat545ubc-2023/CountAllMissingByGroup@HEAD
#> rlang     (1.1.1 -> 1.1.2) [CRAN]
#> lifecycle (1.0.3 -> 1.0.4) [CRAN]
#> withr     (2.5.0 -> 2.5.2) [CRAN]
#> vctrs     (0.6.3 -> 0.6.4) [CRAN]
#> utf8      (1.2.3 -> 1.2.4) [CRAN]
#> fansi     (1.0.4 -> 1.0.5) [CRAN]
#> Installing 6 packages: rlang, lifecycle, withr, vctrs, utf8, fansi
#> Installing packages into '/private/var/folders/k6/glps726n55lgfckf3sxkf8f80000gn/T/RtmpXvGe0A/temp_libpath72d535ccdf38'
#> (as 'lib' is unspecified)
#> 
#>   There are binary versions available but the source versions are later:
#>           binary source needs_compilation
#> rlang      1.1.1  1.1.2              TRUE
#> lifecycle  1.0.3  1.0.4             FALSE
#> withr      2.5.1  2.5.2             FALSE
#> utf8       1.2.3  1.2.4              TRUE
#> 
#> 
#> The downloaded binary packages are in
#>  /var/folders/k6/glps726n55lgfckf3sxkf8f80000gn/T//RtmpISwiSj/downloaded_packages
#> installing the source packages 'rlang', 'lifecycle', 'withr', 'utf8'
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#> * checking for file ‘/private/var/folders/k6/glps726n55lgfckf3sxkf8f80000gn/T/RtmpISwiSj/remotes736b33cd3a15/stat545ubc-2023-CountAllMissingByGroup-0fb4b33/DESCRIPTION’ ... OK
#> * preparing ‘CountAllMissingByGroup’:
#> * checking DESCRIPTION meta-information ... OK
#> * checking for LF line-endings in source and make files and shell scripts
#> * checking for empty or unneeded directories
#> * building ‘CountAllMissingByGroup_0.1.0.0000.tar.gz’
#> Installing package into '/private/var/folders/k6/glps726n55lgfckf3sxkf8f80000gn/T/RtmpXvGe0A/temp_libpath72d535ccdf38'
#> (as 'lib' is unspecified)
```

## Examples

## Example 1:

Count the missing values per month, in the airquality data frame by month:

``` r
library(CountAllMissingByGroup)
CountAllMissingByGroup(airquality, Month)
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

Retain the grouping column in the output with the `.groups` argument

``` r
library(CountAllMissingByGroup)
CountAllMissingByGroup(airquality, Month, .groups = "keep")
#> # A tibble: 5 × 6
#> # Groups:   Month [5]
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

## Example 2

Count the number of missing values (none) by Species in the `iris` data set

``` r
CountAllMissingByGroup(iris, Species)
#> # A tibble: 3 × 5
#>   Species    Sepal.Length Sepal.Width Petal.Length Petal.Width
#>   <fct>             <int>       <int>        <int>       <int>
#> 1 setosa                0           0            0           0
#> 2 versicolor            0           0            0           0
#> 3 virginica             0           0            0           0
```

## Example 3

Count the number of missing values for each creature in the starwards data set from dplyr

``` r
CountAllMissingByGroup(dplyr::starwars, name)
#> # A tibble: 87 × 14
#>    name     height  mass hair_color skin_color eye_color birth_year   sex gender
#>    <chr>     <int> <int>      <int>      <int>     <int>      <int> <int>  <int>
#>  1 Ackbar        0     0          0          0         0          0     0      0
#>  2 Adi Gal…      0     0          0          0         0          1     0      0
#>  3 Anakin …      0     0          0          0         0          0     0      0
#>  4 Arvel C…      1     1          0          0         0          1     0      0
#>  5 Ayla Se…      0     0          0          0         0          0     0      0
#>  6 BB8           1     1          0          0         0          1     0      0
#>  7 Bail Pr…      0     1          0          0         0          0     0      0
#>  8 Barriss…      0     0          0          0         0          0     0      0
#>  9 Ben Qua…      0     0          0          0         0          1     0      0
#> 10 Beru Wh…      0     0          0          0         0          0     0      0
#> # ℹ 77 more rows
#> # ℹ 5 more variables: homeworld <int>, species <int>, films <int>,
#> #   vehicles <int>, starships <int>
```

# Example 4

Count the number of missing values for each species in the starwards data set from dplyr and keep the grouping variable

``` r
CountAllMissingByGroup(dplyr::starwars, species, .groups = "keep")
#> # A tibble: 38 × 14
#> # Groups:   species [38]
#>    species    name height  mass hair_color skin_color eye_color birth_year   sex
#>    <chr>     <int>  <int> <int>      <int>      <int>     <int>      <int> <int>
#>  1 Aleena        0      0     0          0          0         0          1     0
#>  2 Besalisk      0      0     0          0          0         0          1     0
#>  3 Cerean        0      0     0          0          0         0          0     0
#>  4 Chagrian      0      0     1          0          0         0          1     0
#>  5 Clawdite      0      0     0          0          0         0          1     0
#>  6 Droid         0      1     2          3          0         0          3     0
#>  7 Dug           0      0     0          0          0         0          1     0
#>  8 Ewok          0      0     0          0          0         0          0     0
#>  9 Geonosian     0      0     0          0          0         0          1     0
#> 10 Gungan        0      0     1          0          0         0          2     0
#> # ℹ 28 more rows
#> # ℹ 5 more variables: gender <int>, homeworld <int>, films <int>,
#> #   vehicles <int>, starships <int>
```

Count missing
