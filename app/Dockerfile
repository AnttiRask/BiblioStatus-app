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
    libgdal-dev \
    gdal-bin \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /srv/shiny-server/

# Copy R project files
COPY renv.lock ./renv.lock
COPY renv/ ./renv/

# Restore packages
RUN Rscript -e "install.packages('renv'); renv::restore()"

# Copy app files
COPY . /srv/shiny-server/

# Expose port (Shiny listens on 3838)
EXPOSE 3838

CMD ["/usr/bin/shiny-server"]
