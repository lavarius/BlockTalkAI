# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    gcc \
    g++ \
    libssl-dev \
    build-essential \
    cmake \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Install Rust toolchain
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Set environment variable for the PATH to include Cargo's bin directory
ENV PATH="/root/.cargo/bin:${PATH}"

# Run Rustup target
RUN rustup target add wasm32-unknown-unknown

# Install Stellar CLI from source
RUN cargo install --locked stellar-cli --features opt

# Configure Stellar CLI for testnet
RUN stellar network add \
    --global testnet \
    --rpc-url https://soroban-testnet.stellar.org:443 \
    --network-passphrase "Test SDF Network ; September 2015"

# Configure identity for Mark
RUN stellar keys generate --global mark --network testnet

# Change Workdir later
WORKDIR /app

CMD ["bash"]
