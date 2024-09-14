FROM ubuntu:24.10

RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get -y install tzdata

RUN apt-get update \
  && apt-get install -y ssh \
      build-essential \
      sudo \
      gcc \
      g++ \
      gdb \
      clang \
      cmake \
      rsync \
      tar \
      mc \
      python3 \
      python3-pip \
      git \
      make \
      binutils-dev \
      pkg-config \
  && apt-get clean

RUN mkdir /build_dir

RUN pip3 install conan

RUN useradd -m goran \
  && yes password | passwd goran

RUN usermod -a -G sudo goran
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN usermod -s /bin/bash goran
