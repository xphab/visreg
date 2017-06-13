---
---

`visreg` is an R package for displaying the results of a fitted model in terms of how a predictor variable `x` is estimated to affect an outcome `y`.  `visreg` is implemented in an entirely object-oriented manner, meaning that it works with virtually any type of (formula-based) model class in R, provided that the model class provides a `predict` method.

This site is under construction at the moment, but new material is being added daily.

# Installation

`visreg` is on CRAN, so it can be installed via:


```r
install.packages("visreg")
```




# Quick start guide

The basic idea of `visreg` is that you fit some type of model, then pass that model to visreg to be plotted:


```r
fit <- lm(Ozone ~ Solar.R + Wind + Temp, data=airquality)
visreg(fit, "Wind")
```

![plot of chunk unnamed-chunk-3](img/unnamed-chunk-3-1.png)

The result is a plot of how the expected value of the outcome (Ozone) changes as a function of `x` (Wind), with all other variables in the model held fixed.

A `visreg` plot includes (1) the expected value (blue line) (2) a confidence interval for the expected value (gray band), and (3) partial residuals (dark gray dots).  For more technical details, [see the (hopefully soon-to-be) published article](http://myweb.uiowa.edu/pbreheny/publications/visreg.pdf).

Again, this works with any kind of model, not just linear regression models.  Here is a Cox proportional hazards model with an interaction:


```r
library(survival)
fit <- coxph(Surv(time, status!=0) ~ bili*hepato, data=pbc)
visreg(fit, "bili", "hepato", ylab="log(Hazard ratio)", gg=TRUE)
```

![plot of chunk unnamed-chunk-4](img/unnamed-chunk-4-1.png)

In this plot, we see how the hazard changes as a function of bilirubin levels for patients with/without an enlarged liver.  For more on this type of plot, see [Cross-sectional plots](cross-section).  For more on using `visreg` with `ggplot2`, see [Visreg and ggplot2](gg.html).

# Extended documentation and examples

## Basic framework

* [Getting started](basic.html)
* [Conditional vs. contrast plots](conditional-contrast.html)
* [Transformations](transformations.html)
* [Conditioning](conditioning.html)
* [Plot options](options.html)
* [Visreg and ggplot2](gg.html)

## Models with interactions

* [Cross-sectional plots](cross-section)
* [Surface plots](surface)

## More on specific model classes

* [GLMs](glm)
* [Random forests, support vector machines, and other "black box" methods](blackbox)
* [Mixed models](random-effect)