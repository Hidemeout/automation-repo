# Automation Repo Template


Этот репозиторий содержит набор скриптов и workflows для автоматизации управления VM:


- Бэкапы MongoDB / MariaDB / Pritunl
- Авто-проверки и рестарт сервисов
- Очистка диска и логов
- GitHub Actions workflow для автоматического деплоя


## Установка на VM
1. Клонируй репозиторий в `/opt/automation`
2. Сделай скрипты исполняемыми: `chmod +x scripts/*.sh`
3. Скопируй systemd файлы: `sudo cp systemd/* /etc/systemd/system/` и включи таймер
4. Настрой crontab для backup/cleanup или используй systemd timers


## Настройки
Отредактируй `scripts/deploy.sh` — укажи реальный репозиторий и путь.


## Примечания
- Перед использованием проверь команды в скриптах, чтобы они соответствовали твоей системе
- Настрой уведомления (Telegram / Email) при необходимости
