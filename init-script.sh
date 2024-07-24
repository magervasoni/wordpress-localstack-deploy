#!/bin/bash

# Instala Docker
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-compose

# Cria Docker Compose file
cat <<EOF > /home/${var.admin_username}/docker-compose.yml
version: '3.1'

services:
  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: GAud4mZby8F3SD6P

  wordpress:
    image: wordpress:latest
    restart: always
    ports:
      - 80:80
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: root
      WORDPRESS_DB_PASSWORD: GAud4mZby8F3SD6P
EOF

# Start Docker Compose
sudo docker-compose -f /home/${var.admin_username}/docker-compose.yml up -d
