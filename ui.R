allDistributionsModule <- function() {
  menuItem("Distributions",
           tabName = "distribution", icon = icon("wave-square"),
           menuSubItem("Normal distribution", tabName = "dist-normal"),
           menuSubItem("Exponential distribution", tabName = "dist-exponential")
  )
}

normalModule <- function() {
  tabItem(
    "dist-normal",
    fluidRow(
      column(
        width = 12,
        box(
          width = 6, status = "warning",
          plotlyOutput("normal_pdf")
        ),
        box(
          width = 6, status = "primary",
          plotlyOutput("normal_cdf")
        )
      )
    ),
    fluidRow(
      column(
        width = 3,
        verticalLayout(
          box(
            width = 12, status = "success", class = "dist-parameters",
            numericInput("dist_normal_mu", "Mu", 0, width = "100px"),
            numericInput("dist_normal_sigma2", "sigma2", 1, width = "100px")
          ),
          column(
            width = 11, offset = 1,
            checkboxInput("dist_normal_check", "Add to table")
          )
        )
      ),
      column(
        width = 9,
        DTOutput("dist_stats")
      )
    )
  )
}

exponentialModule <- function() {
  tabItem("dist-exponential", fluidRow(
    column(
      2,
      numericInput("dist_exponential_rate", "rate", 1),
    ),
    column(12,
           box(
             status = "primary",
             plotlyOutput("exponential_pdf")
           ),
           box(
             status = "primary",
             plotlyOutput("exponential_cdf")
           )
    )
  ))
}

ui <- dashboardPage(
  dashboardHeader(title = "My Dashboard", disable = T),
  dashboardSidebar(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "css/style.css")
    ),
    sidebarMenu(
      allDistributionsModule()
    )
  ),
  dashboardBody(
    tabItems(
      normalModule(),
      exponentialModule()
    )
  )
)
