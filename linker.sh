#!/bin/sh

# Variables need to define
#
# CONTAINER_NAMESPACE

SYMLINK_BASE_PATH=/var/log/containers

curl -s --unix-socket /var/run/docker.sock http::/containers/json | jq '.[] | .Id + " " + .Names[0]' | while read id name;
do
  name=${name#?}
  name=${name%?}
  CONTAINER_SHORT_ID=$(echo ${id#?} | cut -c1-12)
  SYMLINK_LOG_PATH=${SYMLINK_BASE_PATH}/${CONTAINER_NAMESPACE}_${name}_${CONTAINER_SHORT_ID}.log

  [ ! -f ${SYMLINK_LOG_PATH} ] && ln -sf /var/lib/docker/containers/${id#?}/${id#?}-json.log ${SYMLINK_LOG_PATH}

done

# clean up broken symlinks
find -L $SYMLINK_BASE_PATH -type l -delete
