ui <- dashboardPage(
  dashboardHeader(title = "My Dashboard", disable = T),
  dashboardSidebar(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")
    ),
    sidebarMenu(
      distributionsSidebar(),
      tailsSidebar()
    )
  ),
  dashboardBody(
    tabItems(
      normalUI("distNormal"),
      exponentialUI("distExponential"),
      heavyTailsUI("tailsHeavy")
    )
  )
)
