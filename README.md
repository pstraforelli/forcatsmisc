
# forcatsmisc

Factor variables have long been a pain in handling in R. While the
[forcats package](http://forcats.tidyverse.org/reference/index.html) has
alleviated many of the difficulties associated in handling factor
variables, I have found from time to time other needs in wrangling those
variables which are unworthy of belonging to the forcats package. They
will therefore live here instead.

## Installation

You can install forcatsmisc from github with:

``` r
# install.packages("remotes")
remotes::install_github("pstraforelli/forcatsmisc")
```

## Examples

### fct\_recode\_if()

It’s sometimes handy to recode a factor level on a predicate,
particularly when used in a shiny reactive environment.

``` r
df <- data.frame(x = factor(c("apple", "bear", "banana", "dear")),
                 y = factor(c("fruit", "animal", "fruit", "animal")))

dplyr::mutate(df, x = forcatsmisc::fct_recode_if(x, y == "animal", "not a fruit"))
#>             x      y
#> 1       apple  fruit
#> 2 not a fruit animal
#> 3      banana  fruit
#> 4 not a fruit animal
```

### fct\_to\_num()

One of the [most upvoted R questions on
StackOverflow](https://stackoverflow.com/questions/3418128/how-to-convert-a-factor-to-integer-numeric-without-loss-of-information)
is a way to handle situations when a numeric variable was erroneously
convered to a factor variable, and you want it converted back to numeric
- A frustrating situation that occurs surprisingly often. It’s possible
that the question’s popularity may have led to the decision that it
wasn’t worth formalizing the solution into its own function, I decided
otherwise and formalized it into this function.

``` r
var <- factor(c("1", "2", "3"))

forcatsmisc::fct_to_num(var)
#> [1] 1 2 3
```

### fct\_wrap()

One annoyance I often run into is that I want to use a factor variable
as a categorical axis in a plot, but one or more of the factor levels is
very long. I then make the mistake of using
[str\_wrap()](https://stringr.tidyverse.org/reference/str_wrap.html),
which converts my factor variable back to a string variable, thus losing
the order of levels I have set earlier\! Grrrr… Well, in such
situations, use `fct_wrap()` instead.

``` r
var <- factor(c("a very, very, very, very long factor level", "an even longer, unbelievably longer, factor level"))

forcatsmisc::fct_wrap(var, width = 10)
#> [1] a very,\nvery,\nvery,\nvery long\nfactor\nlevel       
#> [2] an even\nlonger,\nunbelievably\nlonger,\nfactor\nlevel
#> 2 Levels: a very,\nvery,\nvery,\nvery long\nfactor\nlevel ...
```

### lvl\_range()

One thing I’ve been doing more and more often in a shiny app is to place
the scales of a factor variable using
[shinyWidgets::sliderTextInput()](https://github.com/dreamRs/shinyWidgets#slider-text)
and let the user select a range they want displayed. The `lvl_range()`
was created to make it easier to handle the output of the UI function on
the backend (such as when filtering the data to include only the range
of factor levels selected).

``` r
var <- factor(c("Very likely", "Somewhat likely", "Somewhat unlikely", "Very unlikely"), 
              levels = c("Very likely", "Somewhat likely", "Somewhat unlikely", "Very unlikely"))

forcatsmisc::lvl_range(var, c("Very likely", "Somewhat unlikely"))
#> [1] "Very likely"       "Somewhat likely"   "Somewhat unlikely"
```

### lvl\_number()

I’ve lately found a need to return the position of a particular level in
a factor variable. For instance, in `levels(iris$Species)`, the
“versicolor” level is in the 2nd position. This function makes it
easier to return this.

``` r
levels(iris$Species)
#> [1] "setosa"     "versicolor" "virginica"
forcatsmisc::lvl_number(iris$Species, "versicolor")
#> [1] 2
```

### fct\_label\_counts()

This function easily adds counts of factors in their levels. This is
useful for displaying in a chart how many cases there are in each level.

``` r
var <- forcatsmisc::fct_label_counts(iris$Species)
levels(var)
#> [1] "setosa (n=50)"     "versicolor (n=50)" "virginica (n=50)"
```
