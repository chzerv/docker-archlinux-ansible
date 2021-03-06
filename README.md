# Archlinux Image for Ansible Testing

>**NOTE**: This image is now  **DEPRECATED**: Use:
>+ [archlinux-systemd-ansible](https://github.com/chzerv/archlinux-systemd-ansible)

![Build](https://github.com/chzerv/docker-archlinux-ansible/workflows/Build/badge.svg?branch=master)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/chzerv/docker-archlinux-ansible)

This Dockerfile builds an Archlinux based container, capable to use `systemd`, with Ansible and Ansible
testing tools pre-installed.

# Branches/Tags

| Branch | Distribution version | Image tag |
| :----: | :------------------: | :-------: |
| master |        latest        |  latest   |

# How to build locally

1. Install [Docker](https://docs.docker.com/engine/install/) or [Podman](https://podman.io/getting-started/installation.html).
2. Clone the repository: `git clone https://github.com/chzerv/docker-archlinux-ansible.git`.
3. `cd` into the directory and run `docker build -t archlinux-ansible .`

# How to use

1. Install [Docker](https://docs.docker.com/engine/install/) or [Podman](https://podman.io/getting-started/installation.html).
2. Pull this image from _Docker hub_: `docker pull chzerv/docker-archlinux-ansible:latest` (or use the 
   image you built locally).
3. Run a container:

   ```shell
   docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro docker-archlinux-ansible:latest
   ```

4. Run Ansible inside that container:

   ```shell
   docker exec -it $container_id ansible --version
   ```
