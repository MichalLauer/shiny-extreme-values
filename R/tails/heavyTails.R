heavyTailsUI <- function(id) {
  tabItem(
    "tails-heavy",
    verticalLayout(
      # fluidRow(
      #   width = 12,
      #   box(
      #     width = 6, class = "tail-parameters",
      #     numericInput("n", "Sample size n", 1, width = "100px"),
      #     actionButton("resample", "Resample", width = "100px")
      #   )
      # ),
      fluidRow(
        box(
          width = 6, height = "45vh",
          plotlyOutput(NS(id, "normal"))
        ),
        box(
          width = 6, height = "45vh",
          plotlyOutput(NS(id, "student"))
        )
      ),
      fluidRow(
        box(
          width = 6, height = "45vh",
          plotlyOutput(NS(id, "gamma"))
        ),
        box(
          width = 6, height = "45vh",
          plotlyOutput(NS(id, "lognorm"))
        )
      )
    )
  )
}

heavyTailsServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      plot_survival


      output$normal <- renderPlotly(plot_ly(mtcars, x = ~ mpg))
      output$student <- renderPlotly(plot_ly(mtcars, x = ~ mpg))
      output$gamma <- renderPlotly(plot_ly(mtcars, x = ~ mpg))
      output$lognorm <- renderPlotly(plot_ly(mtcars, x = ~ mpg))
    }
  )
}

density <- "dt"
probability <- "pt"
params <- list(df = 3)
# ---
params <- list_modify(params, x = 1:5)

create_plot <- function(distribution, title) {
  tibble(
    x = seq(0, 20, by = 0.01),
    pdf = distribution$pdf(x),
    cdf = distribution$cdf(x),
    sur = 1 - cdf,
    haz = pdf / sur) |>
    ggplot(aes(x = x)) +
    geom_line(aes(y = sur, color = "Survival")) +
    geom_line(aes(y = haz, color = "Hazard")) +
    theme_bw() +
    scale_x_continuous(limits = c(0, 20), expand = c(0, 0)) +
    labs(
      title = title,
      subtitle = distribution$strprint()
    )
}

create_plot(distribution = Normal$new(),
            title = "Normal ")

create_plot(distribution = StudentT$new(2),
            title = "Student ")

create_plot(distribution = Gamma$new(3),
            title = "Gamma ")

create_plot(distribution = Lognormal$new(),
            title = "Gloglo ")
