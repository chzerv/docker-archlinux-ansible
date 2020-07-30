# Container image: Archlinux Ansible

[![Build Status](https://travis-ci.com/chzerv/docker-archlinux-ansible.svg?branch=master)](https://travis-ci.com/chzerv/docker-archlinux-ansible)

This Dockerfile builds an Archlinux-based container with Ansible and other Ansible testing tools pre-intalled.

# Branches/Tags

| Branch | Distribution version | Image tag |
| :----: | :------------------: | :-------: |
| master |        latest        |  latest   |

# How to build locally

1. Install [Docker](https://docs.docker.com/engine/install/) or [Podman](https://podman.io/getting-started/installation.html).
2. Clone the repository: `git clone https://github.com/chzerv/docker-archlinux-ansible.git`.
3. `cd` into the directory and run `docker build -t archlinux-ansible`

# How to use

1. Install [Docker](https://docs.docker.com/engine/install/) or [Podman](https://podman.io/getting-started/installation.html).
2. Pull this image from _Docker hub_: `docker pull chzerv/docker-archlinux-ansible:latest`.
3. Run a container:

   ```shell
   docker run -d --privileged --volume=/sys/fs/cgroup:/sys/fs/cgroup:ro docker-archlinux-ansible:latest
   ```

4. Run Ansible inside that container:

   ```shell
   docker exec -it $container_id ansible --version
   ```
