#' Plots a Probability density function (PDF) using a specified Distr6 object
#'
#' @param dst [Distr6] Specified distribution
#' @param xmin Minimum for the x axis
#' @param xmax Maximum for the x axis
#'
#' @return a plotly object
plot_pdf <- function(dst) {
  g <-
    tibble(x = seq(dst$quantile(1 - 0.999), dst$quantile(0.999), by = 0.01),
           y = dst$pdf(x)) |>
    ggplot(aes(x = x, y = y)) +
    geom_line() +
    theme_bw() +
    coord_cartesian(xlim = c(dst$quantile(1 - 0.99), dst$quantile(0.99))) +
    labs(title = "_")

  ggplotly(g) |>
    layout(title = list(text = paste0('Probability density function',
                                      '<br>',
                                      '<sup>',
                                      dst$strprint(),
                                      '</sup>')),
           xaxis = list(title = "x"),
           yaxis = list(title = "density"))
}