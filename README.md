# proftpd service

[![DockerHub Badge](http://dockeri.co/image/mesaguy/proftpd)](https://hub.docker.com/r/mesaguy/proftpd)

## Introduction

Simple unprivileged proftpd service built for many architectures.

ftp runs on 10021/tcp as the user 'ftp'. By default only anonymous connections are permitted.

## Usage

Data should be mounted to or under /ftp

The /etc/proftpd/proftpd.conf configuration file may be overwritten as needed

## Usage examples

Run basic service on 21/tcp (the default ftp service port).

    docker run -p 21:10021 -v /mydata/:/ftp/ -it mesaguy/proftpd

Use a custom proftpd configuration and multiple mounts

    docker run -p 21:10021 \
        -v /mydata/:/ftp/data/ \
        -v /my-www/:/ftp/www/ \
        -v $(pwd)/proftpd.conf:/etc/proftpd/proftpd.conf \
        -it mesaguy/proftpd
