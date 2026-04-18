#!/bin/sh
MP=$([ -d /hd-media ] && echo /hd-media || echo /cdrom)
cp $MP/post-install.sh /tmp/
cp -r $MP/asl3/ /tmp/asl3/
chmod +x /tmp/post-install.sh
exit 0
