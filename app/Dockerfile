# Use a base Shiny image
FROM rocker/shiny:4.3.1

# Install system libraries
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libsodium-dev \
    libsqlite3-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e 'install.packages(c("dplyr", "here", "jsonlite", "leaflet", "purrr", "shiny", "shinyjs"), repos="https://cloud.r-project.org")'

# Copy app files
COPY . /srv/shiny-server/

# Expose port (Shiny listens on 3838)
EXPOSE 3838

CMD ["/usr/bin/shiny-server"]
