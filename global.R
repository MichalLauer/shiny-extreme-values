library(shiny)
library(shinydashboard)
library(distr6)
library(plotly)
library(ggplot2)
library(dplyr)
library(DT)
library(purrr, include.only = "compact")

plot_pdf <- function(dst, xmin, xmax) {
  g <-
    tibble(x = seq(xmin, xmax, by = 0.01),
           y = dst$pdf(x)) |>
    ggplot(aes(x = x, y = y)) +
    geom_line() +
    theme_bw() +
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

plot_cdf <- function(dst, xmin, xmax) {
  g <-
    tibble(x = seq(xmin, xmax, by = 0.01),
           y = dst$cdf(x)) |>
    ggplot(aes(x = x, y = y)) +
    geom_line() +
    theme_bw() +
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

create_dist_tibble <- function(dist = NULL) {
  tibble(
    Distribution = dist()$strprint()
  )
}