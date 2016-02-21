#!/bin/bash

sudo mkdir -p /data/.ivy2
sudo docker build -t paulvelzeboer/build-service-tests docker/tests/.
sudo docker push paulvelzeboer/build-service-tests

# Specification Tests
sudo docker run -t --rm \
  -v $PWD:/source \
  -v /data/.ivy2:/root/.ivy2/cache \
  paulvelzeboer/build-service-tests

# Integration Tests
sudo docker run -t --rm \
  -v $PWD:/source \
  -v /data/.ivy2:/root/.ivy2/cache \
  -e TEST_TYPE=integ \
  -e DOMAIN=http://172.17.42.1:8080 \
  paulvelzeboer/build-service-tests
