#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "appworkshop/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "appworkshop/meteord:node-${NODE_VERSION}-base" appworkshop/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "appworkshop/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "appworkshop/meteord:node-${NODE_VERSION}-onbuild" appworkshop/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "appworkshop/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "appworkshop/meteord:node-${NODE_VERSION}-devbuild" appworkshop/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "appworkshop/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "appworkshop/meteord:node-${NODE_VERSION}-binbuild" appworkshop/meteord:binbuild
