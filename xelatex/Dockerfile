From ubuntu:20.04

# Install the necessary packages
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    make \
    texlive \
    texlive-base \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-lang-english \
    texlive-lang-german \
    texlive-science \
    texlive-xetex \
&& rm -rf /var/lib/apt/lists/*
