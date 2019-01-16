library(magrittr)

tips1 <- c(
  skills = "Excitement >> Skills",
  fail = "Failure's Coming, Get Ready",
  csvs = "You are the Data Engineer your Team Needs",
  package = "It Takes a Team to Write a Package",
  git = "Git: Sometimes the Right Thing isn't the Easiest",
  markdown = "Have you met my Friend RMarkdown?",
  invisible = "Don't Get Too Excited Just Yet"
)

tips <- sprintf("%s. %s", seq(length(tips1)), tips1)
names(tips) <- names(tips1)

knitr::knit_expand(file = here::here("pres_skell.Rmd"), tips = tips) %>%
  writeLines(here::here("pres.Rmd"))

# rmarkdown::render(here::here("pres.Rmd"), output_file = "index.html")
