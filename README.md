
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rtemis: Machine Learning and Visualization

<!-- badges: start -->

[![Build
Status](https://travis-ci.com/egenn/rtemis.svg?branch=master)](https://travis-ci.com/egenn/rtemis)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/egenn/rtemis?branch=master&svg=true)](https://ci.appveyor.com/project/egenn/rtemis)
<!-- badges: end -->

A platform for advanced Machine Learning research and applications.  
The goal of rtemis is to make data science efficient and accessible with
no compromise on flexibility.

<div style="text-align:center">

<a href="https://rtemis.netlify.com">
<img align = "center" src="https://egenn.github.io/imgs/rtemis_logo.png">
</a>

</div>

[**Online Documentation and vignettes**](https://rtemis.netlify.com)

### Installation

See [here](https://rtemis.netlify.com/setup.html) for more setup and
installation instructions.

``` r
install.packages("remotes")
remotes::install_github("egenn/rtemis")
```

### 10-second intro to **rtemis**

Install dependencies if they are not already installed:

``` r
packages <- c("caret", "pbapply", "ranger")
.add <- !packages %in% installed.packages()
install.packages(packages[.add])
```

Load rtemis and get cross-validated random forest performance on the
iris dataset:

``` r
library(rtemis)
mod <- elevate(iris)
mod$plot()
```

### What’s new

  - **v. 0.78**: First public release, April 2019

### Features

  - **Visualization**
      - Static: ***mplot3*** family (base graphics)
      - Dynamic: ***dplot3*** family ([plotly](https://plot.ly/r/))
  - **Unsupervised Learning**
      - Clustering: ***u.\****
      - Decomposition: ***d.\****
  - **Supervised Learning**
      - Classification, Regression, Survival Analysis: ***s.\****
  - **Cross-Decomposition**
      - Sparse Canonical Correlation / Sparse Decomposition: ***x.\****
  - **Meta-Models**  
    \[Have been temporarily removed for updating\]
      - Model Stacking: ***metaMod()***
      - Modality Stacking: ***metaFeat()***
      - Group-weighted Stacking: ***metaGroup()***

### Ongoing work

  - Novel algorithms developed in **rtemis** will generally be added to
    this public repository as soon as the corresponding papers or
    preprints are published.

  - R Documentation is ongoing and should be completed
    soon.

  - ## **rtemis** is under active development with many enhancements and extensions in the works
    
    <img align = "center" src="https://egenn.github.io/imgs/rtemis_vis_collage.png">
    <img align = "center" src="https://egenn.github.io/imgs/iris_CART.png">
    <br>

-----

<img align = "center" src="https://rtemis.netlify.com/rtemis_hex_trans.png" width="205">

2019 Efstathios D. Gennatas
