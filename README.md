# utils.R

This repository contains a collection of utility functions designed to assist with common tasks in R. The functions are organized within a single `utils.R` script and are intended for use in a variety of contexts, including Shiny applications and data processing tasks.

## Features

- **Date Manipulation:**
  - `last_work_day()`: Returns the last working day before a given date.
  - `next_work_day()`: Returns the next working day after a given date.
  - `som()`: Returns the start of the month for a given date.
  - `eom()`: Returns the end of the month for a given date.
  - `sowm()`: Returns the first working day of the month for a given date.

- **String Manipulation:**
  - `substrRight()`: Extracts the rightmost characters from a string.
  - `parse_parentheses_as_negative()`: Converts numbers in parentheses to negative values, with optional comma as decimal mark handling.

- **Data Transformation:**
  - `get_quarters()`: Converts a vector of dates formatted as `YYYY/M` or `YYYY/MM` to a quarterly format like `nQYY`.

- **Logging:**
  - `log_message()`: Simple logging function that tracks the time elapsed since the last log.

## Setup

### Dependencies

The script checks for and loads necessary packages automatically. The required packages are:

- `readr`
- `dplyr`
- `stringr`

### External Data

The script relies on an external list of working days, which is loaded from a Google Drive link for compatibility with Shiny applications.

## Local Usage

1. Clone the repository:

   ```sh
   git clone https://github.com/claudiosecco/utils.R.git
   ```

2. Source the `utils.R` script in your R environment:

   ```r
   source("path/to/utils.R")
   ```

3. Call the functions as needed in your R scripts or Shiny applications.

## URL Usage

You can source the script directly via Github URL

```r
utils_url <- "https://raw.githubusercontent.com/claudiosecco/utils.R/main/utils.R"
source(url(utils_url))
```

## Contribution

Feel free to fork the repository and submit pull requests. Contributions and improvements are always welcome.

## License

This project is licensed under the GPL-3.0 License. See the `LICENSE` file for details.
