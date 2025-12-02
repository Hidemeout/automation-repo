#!/bin/bash
set -e

journalctl --vacuum-size=200M

apt autoremove -y
apt clean -y

docker system prune -af || true
