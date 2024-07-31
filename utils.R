# utils.R script
#
# v0.4 - 2024-07-31 - create public repository in my personal profile
#
# script for several utilitaries functions
#

# create environment to objetcts to be changed inside functions
my_env <- new.env()
my_env$last_log <- unclass(Sys.time())

# check dependency
# if callig from shinyapp, readr must be loaded before
if (!('readr' %in% (.packages()))) {
  library(readr)
}

# lista de dias uteis utilizada em funções para manipulação de datas
# utiliza url para compatibilidade com shinyapp
work_days <- read_lines('https://drive.google.com/uc?export=download&id=13oJo2oH9D1kUipHlW34fbWmwE2O-pKsv', skip = 1)

# FUNCTIONS

log_message <- function(x) {
  
  # simple log messages to montitor script execution
  # it outputs "message... seconds since last log"
  
  message(paste0(round(unclass(Sys.time()) - my_env$last_log, digits = 3), "s\n", x, "... "), appendLF = FALSE)
  my_env$last_log <- unclass(Sys.time())
  
}

last_work_day <- function(day = Sys.Date()) {
  
  # retorna o ultimo dia util a partir de uma data
  # se omitir argumento day, considera Sys.Date

  work_days[max(which(work_days < day))]
  
}

next_work_day <- function(day = Sys.Date()) {
  
  # retorna o proximo dia util a partir de uma data
  # se omitir argumento day, considera Sys.Date
  
  work_days[max(which(work_days < day)) + 1]
  
}


get_quarters <- function(x) {
  
  # gets a vector formated as AAAA/M or AAAA/MM and returns a same legth vector formatted as nQAA
  # call example: df$quarter <- get_quarters(df$period)
  
  if (!('dplyr' %in% (.packages()))) {
    library(dplyr)
  }
  
  if (!('stringr' %in% (.packages()))) {
    library(stringr)
  }
  
  x <- as.data.frame(x) %>% rename(period = x) %>%
    mutate(quarter = case_when(
      as.integer(str_extract(period, '\\d+$')) %in% c(1, 2, 3) ~ paste0('1Q', substr(period, 3, 4)),
      as.integer(str_extract(period, '\\d+$')) %in% c(4, 5, 6) ~ paste0('2Q', substr(period, 3, 4)),
      as.integer(str_extract(period, '\\d+$')) %in% c(7, 8, 9) ~ paste0('3Q', substr(period, 3, 4)),
      as.integer(str_extract(period, '\\d+$')) %in% c(10, 11, 12) ~ paste0('4Q', substr(period, 3, 4))
    ))
  x$quarter
}

substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}

som <- function(x = Sys.Date()) {
  # Start of Month function
  as.Date(format(x, "%Y-%m-01"))
}

eom <- function(x = Sys.Date()) {
  # End of month function
  som(som(x) + 35) - 1
}

sowm <- function(day = Sys.Date()) {
  
  # Start Of Working Month
  # retorna o primeiro dia util do mês a partir de uma data
  # se omitir argumento day, considera Sys.Date

  work_days[min(which(work_days >= som(day)))]
}
  
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
