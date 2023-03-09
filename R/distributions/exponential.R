exponentialUI <- function(id) {
  tabItem(
    "dist-exponential",
    plotsUI(id),
    fluidRow(
      column(
        width = 3,
        verticalLayout(
          box(
            width = 12, status = "success", class = "dist-parameters",
            numericInput(NS(id, "rate"), "rate", 1, width = "100px")
          ),
          column(
            width = 11, offset = 1,
            checkboxInput(NS(id, "check"), "Add to table")
          )
        )
      ),
      statTableUI(id)
    )
  )
}

exponentialServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # Define distribution
      dist <- reactive(Exponential$new(rate = input$rate))
      # Update plots based on user input
      output$pdf <- renderPlotly(plotsPdfServer(dist()))
      output$cdf <- renderPlotly(plotsCdfServer(dist()))

      # Compare table
      observeEvent(input$check, {
        distributions$exponential <- if (input$check) dist
      }, ignoreInit = T)
      output$stats <- renderDT(statTableServer())
    }
  )
}