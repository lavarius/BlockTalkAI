# Use Ubuntu 22.04 as the base image
FROM alpine:3.15
# Install dependencies
RUN apk add --no-cache \
    bash \
    curl \
    gcc \
    musl-dev \
    openssl \
    rustup \
    && rustup-init -y \
    && rustup target add wasm32-unknown-unknown
# Install Rust toolchain
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
# Install Stellar CLI from source
RUN /root/.cargo/bin/cargo install --locked stellar-cli --features opt
# Configure Stellar CLI for testnet
RUN /root/.cargo/bin/stellar network add \
    --global testnet \
    --rpc-url https://soroban-testnet.stellar.org:443 \
    --network-passphrase "Test SDF Network ; September 2015"
# Configure identity for Mark
RUN /root/.cargo/bin/stellar keys generate --global mark --network testnet
WORKDIR /app
CMD ["bash"]
