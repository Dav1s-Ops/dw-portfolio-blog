#!/bin/bash

# Script to run docker-compose for development w/ var
docker compose -f docker-compose.dev.yml "$@"