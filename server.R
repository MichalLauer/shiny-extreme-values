server <- function(input, output, session) {

  print("---")
  distributions <<- reactiveValues()
  # Distributions
  normalServer("distNormal")
  exponentialServer("distExponential")
  # Distributions table
  output$dist_stats <- renderDT({
    datatable(mtcars)
  })

}