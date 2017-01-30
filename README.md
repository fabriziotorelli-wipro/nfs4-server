NFS4 Server
===========

[On Github](https://github.com/fabriziotorelli-wipro/nfs4-server.git)

Uses :

[NFS v4 server](http://nfs.sourceforge.net/) server running on [Alpine Linux](https://hub.docker.com/_/alpine/).


### Prerequisites
[**Get docker !**](https://docs.docker.com/linux/started/)


## Configuration

The server uses a generic export file (exports) with-in the mount points and the relative disk capping.
You have to define a docker compose, the volume within your export file and the share of the mount points defined in the export files, then the image and the port exports as shown in the provided [**example**](/sample)


## Issues

[Open an issue](https://github.com/fabriziotorelli-wipro/nfs4-server/issues)


## Build the image

There is not yet any registration in the docker hub, however you can follow the example and use the script file [create-docker-image.sh](/create-docker-image.sh).


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


## Test

To test the NFS4 Server Example on ubuntu :
* update the ubuntu packages cache `apt-get update`
* install the nfs-common package `apt-get install -y nfs-common`
* clean your system libraries cache by unused space :
```
apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/*
```
* mount the nfs path from the server : (eg. on the same machine : `mount -rw -v -t nfs -o proto=tcp,port=2049  localhost:/ /media`)


## License

[MIT](/LICENSE.md)
