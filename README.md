# Docker

This project contains compose files and notes for docker containers I am testing in my homelab.

## Prerequisites

- Git Set up completed (see readme in project root)
- Add current user to docker group `sudo usermod -aG docker $(whoami)`
- Reload group `newgrp docker`
- Create docker dir and clone repo

```sh
cd /
sudo git clone https://github.com/AdamFurlough/docker.git 
```

## Installation

- Before running any of the containers you will need to install Docker.
- run `InstallDockerDebian.sh`

## Usage

### Start all containers

From within the root dir of this repo...

```bash
docker compose up -d
```
This will use the parent compose file that includes extend statements for each container that is in use

### Start a specific container

From within the dir of the container you would like to run...

```bash
docker compose up -d
```

### Update a container

From within the dir of the container you would like to update...

```bash
docker compose pull && docker compose up -d
```

## Other Helpful Docker commands

- `docker logs traefik` show logs
- `docker compose up -d --force-recreate` good for repeat testing with changed settings
- `docker stop $(docker ps -q)` stop all running
- `docker exec -it traefik sh` enter container with sh, `exit`

## env file setup 

In order to reference multiple env files we need to use Docker include to declare custom .env locations for specific services.

For example, we have the master compose.yaml that pulls in compose.yaml for separate stacks, but it also includes the locations of .env for a couple of the services within those stacks. I was then able to use these for writing 'env_file:' within service details.

Example of master compose.yaml:

```yaml
include:

    - path: ./compose/stack1-compose.yaml 
      env_file:
        ./app1-data/.env
        ./app2-data/.env
    - path: ./compose/stack2-compose.yaml

services:
.
.
networks:
.
.
```

Example of child compose.yaml:

```yaml
services:

  app1:
    container_name: app1
    env_file:
      - ./app1-data/.env
  app2:
    container_name: app2
    env_file:
      - ./app2-data/.env
```