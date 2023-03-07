server <- function(input, output, session) {

  print("---")
  displayList <<- reactiveValues()
  displayList$normal <- NULL

  normal <<- reactive(Normal$new(mean = input$dist_normal_mu,
                                 var = input$dist_normal_sigma2))
  exponential <<- reactive(Exponential$new(rate = input$dist_exponential_rate))

  output$normal_pdf <- renderPlotly({
    plot_pdf(normal(), normal()$mean() - 3, normal()$mean() + 3)
  })

  output$normal_cdf <- renderPlotly({
    plot_cdf(normal(), normal()$mean() - 3, normal()$mean() + 3)
  })

  observeEvent(input$dist_normal_check, {
    if (input$dist_normal_check) {
      displayList$normal <- normal
    } else {
      displayList$normal <- NULL
    }
  }, ignoreInit = T)

  output$dist_stats <- renderDataTable({
    vals <- compact(reactiveValuesToList(displayList))
    display <- create_dist_tibble()
    for (val in vals) {
      display <-
        bind_rows(display,
                  create_dist_tibble(val))
    }

    print(display)

    datatable(mtcars[1:4, ], options = list(searching = F,
                                            bLengthChange = F,
                                            paging = T,
                                            pageLength = 3))
  })

  output$exponential_pdf <- renderPlotly({
    plot_pdf(exponential(), 0, 6)
  })

  output$exponential_cdf <- renderPlotly({
    plot_cdf(exponential(), 0, 6)
  })
}