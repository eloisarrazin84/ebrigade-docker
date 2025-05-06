#!/bin/bash
git clone https://github.com/eloisarrazin84/ebrigade-docker.git
cd ebrigade-docker
cp .env.example .env
docker-compose up -d --build
