#!/bin/bash
set -e

echo "[DEPLOY] Старт деплоя..."

cd /opt/automation || exit 1
git pull

docker compose down || true
docker compose up -d --build

echo "[DEPLOY] Деплой завершён успешно!"
