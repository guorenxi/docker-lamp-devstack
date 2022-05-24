#!/bin/bash

# shellcheck disable=SC2086
set -eux;

docker pull php:7.4-cli-bullseye
docker pull php:7.4-apache-bullseye
docker pull php:8.0-cli-bullseye
docker pull php:8.0-apache-bullseye
docker pull php:8.1-cli-bullseye
docker pull php:8.1-apache-bullseye

docker pull mariadb:10.3
docker pull mariadb:10.4
docker pull mariadb:10.5
docker pull mariadb:10.6
docker pull mariadb:10.7
docker pull mariadb:10.8
docker pull mariadb:10.9-rc
