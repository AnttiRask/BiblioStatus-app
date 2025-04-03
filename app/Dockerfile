FROM rocker/shiny:4.3.1

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

WORKDIR /srv/shiny-server/

# Copy renv setup
COPY renv.lock ./renv.lock
COPY renv/ ./renv/

# Install packages
RUN Rscript -e "install.packages('renv'); renv::restore()"

# Copy app files
COPY . .

EXPOSE 3838

CMD ["/usr/bin/shiny-server"]