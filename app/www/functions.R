# Function to fetch libraries from SQLite
fetch_libraries <- function() {
  fromJSON("https://biblio-api.fly.dev/libraries")
}

# Function to fetch schedules from SQLite and determine the current open status
fetch_schedules <- function() {
  fromJSON("https://biblio-api.fly.dev/schedules")
}
