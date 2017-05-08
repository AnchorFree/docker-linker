# General description

This container provide symlinks creation from `/var/lib/docker/container/*/*.json` container logs to `/var/log/containers` folder. In current format: `CONTAINER_NAMESPACE_NAME_CONTAINER_SHORT_ID.log`

### File description

 * linker.sh - shell script which creates symlinks
 * Dockerfile - docker container make file
 * Makefile - helps you build and push docker images to Docker Hub

## Container installation

 1. Clone this repository
 2. Build and push linker image

```bash
make all && make prod
```
 3. [packer-images](https://github.com/AnchorFree/packer-images) repository helps you with container creation on host
