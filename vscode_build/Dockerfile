FROM ubuntu:20.04

# Set environment variables to avoid user interaction during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && apt-get install -y \
    bash \
    build-essential \
    bison \
    clang++-18 \
    curl \
    gcc-multilib \
    git \
    g++-multilib \
    gperf \
    libasound2-dev \
    libdbus-1-dev \
    libgtk-3-dev \
    libnotify-dev \
    libcap-dev \
    libcups2-dev \
    libxtst-dev \
    libxss1 \
    libnss3-dev \
    mc \
    openjdk-8-jre \
    python3-dbusmock \
    python3.10 \
    tree \
    supervisor

# nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -
RUN apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt update && apt install --no-install-recommends yarn

# yarn
RUN npm i -g @electron/build-tools

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /src
WORKDIR /build

# Add supervisor configuration file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set the default command to run supervisor
CMD ["/usr/bin/supervisord"]