#!/bin/bash
set -e
# Очистка журналов
journalctl --vacuum-size=200M
# Удаление неиспользуемых пакетов
apt autoremove -y
apt clean -y
# Docker cleanup (если есть)
docker system prune -af || true
