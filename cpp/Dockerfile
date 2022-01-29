# Dockerfile for containerized development
From ubuntu:20.04

# Install the necessary packages
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install necessary packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    libfmt-dev \
    curl \
    pandoc \
    valgrind \
    && rm -rf /var/lib/apt/lists/*

# App default user
RUN useradd -mr lento

USER lento

# Change working directory
WORKDIR /home/lento
