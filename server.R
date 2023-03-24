server <- function(input, output, session) {

  cat("\f")
  print("---")
  distributions <<- reactiveValues()
  # Distributions
  normalServer("distNormal")
  exponentialServer("distExponential")
  # Tails
  heavyTailsServer("tailsHeavy")
}