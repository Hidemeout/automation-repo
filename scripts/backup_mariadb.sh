#!/bin/bash
set -e
OUT_DIR=/opt/backups/mariadb
mkdir -p "$OUT_DIR"
OUT="$OUT_DIR/mariadb-$(date +%F-%H%M).sql.gz"
mysqldump --all-databases | gzip > "$OUT"
find "$OUT_DIR" -type f -mtime +7 -delete
