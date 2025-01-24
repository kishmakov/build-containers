FROM ubuntu:20.04

# Set environment variables to avoid user interaction during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install required packages
RUN apt-get update && apt-get install -y \
    build-essential \
    bison \
    clang++-18 \
    curl \
    gcc-multilib \
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
    nodejs \
    npm \
    openjdk-8-jre \
    python3-dbusmock \
    python3.10

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

