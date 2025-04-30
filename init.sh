#!/bin/bash
git clone https://github.com/votre-utilisateur/ebrigade-docker.git
cd ebrigade-docker
cp .env.example .env
docker-compose up -d --build
