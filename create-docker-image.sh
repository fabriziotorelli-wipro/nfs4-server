#!/bin/sh
ln -s /vagrant/nfs /mnt/nfs
ln -s /vagrant/nfs/volume /mnt/volume
ln -s /vagrant/nfs/backup /mnt/backup
sudo docker build --rm --force-rm --tag nfs4-server:1.0 ./
