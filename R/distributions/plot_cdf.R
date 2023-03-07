#' Plots a Cumulative density function (PDF) using a specified Distr6 object
#'
#' @param dst [Distr6] Specified distribution
#' @param xmin Minimum for the x axis
#' @param xmax Maximum for the x axis
#'
#' @return a ggplot2 object
plot_cdf <- function(dst) {
  g <-
    tibble(x = seq(dst$quantile(1 - 0.999), dst$quantile(0.999), by = 0.01),
           y = dst$cdf(x)) |>
    ggplot(aes(x = x, y = y)) +
    geom_line() +
    theme_bw() +
    coord_cartesian(xlim = c(dst$quantile(1 - 0.99), dst$quantile(0.99))) +
    labs(title = "_")

  ggplotly(g) |>
    layout(title = list(text = paste0('Cummulative density function',
                                      '<br>',
                                      '<sup>',
                                      dst$strprint(),
                                      '</sup>')),
           xaxis = list(title = "x"),
           yaxis = list(title = "P(x)"))
}