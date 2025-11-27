#!/bin/bash
set -e
OUT_DIR=/opt/backups/pritunl
mkdir -p "$OUT_DIR"
OUT="$OUT_DIR/pritunl-$(date +%F-%H%M).tar"
pritunl export-config "$OUT"
find "$OUT_DIR" -type f -mtime +7 -delete
