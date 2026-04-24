#!/usr/bin/bash

set -euo pipefail
LOG=/var/log/cloud-install.log
exec > >(tee -a "$LOG") 2>&1

echo "=== ASL3 Post Install Starting ==="

export DEBIAN_FRONTEND=noninteractive

## Install AllStarLink Repo
curl -L -o /tmp/asl-apt-repos.deb13_all.deb \
	https://repo.allstarlink.org/public/asl-apt-repos.deb13_all.deb
dpkg -i /tmp/asl-apt-repos.deb13_all.deb
rm -f /tmp/asl-apt-repos.deb13_all.deb

## Now Install ASL3
apt-get update
apt-get install -y asl3 asl3-menu allmon3 asl3-appliance vim-nox make

# Create issue
echo "" > /etc/issue
echo "" > /etc/issue.net

echo "=== ASL3 Post Install Complete ==="