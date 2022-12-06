# Обновляем систему и список пакетов
sudo apt-get update -y
# Устанавливаем нужную для выполнения скрипта софтину
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
# Устанавливаем докер и все нужные для него приколы
sudo apt-get install docker docker-compose -y
git clone https://github.com/D1epak/server.git
cd server && docker compose up -d --build
