
library(magrittr)
source(here::here("helper_funcs.R"))

tips <- c(
  skills = "excitement >> skills",
  fail = "be ready to fail",
  csvs = "meet your data where it lives",
  package = "write youR own package",
  git = "git is your (very fickle) friend",
  invisible = "start invisibly",
  tf = "don't start with TensorFlow"
)

knitr::knit_expand(file = here::here("pres_skell.Rmd"), tips = tips) %>%
  writeLines(here::here("pres.Rmd"))

rmarkdown::render(here::here("pres.Rmd"), output_file = "index.html")
