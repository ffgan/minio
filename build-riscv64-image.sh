#!/bin/bash
make crosscompile

export name=$(date +%Y-%m-%d)

export TAG="minio/minio:$name-riscv64"
echo "Building minio docker image for riscv64"
docker build --no-cache --platform linux/riscv64 -t $TAG . -f Dockerfile.riscv64

docker save docker.io/minio/minio:$name-riscv64 > minio-$name-riscv64.tar