#!/bin/bash
set -e
source /bd_build/buildconfig
set -x

# Install scripts commonly used during setup.
$minimal_apt_get_install curl wget tar zip unzip git rsync tzdata gpg-agent runit

# Install common scripts
cp -rT /bd_build/scripts/ /usr/local/bin
chmod -R a+x /usr/local/bin

# Install runit scripts
cp -rT /bd_build/runit/. /etc/service/

chmod -R +x /etc/service

# Install scripts commonly used during setup.
$minimal_apt_get_install curl wget tar zip unzip git rsync tzdata gpg-agent openssh-client

# Run service setup for all setup scripts
for f in /bd_build/setup/*.sh; do
  bash "$f" -H 
done

# Run service setup for all setup scripts
for f in /bd_build/setup/*.sh; do
  bash "$f" -H 
done