library(magrittr)

tips <- c(
  skills = "excitement >> skills",
  fail = "be ready to fail",
  csvs = "meet your data where it lives",
  package = "team writes a package",
  git = "git: takes time, worth it.",
  markdown = "use Rmarkdown",
  invisible = "don't start with TensorFlow"
)

knitr::knit_expand(file = here::here("pres_skell.Rmd"), tips = tips) %>%
  writeLines(here::here("pres.Rmd"))

# rmarkdown::render(here::here("pres.Rmd"), output_file = "index.html")
