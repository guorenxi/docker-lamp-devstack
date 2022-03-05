#!/bin/bash

# shellcheck disable=SC2086
set -eux;

cd "$(dirname $0)";

### PHP 8.0
if [ "${NO_PULL:-0}" -ne "1" ]; then
    docker pull php:8.0-cli-bullseye
    docker run --rm php:8.0-cli-bullseye php --version
fi

if [ "${NO_BUILD:-0}" -ne "1" ]; then
    docker build --progress plain -f ./Dockerfile-8.0-cli -t jakubboucek/lamp-devstack-php:8.0-cli ./
    PHP_RELEASE=$(docker run --rm jakubboucek/lamp-devstack-php:8.0-cli php -r "echo PHP_RELEASE_VERSION;")
    docker tag jakubboucek/lamp-devstack-php:8.0-cli jakubboucek/lamp-devstack-php:8.0.${PHP_RELEASE}-cli
fi

if [ "${NO_TEST:-0}" -ne "1" ]; then
    docker run --rm jakubboucek/lamp-devstack-php:8.0-cli php --version
    docker run --rm jakubboucek/lamp-devstack-php:8.0-cli php -r "echo implode(', ', get_loaded_extensions()) . PHP_EOL;"
    docker run --rm jakubboucek/lamp-devstack-php:8.0-cli php -r "var_export(gd_info()) . PHP_EOL;"
fi

if [ "${NO_PUSH:-0}" -ne "1" ]; then
    PHP_RELEASE=$(docker run --rm jakubboucek/lamp-devstack-php:8.0-cli php -r "echo PHP_RELEASE_VERSION;")
    docker push jakubboucek/lamp-devstack-php:8.0.${PHP_RELEASE}-cli
    docker push jakubboucek/lamp-devstack-php:8.0-cli
fi
