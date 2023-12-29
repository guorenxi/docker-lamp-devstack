#!/bin/bash

# shellcheck disable=SC2086
set -eux;

docker pull php:8.1-cli-bookworm
docker pull php:8.1-apache-bookworm
docker pull php:8.2-cli-bookworm
docker pull php:8.2-apache-bookworm
docker pull php:8.3-cli-bookworm
docker pull php:8.3-apache-bookworm

docker pull mariadb:10.3
docker pull mariadb:10.4
docker pull mariadb:10.5
docker pull mariadb:10.6
docker pull mariadb:10.10
docker pull mariadb:10.11
docker pull mariadb:11.0
docker pull mariadb:11.1
docker pull mariadb:11.2
docker pull mariadb:11.3-rc
