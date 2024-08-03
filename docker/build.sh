#!/bin/bash

# Build image and tag it with image name and version
docker build . \
    --tag stellar/quickstart:v439-testing \
    --force-rm \
    --rm