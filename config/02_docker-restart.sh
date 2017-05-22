#!/bin/bash
/usr/local/bin/docker-compose -f /etc/runner/config/docker-compose.yml down
/usr/local/bin/docker-compose -f /etc/runner/config/docker-compose.yml up -d

