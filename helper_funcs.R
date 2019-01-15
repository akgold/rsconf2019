# Helper Functions
bar_plot <- function(df, ylab) {
  df %>%
    ggplot(aes(x = x, y = dat, group = x)) +
    geom_bar(stat = "identity") +
    geom_label(aes(label = lab, y = 0.5), family = text_fam) +
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

make_bar_dat <- function(y, labs) {
  tibble(x = seq(length(y)),
         dat = y,
         lab = labs  %>%
           stringr::str_wrap(20))
}

text_fam <- "Cabin-Regular"

extend_end_state <- function(df, n = 5, dur_var = dur, ...) {
  df %>%
    mutate(dur = c(rep(1, nrow(df) - 1), n)) %>%
    uncount(dur) %>%
    mutate(time = row_number())
}

# ggplot(mtcars, aes(factor(cyl), mpg)) +
#   geom_boxplot() +
#   # Here comes the gganimate code
#   transition_states(
#     gear,
#     transition_length = 2,
#     state_length = 1
#   ) +
#   enter_fade() +
#   exit_shrink() +
#   ease_aes('sine-in-out')
