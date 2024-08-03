# https://soroban.stellar.org/docs/reference/releases

# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt install -y curl

# Install Rust toolchain and output to shell file
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rust_install.sh

RUN sh rust_install.sh -y
RUN echo $PATH
# Set environment variable for the PATH to include Cargo's bin directory
ENV PATH="$PATH:/root/.cargo/bin"

# Run Rustup target
RUN rustup target add wasm32-unknown-unknown

RUN apt install -y build-essential

# WORKDIR /
RUN mkdir /workspace
WORKDIR /workspace
ENV IS_USING_DOCKER=true