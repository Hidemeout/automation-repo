#!/bin/bash
set -e
# Пример простого деплоя: pull + docker-compose
REPO_DIR=/opt/automation/deploy_target
if [ ! -d "$REPO_DIR" ]; then
mkdir -p "$REPO_DIR"
git clone https://github.com/YOUR_ORG/YOUR_APP.git "$REPO_DIR"
else
cd "$REPO_DIR"
git pull origin main
fi
# если есть docker-compose
if [ -f "$REPO_DIR/docker-compose.yml" ]; then
cd "$REPO_DIR"
docker compose pull || true
docker compose down || true
docker compose up -d --build
fi
# перезапуск сервисов если нужно
systemctl restart pritunl || true
