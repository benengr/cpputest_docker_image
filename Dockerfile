FROM ubuntu:18.04

# Add git so we can checkout cpputest
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libtool

RUN apt-get install -y autoconf automake

# Checkout the cpputest source
WORKDIR /tmp
RUN git clone --branch v4.0 https://github.com/cpputest/cpputest.git

WORKDIR cpputest
RUN ls cpputest_build
RUN autoreconf . -i
RUN ./configure
RUN make
RUN make install

ENV CPPUTEST_HOME /usr/local

RUN mkdir -p /projects