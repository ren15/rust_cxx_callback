FROM rust:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt-get update && apt-get install -y \
        cmake \
        g++ \
        make

COPY . /app

WORKDIR /app
