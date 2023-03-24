statTableUI <- function(id) {
    DTOutput(NS(id, "stats"))

}

statTableServer <- function() {
  distributions |>
    reactiveValuesToList() |>
    compact() |>
    map(.statTableFromList) |>
    list_rbind() |>
    datatable(rownames = F,
              options = list(
                pageLength = 5,
                searching = F,
                lengthChange = F
              ))
}

.statTableFromList <- function(dsc) {
  tibble(Distribution = dsc()$strprint(),
                         `E(X)` = dsc()$mean(),
                         `D(X)` = dsc()$variance(),
                         Skewness = dsc()$skewness(),
                         Kurtosis = dsc()$kurtosis(F),
                         Excess = dsc()$kurtosis(T)) |>
    mutate(across(
      .cols = where(is.numeric),
      .fns = ~ round(.x, 2)
    ))
}