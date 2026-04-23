#!/usr/bin/bash

set -euo pipefail
LOG=/var/log/post-install.log
exec > >(tee -a "$LOG") 2>&1

echo "=== ASL3 Post Install Starting ==="

export DEBIAN_FRONTEND=noninteractive

## Install AllStarLink Repo
curl -L -o /tmp/asl-apt-repos.deb13_all.deb \
	https://repo.allstarlink.org/public/asl-apt-repos.deb13_all.deb
dpkg -i /tmp/asl-apt-repos.deb13_all.deb
rm -f /tmp/asl-apt-repos.deb13_all.deb

## Disable the cdrom entry
sed -i 's|^deb cdrom:|#deb cdrom:|' /etc/apt/sources.list

## Now Install ASL3
apt update
apt install -y asl3 asl3-menu allmon3 asl3-appliance vim-nox make

# Create motd & issue
echo "" > /etc/issue
echo "" > /etc/issue.net

# Install non-package files
pushd /tmp/asl3
make install
popd

# Set Firstboot
touch /asl3-first-boot-needed

# Cleanup
rm -rf /tmp/asl3/
