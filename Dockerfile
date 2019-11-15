FROM phusion/baseimage:0.11

MAINTAINER ytzelf

# ENV ARCH=amd64
# ENV RCLONE_VERSION=1.50.1
# ENV RCLONE_DOWNLOAD='http://downloads.rclone.org'

CMD ["/sbin/my_init"]

RUN apt-get update \
    && apt-get --assume-yes install wget unzip \
    && cd /tmp \
    && wget -q http://downloads.rclone.org/v1.50.1/rclone-v1.50.1-linux-amd64.zip \
#    && wget -q ${RCLONE_DOWNLOAD}/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-${ARCH}.zip \
    && unzip /tmp/rclone-v1.50.1-linux-amd64.zip \
    && mv /tmp/rclone-*-linux-*/rclone /usr/bin

RUN rm -r /tmp/rclone-* \
    && apt-get --assume-yes purge wget unzip \
    && apt-get --assume-yes autoremove \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
