exponentialUI <- function(id) {
  tabItem(
    "dist-exponential",
    fluidRow(
      column(
        width = 12,
        box(
          width = 6, status = "warning",
          plotlyOutput(NS(id, "exponential_pdf"))
        ),
        box(
          width = 6, status = "primary",
          plotlyOutput(NS(id, "exponential_cdf"))
        )
      )
    ),
    fluidRow(
      column(
        width = 3,
        verticalLayout(
          box(
            width = 12, status = "success", class = "dist-parameters",
            numericInput(NS(id, "exponential_rate"), "rate", 1, width = "100px")
          ),
          column(
            width = 11, offset = 1,
            checkboxInput(NS(id, "exponential_check"), "Add to table")
          )
        )
      )
      # column(
      #   width = 9,
      #   DTOutput("dist_stats")
      # )
    )
  )
}

exponentialServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # Distribution
      exponential <<- reactive(Exponential$new(rate = input$exponential_rate))
      # Additional parameters
      min <- reactive(0)
      max <- reactive(8)
      # Probability DF
      output$exponential_pdf <- renderPlotly(plot_pdf(exponential()))
      # Cumulative DF
      output$exponential_cdf <- renderPlotly(plot_cdf(exponential()))
    }
  )
}