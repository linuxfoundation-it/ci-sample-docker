# Ansible Alpine + Java 11, Maven 3.6.1

# OpenJDK: Only supports Ubuntu

# Starting FROM williamyeh/ansible:alpine3
#  https://github.com/William-Yeh/docker-ansible/blob/master/alpine3/Dockerfile
FROM python:3-alpine

RUN apk add --no-cache sudo openssl && \
    apk add --no-cache --virtual .build-deps \
       python3-dev \
       libffi-dev \
       openssl-dev \
       libgpg-error \
       libgcrypt \
       libxml2 \
       libxslt \
       py3-lxml \
       make \
       build-base                                               && \
    apk add --no-cache sshpass openssh-client rsync             && \
    apk add --no-cache curl bash procps

RUN pip3 install --upgrade pip cffi pynacl                    && \
    pip3 install --upgrade ansible                            && \
    pip3 install --upgrade pycrypto pywinrm                   && \
    pip3 install --upgrade setuptools wheel                   && \
    pip3 install --upgrade tox                                && \
    pip3 install --upgrade twine                              && \
    mkdir -p /etc/ansible                                     && \
    echo 'localhost' > /etc/ansible/hosts
