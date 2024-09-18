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
      python3-venv \
      git \
      make \
      binutils-dev \
      pkg-config \
  && apt-get clean

RUN useradd -m goran \
  && yes password | passwd goran

RUN usermod -a -G sudo goran
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN usermod -s /bin/bash goran

RUN python3 -m venv /pyvenv
RUN /pyvenv/bin/./pip3 install conan

COPY /.devcontainer/conanfile.txt /build/conanfile.txt
WORKDIR /build
RUN /pyvenv/bin/./conan install . -of /conan_generators --build=missing