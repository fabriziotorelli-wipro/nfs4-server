NFS4 Server
================

Uses :

[NFS v4 server](http://nfs.sourceforge.net/) server running on [Alpine Linux](https://hub.docker.com/_/alpine/).

### Table of Contents
* [Prerequisites](#Prerequisites)
* [Before you start](#Configuration)
* [Start Server](#Start-server)
* [Set your own exports](#Set-your-own-exports)
* [Stop Server](#Stop-server)
* [Troubleshoot & Debug](#Troubleshoot-&-Debug)
* [General Info](#General-Info)


### Prerequisites
[**Get docker !**](https://docs.docker.com/linux/started/)


### Configuration
The server uses a generic export file (exports) with-in the mount points and the relative disk capping.
You have to define a docker compose, the volume within your export file and the share of the mount points defined in the export files, then the image and the

## Quickstart

Here an example of the configuration :

docker-compose.yml
```
nfs4-server:
  image: nfs4-server:1.0
  container_name: nfs-server

  # Required to load kernel NFS module
  privileged: true

  volumes:
    # You must provide an exports config file
    - ./exports:/etc/exports

    # Shares
    - /mnt:/mnt
    - /mnt/nfs/volume:/mnt/volume
    - /mnt/nfs/backup:/mnt/backup

  ports:
    - "111:111/tcp"
    - "111:111/udp"
    - "2049:2049/tcp"
    - "2049:2049/udp"
```

exports :
```
/mnt		*(rw,fsid=0,root_squash,no_subtree_check,insecure)
/mnt/volume		*(rw,fsid=0,root_squash,no_subtree_check,insecure)
/mnt/backup		*(rw,fsid=0,root_squash,no_subtree_check,insecure)
```

In this way in your DNS4 Server you will have a share of three folders :
* /nfs
* /volume
* /backup
