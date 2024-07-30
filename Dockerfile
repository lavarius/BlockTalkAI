# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04


# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    bash \
    curl \
    build-base \
    gcc \
    musl-dev \
    build-essential \
    git \
    openssl \
    libssl-dev \
    python3 \
    python3-pip \
    rustup \
    && rustup-init -y \
    && rustup target add wasm32-unknown-unknown

# Install Rust and Cargo
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Install wasm32-unknown-unknown target
RUN rustup target add wasm32-unknown-unknown

# Install Stellar CLI
RUN cargo install --locked stellar-cli

# Configure Stellar CLI for testnet
RUN stellar-cli config network testnet

# Configure identity (set a placeholder identity e.g. lavarius)
RUN echo "[[lavarius]]\nname = \"lavarius\"\n" > ~/.stellar/cli/config.toml

# Define the entrypoint
ENTRYPOINT ["/bin/sh"]