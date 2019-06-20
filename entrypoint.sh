#!/bin/sh

echo "this is the outer container"
mkdir -p $SOURCE_PATH
echo $SOURCE_PATH
ls $SOURCE_PATH
echo "this is the inner container"
docker run \
  --mount type=bind,source=$SOURCE_PATH,destination=/root \
  --entrypoint "/bin/ls" \
  --tty \
  github/docker-cli:master \
  /root
