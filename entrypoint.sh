# Обновляем систему и список пакетов
sudo apt-get update -y
# Устанавливаем нужную для выполнения скрипта софтину
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y
sudo rm -rf -r /etc/apt/keyrings
# Создаем папку для хранения ключей нужных для работы сборщика
sudo mkdir -p /etc/apt/keyrings
# Берем с серверов докера ключи для безопасной установки
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
# проверяем скрипт и ставим нужные разрешения куда надо
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# Считываем новые пакеты
# Устанавливаем сразу нужные права на ключ докера, дабы избежать проблем
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# Еще раз считываем пакеты уже перед финальной сборкой всего
sudo apt-get update -y
# Устанавливаем докер и все нужные для него приколы
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

git clone https://github.com/D1epak/server.git
cd server && docker compose up -d --build
