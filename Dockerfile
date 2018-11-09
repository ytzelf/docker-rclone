FROM phusion/baseimage:0.11

MAINTAINER ytzelf
ENV ARCH=amd64 \
    RCLONE_VERSION=current \
    RCLONE_DOWNLOAD=http://downloads.rclone.org

CMD ["/sbin/my_init"]

RUN apt install wget \
    && cd /tmp \
    && wget -q ${RCLONE_DOWNLOAD}/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
    && unzip /tmp/rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
    && mv /tmp/rclone-*-linux-${ARCH}/rclone /usr/bin \
    && rm -r /tmp/rclone-*-linux-${ARCH}/

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
