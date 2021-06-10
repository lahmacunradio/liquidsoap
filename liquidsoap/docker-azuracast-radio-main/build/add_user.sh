#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

$minimal_apt_get_install sudo

# Workaround for sudo errors in containers, see: https://github.com/sudo-project/sudo/issues/42
echo "Set disable_coredump false" >> /etc/sudo.conf

mkdir -p /var/azuracast/servers/shoutcast2 /var/azuracast/stations /var/azuracast/www_tmp 

adduser --home /var/azuracast --disabled-password --gecos "" azuracast

chown -R azuracast:azuracast /var/azuracast

echo 'azuracast ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers