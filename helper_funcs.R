# Helper Functions
bar_plot <- function(df, ylab) {
  df %>%
    ggplot(aes(x = x, y = dat)) +
    geom_bar(stat = "identity") +
    geom_label(aes(label = lab, y = 0.5), family = "Cabin-Regular") +
    scale_y_continuous(labels = scales::percent) +
    ylab(ylab) +
    ggthemes::theme_few() +
    theme(axis.text.x = element_blank(),
          axis.title.x = element_blank(),
          axis.ticks.x = element_blank(),
          text = element_text(family = "Cabin-Regular"))
}

make_bar_dat <- function(y, labs) {
  tibble(x = seq(length(y)),
         dat = y,
         lab = labs  %>%
           stringr::str_wrap(20))
}
