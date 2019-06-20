#!/bin/sh

echo $SOURCE_PATH
ls -a $SOURCE_PATH
docker run \
  --mount type=bind,source=$SOURCE_PATH,destination=/github/workspace \
  github/docker-cli:master
