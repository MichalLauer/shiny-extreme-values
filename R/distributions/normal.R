normalUI <- function(id) {
  tabItem(
    "dist-normal",
    fluidRow(
      column(
        width = 12,
        box(
          width = 6, status = "warning",
          plotlyOutput(NS(id, "normal_pdf"))
        ),
        box(
          width = 6, status = "primary",
          plotlyOutput(NS(id, "normal_cdf"))
        )
      )
    ),
    fluidRow(
      column(
        width = 3,
        verticalLayout(
          box(
            width = 12, status = "success", class = "dist-parameters",
            numericInput(NS(id, "normal_mu"), "Mu", 0, width = "100px"),
            numericInput(NS(id, "normal_sigma2"), "sigma2", 1, width = "100px")
          ),
          column(
            width = 11, offset = 1,
            checkboxInput(NS(id, "normal_check"), "Add to table")
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

normalServer <- function(id) {
  moduleServer(
    id,
    function(input, output, session) {
      # Distribution
      normal <<- reactive(Normal$new(mean = input$normal_mu,
                                     var = input$normal_sigma2))
      # Probability DF
      output$normal_pdf <- renderPlotly(plot_pdf(normal()))
      # Cumulative DF
      output$normal_cdf <- renderPlotly(plot_cdf(normal()))
    #   # Compare table
    #   observeEvent(input$normal_check, {
    #     if (input$normal_check) {
    #       distributions$normal <- normal
    #     } else {
    #       distributions$normal <- NULL
    #     }
    #   }, ignoreInit = T)
    }
    )
}