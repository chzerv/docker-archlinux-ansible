FROM archlinux:latest
MAINTAINER "Xristos Zervakis"

# Install Ansible and related packages via pip so we get the latest version.
ENV ansible_packages "ansible ansible-lint yamllint molecule molecule-containers"

RUN pacman -Syu --noconfirm

RUN pacman -S --noconfirm \
    sudo \
    python \
    python-pip \
    which \
    vim

RUN pip install $ansible_packages

RUN mkdir -p /etc/ansible
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD [ "/lib/systemd/systemd" ]

