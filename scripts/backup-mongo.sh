#!/bin/bash
set -e

OUT_DIR=/opt/backups/mongo
mkdir -p "$OUT_DIR"
OUT="$OUT_DIR/mongo-$(date +%F-%H%M).gz"

/usr/bin/mongodump --archive="$OUT" --gzip

find "$OUT_DIR" -type f -mtime +7 -delete
