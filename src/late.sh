#!/bin/sh
exec > /target/tmp/late.log 2>&1
set -x

MP=$([ -d /hd-media ] && echo /hd-media || echo /cdrom)
cp $MP/post-install.sh /target/tmp/post-install.sh
cp -r $MP/asl3 /target/tmp/
chmod +x /target/tmp/post-install.sh
in-target /tmp/post-install.sh