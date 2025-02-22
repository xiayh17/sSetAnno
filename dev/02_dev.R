# Building a Prod-Ready, Robust Shiny Application.
#
# README: each step of the dev files is optional, and you don't have to
# fill every dev scripts before getting started.
# 01_start.R should be filled at start.
# 02_dev.R should be used to keep track of your development during the project.
# 03_deploy.R should be used once you need to deploy your app.
#
#
###################################
#### CURRENT FILE: DEV SCRIPT #####
###################################

# Engineering

## Dependencies ----
## Add one line by package you want to add as dependency
usethis::use_package( "thinkr" )
usethis::use_package( "FactoMineR" )
usethis::use_package( "factoextra" )
usethis::use_package( "ggplot2" )
usethis::use_package( "pheatmap" )
usethis::use_package( "stats" )
usethis::use_package( "ggpubr" )
usethis::use_package( "shinycustomloader" )
usethis::use_package( "shinyWidgets" )
usethis::use_package( "DT" )
usethis::use_package( "vroom" )
usethis::use_package( "limma" )
usethis::use_package( "plotly" )
usethis::use_package( "shinyjs" )
usethis::use_package( "dplyr" )
usethis::use_package( "tools" )
usethis::use_package( "magrittr" )
usethis::use_package( "thematic" )
usethis::use_package( "RVA")
usethis::use_package( "ggiraph")
usethis::use_package( "EnhancedVolcano" )
usethis::use_package( "cluster" )

usethis::use_package( "rWikiPathways" )
usethis::use_package( "GSVAdata" )

usethis::use_dev_package( "bs4Dash", remote = "RinteRface/bs4Dash" )
usethis::use_dev_package( "ComplexHeatmap", remote = "jokergoo/ComplexHeatmap" )
usethis::use_dev_package( "golem", remote = "Thinkr-open/golem" )
# usethis::use_package( "" )
# usethis::use_package( "" )
## Add modules ----
## Create a module infrastructure in R/
golem::add_module( name = "upload" ) # Name of the module
golem::add_module( name = "qc" ) # Name of the module
golem::add_module( name = "qc_pca" )
golem::add_module( name = "qc_heat1000" )
golem::add_module( name = "qc_heatcor" )
golem::add_module( name = "deg" ) # Name of the module
golem::add_module( name = "deg_matrix" )
golem::add_module( name = "deg_wheretocut" )
golem::add_module( name = "deg_volcanol" )
golem::add_module( name = "deg_ma" )
golem::add_module( name = "deg_heat" )
golem::add_module( name = "gsaanno" ) # Name of the module
golem::add_module( name = "gsea" ) # Name of the module
golem::add_module( name = "report" ) # Name of the module
## Add helper functions ----
usethis::use_pipe()
## Creates ftc_* and utils_*
golem::add_fct( "helpers" )
golem::add_utils( "helpers" )

## External resources
## Creates .js and .css files at inst/app/www
golem::add_js_file( "script" )
golem::add_js_handler( "handlers" )
golem::add_css_file( "custom" )

## Add internal datasets ----
## If you have data in your package
usethis::use_data_raw( name = "my_dataset", open = FALSE )

## Tests ----
## Add one line by test you want to create
usethis::use_test( "app" )

# Documentation

## Vignette ----
usethis::use_vignette("eSetAnno")
devtools::build_vignettes()

## Code Coverage----
## Set the code coverage service ("codecov" or "coveralls")
usethis::use_coverage()

# Create a summary readme for the testthat subdirectory
covrpage::covrpage()

## CI ----
## Use this part of the script if you need to set up a CI
## service for your application
##
## (You'll need GitHub there)
usethis::use_github()

# GitHub Actions
usethis::use_github_action()
# Chose one of the three
# See https://usethis.r-lib.org/reference/use_github_action.html
usethis::use_github_action_check_release()
usethis::use_github_action_check_standard()
usethis::use_github_action_check_full()
# Add action for PR
usethis::use_github_action_pr_commands()

# Travis CI
usethis::use_travis()
usethis::use_travis_badge()

# AppVeyor
usethis::use_appveyor()
usethis::use_appveyor_badge()

# Circle CI
usethis::use_circleci()
usethis::use_circleci_badge()

# Jenkins
usethis::use_jenkins()

# GitLab CI
usethis::use_gitlab_ci()

# You're now set! ----
# go to dev/03_deploy.R
rstudioapi::navigateToFile("dev/03_deploy.R")

