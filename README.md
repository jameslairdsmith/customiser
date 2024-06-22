# customiser

<!-- badges: start -->
[![R-CMD-check](https://github.com/jameslairdsmith/customiser/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jameslairdsmith/customiser/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

customiser is an R Markdown output format that makes it easy for you to
customise your R experience. It does this by handling the writing of your
.Rprofile file. You, as a user, are able to gather and annotate the R code that
you would like to run when your R session starts and customiser will send it to
the appropriate place for R to read it at start-up.

## Installation

You can install the released version of customiser from CRAN with:

```r
install.packages("customiser")
```

And the development version from GitHub with:

```r
# install.packages("remotes")
remotes::install_github("jameslairdsmith/customiser")
```

## Getting started

Once you've downloaded the package, the best place to get started is in RStudio.
The package comes with a template that you can open by going to: `File > New
File > R Markdown > From Template` and then choose 'customiser'. The file will
start something like this:

````
---
title: "My .Rprofile"
knit: customiser::customiser
---

This is a template file you can use to customise your R experience with 
the customiser package. The code that you include here will be transferred to
your .Rprofile when you 'knit'.
````

## Inspiration

If you want to learn more about customising your R experience, you can watch
[this webinar](https://youtu.be/MTui2ojTH0Q?si=pZwXvRSNy8t0hg_S).

The following people have made their .Rprofile files public:

- [Me](https://github.com/jameslairdsmith/dotfiles/blob/main/R/Rprofile.Rmd)
- [Jim Hester](https://github.com/jimhester/dotfiles/blob/master/R/Rprofile)

Other ideas:

- Athanasia Mo Mowinckel has written about [how to customise R's startup messages]
(https://drmowinckels.io/blog/2024/rproject/).
