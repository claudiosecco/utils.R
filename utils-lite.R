# utils-lite.R script
#
# carrega apenas as funções que estão sendo utilizadas
#
parse_parentheses_as_negative <- function(x, comma_as_decimal_mark = FALSE) {
  # Replace parentheses with negative sign
  x <- gsub("\\(([^)]+)\\)", "-\\1", x)

  if (comma_as_decimal_mark) {
    x <- gsub("\\.", "", x)
    x <- gsub(",", ".", x)
  }

  # Convert the resulting string to numeric
  as.numeric(x)
}
