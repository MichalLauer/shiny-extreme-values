tailsSidebar <- function() {
  menuItem("Tails", tabName = "tails", icon = icon("weight-hanging"),
           menuSubItem("Heavy tails", tabName = "tails-heavy"),
           menuSubItem("Long tails", tabName = "tails-long"),
           menuSubItem("Sub exponential tails", tabName = "tails-subexpo"),
           menuSubItem("Fat tails", tabName = "tails-fat"))
}