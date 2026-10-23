# Game downloads

nginx container serving release binaries (IPA/APK/PCK) for MergeDefense.
Files live in the volume /data/files. Upload: `PUT /<name>` with header `X-Upload-Token`.
The token is the environment variable `UPLOAD_TOKEN` (never committed).
