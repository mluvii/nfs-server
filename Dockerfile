FROM alpine:latest
LABEL source "https://github.com/mluvii/nfs-server"
LABEL branch "master"

RUN apk add --no-cache --update --verbose nfs-utils bash iproute2 && \
    rm -rf /var/cache/apk /tmp /sbin/halt /sbin/poweroff /sbin/reboot && \
    mkdir -p /var/lib/nfs/rpc_pipefs /var/lib/nfs/v4recovery && \
    echo "rpc_pipefs    /var/lib/nfs/rpc_pipefs rpc_pipefs      defaults        0       0" >> /etc/fstab && \
    echo "nfsd  /proc/fs/nfsd   nfsd    defaults        0       0" >> /etc/fstab

VOLUME /data
EXPOSE 2049
EXPOSE 111/udp

WORKDIR /app
COPY entrypoint.sh .
COPY exports /etc/exports

ENTRYPOINT ["/app/entrypoint.sh"]