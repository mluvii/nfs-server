#!/bin/sh

set -xe

chown 65534:65534 /data

/sbin/rpcbind -w
/usr/sbin/rpc.nfsd --debug 8 --no-udp --no-nfs-version 3
/usr/sbin/exportfs -rv
/usr/sbin/rpc.mountd --debug all --no-udp --no-nfs-version 3 -F
