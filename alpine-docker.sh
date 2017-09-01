#!/bin/sh

# add docker rep
echo -e "http://dl-cdn.alpinelinux.org/alpine/edge/community" \
    >> /etc/apk/repositories

# install docker & open-vm-tools
apk update
apk add docker \
        open-vm-tools
rc-update add docker
rc-update add open-vm-tools boot

# add alpine Java VM memory fix (only for dev, use paxctl -c -m on java inside container!)
echo -e "kernel.pax.softmode=1" \
    > /etc/sysctl.d/01-docker-java-fix.conf