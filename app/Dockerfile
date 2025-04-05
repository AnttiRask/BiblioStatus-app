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
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /srv/shiny-server/biblio

# Copy R project files
COPY renv.lock ./renv.lock
COPY renv/ ./renv/
COPY biblio/ .

# Restore packages
RUN Rscript -e "install.packages('renv'); renv::restore()"

# Overwrite default config
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf

# Create the log directory with proper ownership
RUN mkdir -p /var/log/shiny-server && chown shiny:shiny /var/log/shiny-server

# Expose port (Shiny listens on 3838)
EXPOSE 3838
CMD ["/usr/bin/shiny-server"]
