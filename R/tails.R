tailsSidebar <- function() {
  menuItem("Tails", tabName = "tails", icon = icon("weight-hanging"))
}

tailsUI <- function(id) {
  tabItem(
    "tails",
    fluidRow(
      p("testíkos")
    )
  )
}