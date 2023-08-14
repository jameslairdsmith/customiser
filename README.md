# customiser

customiser is an R Markdown output format that makes it easy for you to 
customise your R experience. It does this by handling the writing of your 
.Rprofile file. You, as a user, are able to gather and annotate the R code that 
you would like to run when your R session starts and customiser will send it to 
the appropriate place for R to read it at start-up.

## Installation

```r
# install.packages("remotes")
remotes::install_github("jameslairdsmith/customiser")
```

## Getting started

Once you've downloaded the package, the best place to get started is in RStudio.
The package comes with a template that you can open by going to: 
`File > New File > R Markdown > From Template` and then choose 'customiser'.
The file will look something like this:

```
---
title: "My .Rprofile"
knit: customiser::customiser
---

This is a template file you can use to customise your R experience with 
the customiser package. The code that you include here will be transferred to
your .Rprofile when you 'knit'.

You can use a file like this one to personalise parts of R to your own 
requirement or liking. For example, you can specify the amount of text that 
you would like to print at default. 

```{r}
options(max.print = 40)
```
```
