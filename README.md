# Docker

This project contains compose files and notes for docker containers I am testing in my homelab.

## Prerequisites

- Git Set up completed (see readme in project root)
- Add current user to docker group `sudo usermod -aG docker $(whoami)`
- Reload group `newgrp docker`
- From Home dir, move docker folder from git repo to operating location

```bash
mv ~/Git/homelab/docker ~/Docker
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