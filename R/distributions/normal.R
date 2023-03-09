normalUI <- function(id) {
  tabItem(
    "dist-normal",
    plotsUI(id),
    fluidRow(
      column(
        width = 3,
        verticalLayout(
          box(
            width = 12, status = "success", class = "dist-parameters",
            numericInput(NS(id, "mu"), "Mu", 0, width = "100px"),
            numericInput(NS(id, "sigma2"), "sigma2", 1, width = "100px")
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

normalServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # Define distribution
      dist <- reactive(Normal$new(mean = input$mu, var = input$sigma2))
      # Update plots based on user input
      output$pdf <- renderPlotly(plotsPdfServer(dist()))
      output$cdf <- renderPlotly(plotsCdfServer(dist()))
      # Update the comparison list
      observeEvent(input$check, {
        distributions$normal <- if (input$check) dist
      }, ignoreInit = T)
      output$stats <- renderDT(statTableServer())
    }
  )
}