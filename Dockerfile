FROM archlinux:latest
LABEL maintainer "Xristos Zervakis"

# Avoid things that systemd does on actual hardware.
ENV container docker

# Install Ansible and related packages via pip so we get the latest version.
ENV ansible_packages "ansible ansible-lint yamllint molecule molecule-docker molecule-podman"

RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm \
    sudo \
    systemd \
  && \
  (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -vf $i; done); \
    rm -vf /lib/systemd/system/multi-user.target.wants/*; \
    rm -vf /etc/systemd/system/*.wants/*; \
    rm -vf /lib/systemd/system/local-fs.target.wants/*; \
    rm -vf /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -vf /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -vf /lib/systemd/system/basic.target.wants/*;

RUN pacman -S --noconfirm \
    python \
    python-pip \
    which \
    vim \
&& yes | pacman -Scc || true

RUN pip install --no-cache $ansible_packages

RUN mkdir -p /etc/ansible
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD [ "/lib/systemd/systemd" ]


