# Function to fetch libraries from the BiblioStatus API
fetch_libraries <- function() {
  fromJSON("https://biblio-api.fly.dev/libraries", simplifyDataFrame = TRUE)
}

# Function to fetch schedules from the BiblioStatus API
fetch_schedules <- function() {
  fromJSON("https://biblio-api.fly.dev/schedules", simplifyDataFrame = TRUE)
}
