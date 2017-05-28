#!/bin/bash

DOCKER_COMPOSE=$(which docker-compose)
DOCKER=$(which docker)
DANGLING=$($DOCKER images -f dangling=true -q)

function container-update() {
  if [ "$DOCKER_COMPOSE" ]; then
    $DOCKER_COMPOSE -f /etc/runner/config/docker-compose.yml -p compose pull
  else
    echo "docker-compose could not be found in this system."
  fi
}

function container-restart() {
  if [ "$DOCKER_COMPOSE" ]; then
    $DOCKER_COMPOSE -f /etc/runner/config/docker-compose.yml down
    $DOCKER_COMPOSE -f /etc/runner/config/docker-compose.yml up -d
  else
    echo "docker-compose could not be found in this system."
  fi
}

function container-clean() {
  if [ "$DOCKER" ]; then
    $DOCKER rmi $DANGLING
  else
    echo "docker could not be found in this system."
  fi
}

$@
