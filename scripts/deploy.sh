#!/bin/bash
set -e

REPO_DIR=/opt/automation/deploy_target

if [ ! -d "$REPO_DIR" ]; then
  mkdir -p "$REPO_DIR"
  git clone https://github.com/YOUR_ORG/YOUR_APP.git "$REPO_DIR"
else
  cd "$REPO_DIR"
  git pull origin main
fi

if [ -f "$REPO_DIR/docker-compose.yml" ]; then
  cd "$REPO_DIR"
  docker compose pull || true
  docker compose down || true
  docker compose up -d --build
fi

systemctl restart pritunl || true
