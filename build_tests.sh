#!/bin/bash

mv Dockerfile Dockerfile.orig
cp Dockerfile.test Dockerfile
docker build -t paulvelzeboer/build-service-tests .
mv Dockerfile.orig Dockerfile
