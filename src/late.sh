#/bin/sh
cp /tmp/post-install.sh /target/tmp/post-install.sh
cp -r /tmp/asl3/ /target/tmp/asl3
chmod +x /target/tmp/post-install.sh
in-target /tmp/post-install.sh
