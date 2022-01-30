# Dockerfile for containerized development

# Base-layer
ARG CUDA_VERSION=11.3.0
ARG CUDNN_VERSION=8
ARG UBUNTU_VERSION=20.04

FROM nvidia/cuda:${CUDA_VERSION}-cudnn${CUDNN_VERSION}-devel-ubuntu${UBUNTU_VERSION}

# Install the necessary packages
ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN --mount=type=cache,id=apt-dev,target=/var/cache/apt \
    apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        ccache \
        cmake \
        curl \
        wget \
        libjpeg-dev \      
        libpng-dev \
    && rm -rf /var/lib/apt/lists/*
RUN /usr/sbin/update-ccache-symlinks
RUN mkdir /opt/ccache && ccache --set-config=cache_dir=/opt/ccache

ENV PATH /opt/conda/bin:$PATH

# RUN useradd -mr lento
# USER lento
# WORKDIR /home/lento

RUN curl -fsSL -v -o ~/miniconda.sh -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -ya

## NCCL configuration
#RUN echo NCCL_DEBUG=INFO >> /etc/nccl.conf && \
#    echo NCCL_IB_HCA=ipogif0 >> /etc/nccl.conf && \
#    echo NCCL_IB_CUDA_SUPPORT=1 >> /etc/nccl.conf
