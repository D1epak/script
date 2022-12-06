# Обновляем систему и список пакетов
apt-get update -y
# Устанавливаем нужную для выполнения скрипта софтину
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
# Устанавливаем докер и все нужные для него приколы
apt-get install docker docker-compose -y
git clone https://github.com/D1epak/server.git
cd server && docker compose up -d --build
