#!/bin/sh
# Runs as root before nginx starts: refuse weak tokens, prepare the persistent volume.
set -e
if [ "${#UPLOAD_TOKEN}" -lt 32 ]; then
  echo "UPLOAD_TOKEN missing or shorter than 32 characters - refusing to start" >&2
  exit 1
fi
mkdir -p /data/files/.tmp
chown -R nginx:nginx /data/files
