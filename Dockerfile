FROM alpine:3.5

MAINTAINER Philipp Schmitt <philipp@schmitt.co>

ENV RCLONE_VERSION=current
ENV ARCH=amd64

RUN apk --no-cache add ca-certificates fuse wget \
    && cd /tmp \
    && wget -q http://downloads.rclone.org/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
    && unzip /tmp/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
    && mv /tmp/rclone-*-linux-${ARCH}/rclone /usr/bin \
    && rm -r /tmp/rclone* \
    && addgroup rclone \
    && adduser -h /config -s /bin/ash -G rclone -D rclone
    && mkdir /data

USER rclone

VOLUME ["/config/rclone.conf"]
VOLUME ["/data"]

ENTRYPOINT ["/usr/bin/rclone"]

CMD ["--version"]