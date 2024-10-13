#!/bin/bash

#Script to start a shell sesion in container
docker compose -f docker-compose.dev.yml exec web bash