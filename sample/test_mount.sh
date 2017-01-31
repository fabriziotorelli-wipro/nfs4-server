#!/bin/sh
sudo mount -rw -v -t nfs -o proto=tcp,port=2049  localhost:/ /media
ls -latr /media/
sudo umount /media
