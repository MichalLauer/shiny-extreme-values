distributionsSidebar <- function() {
  menuItem("Distributions", tabName = "dist", icon = icon("wave-square"),
           menuSubItem("Normal distribution", tabName = "dist-normal"),
           menuSubItem("Exponential distribution", tabName = "dist-exponential")
  )
}