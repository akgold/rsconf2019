# Helper Functions
bar_plot <- function(df, ylab) {
  df %>%
    ggplot(aes(x = x, y = dat, group = x)) +
    geom_bar(stat = "identity") +
    geom_label(aes(label = lab, y = laby), family = text_fam, alpha = 0.8) +
    scale_y_continuous(labels = scales::percent) +
    ylab(ylab) +
    theme_rs() +
    theme(axis.text.x = element_blank(),
          axis.title.x = element_blank(),
          axis.ticks.x = element_blank())
}

theme_rs <- function() {
    ggthemes::theme_few() +
    theme(text = element_text(family = text_fam))
}

make_bar_dat <- function(y, labs, laby = 0.5, wrap = 20) {
  labs <- stringr::str_wrap(labs, wrap)

  tibble(x = seq(length(y)),
         dat = y,
         lab = factor(labs, levels = labs, ordered = TRUE),
         laby = !!laby)
}

extend_end_state <- function(df, n = 5, dur_var = dur, ...) {
  df %>%
    mutate(dur = c(rep(1, nrow(df) - 1), n)) %>%
    uncount(dur) %>%
    mutate(time = row_number())
}

text_fam <- "Cabin-Regular"
colors <- c()
