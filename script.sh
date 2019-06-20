#!/bin/sh

echo "this is outer container"
echo $SOURCE_PATH
ls $SOURCE_PATH
echo "this is inner container"
docker run \
  --mount type=bind,source=$SOURCE_PATH,destination=/root \
  --entrypoint "/bin/ls" \
  --tty \
  github/docker-cli:master \
  /root
