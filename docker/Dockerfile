FROM ubuntu:xenial
MAINTAINER Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>

RUN apt-get update && apt-get install -y \
    build-essential \
    bzip2 \
    libbz2-dev \
    liblzma-dev\
    wget \
    zlib1g-dev 

# Below for v1.17
#RUN wget https://github.com/samtools/bcftools/releases/download/1.17/bcftools-1.17.tar.bz2 \
#    && bunzip2 bcftools-1.17.tar.bz2 \
#    && tar -xf bcftools-1.17.tar \
#    && cd bcftools-1.17 \

RUN wget https://github.com/samtools/bcftools/releases/download/1.10.2/bcftools-1.10.2.tar.bz2 \
    && bunzip2 bcftools-1.10.2.tar.bz2 \
    && tar -xf bcftools-1.10.2.tar \
    && cd bcftools-1.10.2 \
    && ./configure \
    && make \
    && make install

# installs in /usr/local/bin/bcftools


COPY docker/vimrc /root/.vimrc
COPY . /opt/bcftools

WORKDIR /opt/bcftools
