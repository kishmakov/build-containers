FROM ubuntu:24.04

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
    htop \
    libasound2-dev \
    libdbus-1-dev \
    libgtk-3-dev \
    libnotify-dev \
    libcap-dev \
    libcups2-dev \
    libxtst-dev \
    libxss1 \
    libnss3-dev \
    lsof \
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

# address "Too many open files"
RUN echo "*           hard    nofile      1000000" >> /etc/security/limits.conf && \
    echo "*           soft    nofile      1000000" >> /etc/security/limits.conf && \
    echo "root        hard    nofile      1000000" >> /etc/security/limits.conf && \
    echo "root        soft    nofile      1000000" >> /etc/security/limits.conf

RUN echo "DefaultLimitNOFILE=1000000" >> /etc/systemd/system.conf


# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -m kirill

WORKDIR /src
WORKDIR /build

# Add supervisor configuration file
# COPY --chown=kirill:kirill supervisord.conf /etc/supervisor/conf.d/supervisord.conf

USER kirill

# Add /src/depot_tools to the PATH
ENV PATH="/src/depot_tools:${PATH}"

# Set the default command to run supervisor
# CMD ["/usr/bin/supervisord"]
CMD ["tail", "-f", "/dev/null"]