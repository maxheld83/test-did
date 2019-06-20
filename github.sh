#!/bin/sh

# this script replicates what github actions should do
docker build -t did .
echo "works"
docker run \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --env SOURCE_PATH="/usr/local" \
  did

echo "fails"
docker run \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --env SOURCE_PATH="/github/workspace" \
  did
