statTableUI <- function(id) {
  column(
    width = 9,
    DTOutput(NS(id, "stats"))
  )
}

statTableServer <- function(dists) {
  dists <- reactiveValuesToList(dists)
  print(dists)
}