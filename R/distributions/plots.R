plotsUI <- function(id) {
  fluidRow(
      box(
        width = 6, status = "warning",
        plotlyOutput(NS(id, "pdf"))
      ),
      box(
        width = 6, status = "primary",
        plotlyOutput(NS(id, "cdf"))
      )
  )
}

# Probability DF
plotsPdfServer <- function(dist) {
    g <-
      tibble(
        x = seq(dist$quantile(1 - 0.999), dist$quantile(0.999), by = 0.01),
        y = dist$pdf(x)
      ) |>
      ggplot(aes(x = x, y = y)) +
      geom_line() +
      theme_bw() +
      coord_cartesian(xlim = c(dist$quantile(1 - 0.99), dist$quantile(0.99))) +
      # coord_cartesian(xlim = c(-3, 3)) +
      labs(title = "_")

    ggplotly(g) |>
      layout(
        title = list(text = paste0(
          "Probability density function",
          "<br>",
          "<sup>",
          dist$strprint(),
          "</sup>"
        )),
        xaxis = list(title = "x"),
        yaxis = list(title = "density")
      )
}

# Cumulative DF
plotsCdfServer <- function(dist) {
    g <-
      tibble(
        x = seq(dist$quantile(1 - 0.999), dist$quantile(0.999), by = 0.01),
        y = dist$cdf(x)
      ) |>
      ggplot(aes(x = x, y = y)) +
      geom_line() +
      theme_bw() +
      coord_cartesian(xlim = c(dist$quantile(1 - 0.99), dist$quantile(0.99))) +
      labs(title = "_")

    ggplotly(g) |>
      layout(
        title = list(text = paste0(
          "Cummulative density function",
          "<br>",
          "<sup>",
          dist$strprint(),
          "</sup>"
        )),
        xaxis = list(title = "x"),
        yaxis = list(title = "P(x)")
      )
}